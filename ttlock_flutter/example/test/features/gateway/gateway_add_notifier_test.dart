import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/config/app_site.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/gateway/data/repository/gateway_repository.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/entity/gateway.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/repository/gateway_repository_interface.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/provider/gateway_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/provider/gateway_add_state.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/data/app_config_repository.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

import '../../helpers/mock_tt_lock_api.dart';

class _MockGatewayRepo extends Mock implements GatewayRepositoryInterface {}

/// T2 同款 Fake：class Provider 必须可构造，转发到 mock。
class _FakeGatewayRepoProvider extends GatewayRepository
    implements GatewayRepositoryInterface {
  _FakeGatewayRepoProvider(this._mock);
  final _MockGatewayRepo _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, PageState<GatewayEntity>> list({
    int pageNo = 1,
    int pageSize = 20,
    int orderBy = 0,
  }) => _mock.list(pageNo: pageNo, pageSize: pageSize, orderBy: orderBy);

  @override
  TaskEither<AppException, GatewayEntity> detail(int gatewayId) =>
      _mock.detail(gatewayId);

  @override
  TaskEither<AppException, Unit> rename(int gatewayId, String name) =>
      _mock.rename(gatewayId, name);

  @override
  TaskEither<AppException, Unit> delete(int gatewayId) =>
      _mock.delete(gatewayId);

  @override
  TaskEither<AppException, List<GatewayEntity>> listByLock(int lockId) =>
      _mock.listByLock(lockId);

  @override
  TaskEither<AppException, int> confirmInitSuccess(String gatewayNetMac) =>
      _mock.confirmInitSuccess(gatewayNetMac);
}

class _FakeUserProvider extends UserProvider {
  _FakeUserProvider(this.session);
  UserSession? session;

  @override
  UserSession? build() => session;
}

/// AppConfig 仓储 Fake：class Provider 必须可构造子类；站点固定 AppSite.cn。
/// `build()` 置空即可——`_loader` / `_storage` 只被 `load()` / `save()` 读取，
/// 两者均被覆盖。
class _FakeAppConfigRepository extends AppConfigRepository {
  @override
  void build() {}

  @override
  TaskEither<AppException, AppConfig> load() =>
      TaskEither.right(const AppConfig(site: AppSite.cn));

  @override
  TaskEither<AppException, void> save(AppConfig config) =>
      TaskEither.right(null);
}

TTGatewayScanModel _scan(
  String mac, {
  TTGatewayType type = TTGatewayType.g2,
}) => testGatewayScan(
  gatewayName: 'GW',
  gatewayMac: mac,
  rssi: -50,
  type: type,
);

GatewayDeviceInfo _device(String netMac) => GatewayDeviceInfo(
  modelNum: 'M',
  hardwareRevision: 'H',
  firmwareRevision: 'F',
  networkMac: netMac,
);

void main() {
  late MockTTGatewayApi ttlock;
  late _MockGatewayRepo repo;
  late _FakeUserProvider fakeUser;
  late ProviderContainer container;
  late GatewayAddNotifier notifier;

  setUpAll(() {
    registerGatewayFallbacks();
  });

  setUp(() {
    ttlock = MockTTGatewayApi();
    TTLock.setImplementations(gatewayApi: ttlock);
    repo = _MockGatewayRepo();
    fakeUser = _FakeUserProvider(
      const UserSession(accessToken: 't', refreshToken: 'r', uid: 10001),
    );
    container = ProviderContainer(
      overrides: [
        gatewayRepositoryProvider.overrideWith(
          () => _FakeGatewayRepoProvider(repo),
        ),
        userProvider.overrideWith(() => fakeUser),
        appConfigRepositoryProvider.overrideWith(_FakeAppConfigRepository.new),
        gatewayAddProvider.overrideWith(
          () => GatewayAddNotifier(pollInterval: Duration.zero),
        ),
      ],
    );
    notifier = container.read(gatewayAddProvider.notifier);
    // 模拟页面 watch：保持 autoDispose provider 在 await 间隙不被回收。
    container.listen(gatewayAddProvider, (_, _) {});

    when(
      () => ttlock.connect(any()),
    ).thenAnswer((_) async => TTGatewayConnectStatus.success);
    when(
      () => ttlock.gatewayGetNearbyWifi(gatewayMac: any(named: 'gatewayMac')),
    ).thenAnswer((_) => const Stream<TTWifiScanResult>.empty());
    when(() => ttlock.disconnect(any())).thenAnswer((_) async {});
    when(() => ttlock.init(any())).thenAnswer((_) async => _device('NET:01'));
  });

  tearDown(() {
    container.dispose();
    BleGuard.reset();
    TTLock.configurePigeon();
  });

  Future<void> toCredentialStep() async {
    await notifier.pick(_scan('AA:G2'));
    await notifier.selectWifi((name: 'Home', rssi: -40));
  }

  test('pick → connect 失败进 failure，不进入 wifi', () async {
    when(
      () => ttlock.connect('AA:G2'),
    ).thenAnswer((_) async => TTGatewayConnectStatus.timeout);

    await notifier.pick(_scan('AA:G2'));

    final step = notifier.state.value!.step;
    expect(step, isA<GatewayAddStepFailure>());
  });

  test('G2 pick → connect 成功进入 wifi 步骤并扫描附近 WiFi', () async {
    await notifier.pick(_scan('AA:G2'));

    final state = notifier.state.value!;
    expect(state.step, isA<GatewayAddStepWifi>());
    expect(state.gatewayType, TTGatewayType.g2);
    verify(
      () => ttlock.gatewayGetNearbyWifi(gatewayMac: 'AA:G2'),
    ).called(1);
  });

  test('G3 pick → 不提前 connect，直接进入凭据步骤', () async {
    await notifier.pick(_scan('AA:G3', type: TTGatewayType.g3));

    final state = notifier.state.value!;
    expect(state.step, isA<GatewayAddStepCredential>());
    expect((state.step as GatewayAddStepCredential).wifi, isNull);
    expect(state.gatewayType, TTGatewayType.g3);
    verifyNever(() => ttlock.connect(any()));
    verifyNever(
      () => ttlock.gatewayGetNearbyWifi(gatewayMac: any(named: 'gatewayMac')),
    );
  });

  test('G4 pick → 不提前 connect，直接进入凭据步骤', () async {
    await notifier.pick(_scan('AA:G4', type: TTGatewayType.g4));

    final state = notifier.state.value!;
    expect(state.step, isA<GatewayAddStepCredential>());
    expect(state.gatewayType, TTGatewayType.g4);
    verifyNever(() => ttlock.connect(any()));
    verifyNever(
      () => ttlock.gatewayGetNearbyWifi(gatewayMac: any(named: 'gatewayMac')),
    );
  });

  test('G3 submit：先 connect 再 init，且不带 wifi/wifiPassword', () async {
    when(
      () => repo.confirmInitSuccess('Cell Gate'),
    ).thenAnswer((_) => TaskEither.right(9));

    await notifier.pick(_scan('AA:G3', type: TTGatewayType.g3));
    await notifier.submit(
      gatewayName: 'Cell Gate',
      wifiPassword: 'ignored',
      loginPassword: 'raw',
    );

    final step = notifier.state.value!.step;
    expect(step, isA<GatewayAddStepDone>());
    verifyInOrder([
      () => ttlock.connect('AA:G3'),
      () => ttlock.init(
            any(
              that: isA<TTGatewayInitParams>()
                  .having((p) => p.type, 'type', TTGatewayType.g3)
                  .having((p) => p.wifi, 'wifi', isNull)
                  .having((p) => p.wifiPassword, 'wifiPassword', isNull)
                  .having((p) => p.gatewayName, 'gatewayName', 'Cell Gate'),
            ),
          ),
    ]);
  });

  test('submit 链：connect→选 wifi→凭据→init→disconnect→轮询 confirm→done', () async {
    when(
      () => repo.confirmInitSuccess('Front Gate'),
    ).thenAnswer((_) => TaskEither.right(42));

    await toCredentialStep();
    await notifier.submit(
      gatewayName: 'Front Gate',
      wifiPassword: 'pwd',
      loginPassword: 'raw',
    );

    final step = notifier.state.value!.step;
    expect(step, isA<GatewayAddStepDone>());
    expect((step as GatewayAddStepDone).gatewayId, 42);
    verify(() => ttlock.disconnect('AA:G2')).called(1);
    verify(
      () => ttlock.init(
        any(
          that: isA<TTGatewayInitParams>()
              .having((p) => p.ttlockUid, 'ttlockUid', 10001)
              .having((p) => p.type, 'type', TTGatewayType.g2)
              .having((p) => p.gatewayName, 'gatewayName', 'Front Gate')
              .having((p) => p.wifi, 'wifi', 'Home')
              .having((p) => p.wifiPassword, 'wifiPassword', 'pwd')
              // 与登录同款小写 32 位 MD5：SDK 的 getMd5UserPwd() 只在长度≠32
              // 时才自行散列，传明文会被原样当作已散列值下发。
              .having(
                (p) => p.ttlockLoginPassword,
                'ttlockLoginPassword',
                'bdd166af3a63f7be696dd17a218a6ffb',
              ),
        ),
      ),
    ).called(1);
  });

  test('网关 init 不下发 serverIp / serverPort（配网走 SDK 默认服务器）', () async {
    when(
      () => repo.confirmInitSuccess('Front Gate'),
    ).thenAnswer((_) => TaskEither.right(42));

    await toCredentialStep();
    await notifier.submit(
      gatewayName: 'Front Gate',
      wifiPassword: 'pwd',
      loginPassword: 'raw',
    );

    final params =
        verify(() => ttlock.init(captureAny())).captured.single
            as TTGatewayInitParams;
    // 站点端点仍会被解析，但只作为「解析失败即中止」的门控，不写进 init 参数；
    // 两字段留空时 SDK 取自身默认服务器（plug.sciener.cn:2999）。
    expect(params.serverIp, isNull);
    expect(params.serverPort, isNull);
  });

  test('confirmInit 轮询 36 次仍未注册 → failure', () async {
    when(
      () => repo.confirmInitSuccess('Front Gate'),
    ).thenAnswer((_) => TaskEither.right(0));

    await toCredentialStep();
    await notifier.submit(
      gatewayName: 'Front Gate',
      wifiPassword: 'pwd',
      loginPassword: 'raw',
    );

    verify(() => repo.confirmInitSuccess('Front Gate')).called(36);
    expect(notifier.state.value!.step, isA<GatewayAddStepFailure>());
  });

  test('confirmInit 中途网络错误不中止轮询，后续成功 → done', () async {
    var call = 0;
    when(() => repo.confirmInitSuccess('Front Gate')).thenAnswer((_) {
      call += 1;
      return call < 3
          ? TaskEither<AppException, int>.left(
              AppException.network(exception: Object(), message: 'net'),
            )
          : TaskEither<AppException, int>.right(7);
    });

    await toCredentialStep();
    await notifier.submit(
      gatewayName: 'Front Gate',
      wifiPassword: 'pwd',
      loginPassword: 'raw',
    );

    verify(() => repo.confirmInitSuccess('Front Gate')).called(3);
    final step = notifier.state.value!.step;
    expect(step, isA<GatewayAddStepDone>());
    expect((step as GatewayAddStepDone).gatewayId, 7);
  });

  test('confirmInit 全程网络错误仍轮询满 36 次 → failure', () async {
    when(() => repo.confirmInitSuccess('Front Gate')).thenAnswer(
      (_) => TaskEither<AppException, int>.left(
        AppException.network(exception: Object(), message: 'net'),
      ),
    );

    await toCredentialStep();
    await notifier.submit(
      gatewayName: 'Front Gate',
      wifiPassword: 'pwd',
      loginPassword: 'raw',
    );

    verify(() => repo.confirmInitSuccess('Front Gate')).called(36);
    expect(notifier.state.value!.step, isA<GatewayAddStepFailure>());
  });

  test('confirmInit 用自定义网关名称作确认键，而非 init 返回的 netMac', () async {
    when(
      () => repo.confirmInitSuccess('Front Gate'),
    ).thenAnswer((_) => TaskEither.right(42));

    await toCredentialStep();
    await notifier.submit(
      gatewayName: '  Front Gate  ',
      wifiPassword: 'pwd',
      loginPassword: 'raw',
    );

    // 文档：APP SDK init 若未以 netMac 作网关名称，isInitSuccess 需传自定义名称。
    // init 返回的 netMac 是 NET:01，名称按 init 同款 trim 后下发。
    verify(() => repo.confirmInitSuccess('Front Gate')).called(1);
    verifyNever(() => repo.confirmInitSuccess('NET:01'));
    expect(notifier.state.value!.step, isA<GatewayAddStepDone>());
  });

  test('uid 会话为空 → 直接 failure，不发起 init', () async {
    fakeUser.session = null;
    container.invalidate(userProvider);

    await toCredentialStep();
    await notifier.submit(
      gatewayName: 'Front Gate',
      wifiPassword: 'pwd',
      loginPassword: 'raw',
    );

    expect(notifier.state.value!.step, isA<GatewayAddStepFailure>());
    verifyNever(() => ttlock.init(any()));
  });

  test('扫描按 mac 去重并跳过 DFU 设备', () async {
    final controller = StreamController<TTGatewayScanModel>();
    when(() => ttlock.gatewayStartScan()).thenAnswer((_) => controller.stream);

    await notifier.startScan();
    controller.add(_scan('AA:1'));
    controller.add(_scan('AA:1'));
    controller.add(
      TTGatewayScanModel(
        gatewayName: 'DFU',
        gatewayMac: 'AA:2',
        rssi: -60,
        isDfuMode: true,
        type: TTGatewayType.g2,
      ),
    );
    await controller.close();
    await pumpEventQueue();

    final step = notifier.state.value!.step;
    expect(step, isA<GatewayAddStepScanning>());
    expect((step as GatewayAddStepScanning).devices.keys, ['AA:1']);
  });
}
