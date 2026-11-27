import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/config/app_site.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/data/model/water_meter_dto.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/data/repository/water_meter_repository.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/provider/water_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_cat_one_info.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_firmware.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_operation_record.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config_domain.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

class _MockRepo extends Mock implements WaterMeterRepository {}

class _MockWaterMeterApi extends Mock implements TTWaterMeterApi {}

class _FakeRepo extends WaterMeterRepository {
  _FakeRepo(this._mock);
  final _MockRepo _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, int> add({
    required String mac,
    required String name,
  }) => _mock.add(mac: mac, name: name);

  @override
  TaskEither<AppException, Unit> delete({required int waterMeterId}) =>
      _mock.delete(waterMeterId: waterMeterId);

  @override
  TaskEither<AppException, PageState<WaterMeterEntity>> list({
    int pageNo = 1,
    int pageSize = 20,
    int? groupId,
    String? searchStr,
  }) => _mock.list(
    pageNo: pageNo,
    pageSize: pageSize,
    groupId: groupId,
    searchStr: searchStr,
  );

  @override
  TaskEither<AppException, WaterMeterEntity> detail(int meterId) =>
      _mock.detail(meterId);

  @override
  TaskEither<AppException, Unit> rename(int meterId, String name) =>
      _mock.rename(meterId, name);

  @override
  TaskEither<AppException, Unit> recharge(
    int meterId, {
    required double amount,
    required double m3,
  }) => _mock.recharge(meterId, amount: amount, m3: m3);

  @override
  TaskEither<AppException, Unit> controlOnOff(
    int meterId, {
    required bool on,
  }) => _mock.controlOnOff(meterId, on: on);

  @override
  TaskEither<AppException, Unit> updatePrice(
    int meterId, {
    required double price,
  }) => _mock.updatePrice(meterId, price: price);

  @override
  TaskEither<AppException, List<WaterMeterRecordEntity>> listRecords(
    int meterId, {
    required int dateType,
    required String dateStr,
  }) => _mock.listRecords(meterId, dateType: dateType, dateStr: dateStr);

  @override
  TaskEither<AppException, Unit> syncState(int meterId) =>
      _mock.syncState(meterId);

  @override
  TaskEither<AppException, Unit> configCatOneInfo(
    int meterId, {
    required String catOneNodeId,
    required String catOneCardNumber,
    required String catOneOperator,
    required String catOneImsi,
    required int catOneRssi,
    String? catOneApn,
  }) => _mock.configCatOneInfo(
    meterId,
    catOneNodeId: catOneNodeId,
    catOneCardNumber: catOneCardNumber,
    catOneOperator: catOneOperator,
    catOneImsi: catOneImsi,
    catOneRssi: catOneRssi,
    catOneApn: catOneApn,
  );
  @override
  TaskEither<AppException, PaginatedOperationRecords> listOperationRecords({
    required int waterMeterId,
    int pageNo = 1,
    int pageSize = 20,
    String? recordType,
  }) => _mock.listOperationRecords(
    waterMeterId: waterMeterId,
    pageNo: pageNo,
    pageSize: pageSize,
    recordType: recordType,
  );

  @override
  TaskEither<AppException, MeterCatOneInfoEntity> catOneInfo({
    required int waterMeterId,
  }) => _mock.catOneInfo(waterMeterId: waterMeterId);

  @override
  TaskEither<AppException, MeterFirmwareEntity> firmwareInfo({
    required int waterMeterId,
  }) => _mock.firmwareInfo(waterMeterId: waterMeterId);

  @override
  TaskEither<AppException, Unit> clear({required int waterMeterId}) =>
      _mock.clear(waterMeterId: waterMeterId);

  @override
  TaskEither<AppException, Unit> updatePayMode({
    required int waterMeterId,
    required int payMode,
    double? price,
  }) => _mock.updatePayMode(
    waterMeterId: waterMeterId,
    payMode: payMode,
    price: price,
  );

  @override
  TaskEither<AppException, Unit> updateTotal({
    required int waterMeterId,
    required double totalKwh,
  }) => _mock.updateTotal(waterMeterId: waterMeterId, totalKwh: totalKwh);
}

class _FakeUserProvider extends UserProvider {
  _FakeUserProvider(this.session);
  final UserSession? session;

  @override
  UserSession? build() => session;
}

class _FakeAppConfigDomain extends AppConfigDomain {
  _FakeAppConfigDomain(this._config);
  final AppConfig _config;

  @override
  TaskEither<AppException, AppConfig> load() => TaskEither.right(_config);
}

void main() {
  late _MockRepo repo;
  late _MockWaterMeterApi waterMeterApi;
  late ProviderContainer container;
  late WaterMeterDomain domain;

  const config = AppConfig(
    clientId: 'cid',
    clientSecret: 'sec',
    site: AppSite.cn,
  );
  const overseasConfig = AppConfig(
    clientId: 'cid',
    clientSecret: 'sec',
    site: AppSite.overseas,
  );
  final scan = TTMeterScanModel(
    name: 'WM-1',
    mac: 'AA:W1',
    rssi: -48,
    isInited: false,
    type: 1,
  );

  /// 4G（Cat.1）表：云端 detail 返回可判定 catOne 的能力位。
  const catOneMeter = WaterMeterEntity(waterMeterId: 7, featureValue: 'fv-4g');

  /// 设备侧回读的模块网络信息（configCatOneInfo 的数据来源）。
  final deviceInfo = WaterMeterDeviceInfo(
    catOneNodeId: '860717087140669',
    catOneCardNumber: '898604081225D0033738',
    catOneOperator: 'CHINA MOBILE',
    catOneImsi: '460042888134165',
    catOneRssi: 27,
  );

  ProviderContainer makeContainer({
    AppConfig appConfig = config,
    UserSession? session = const UserSession(
      accessToken: 'tk',
      refreshToken: 'r',
      uid: 10001,
    ),
  }) => ProviderContainer(
    overrides: [
      waterMeterRepositoryProvider.overrideWith(() => _FakeRepo(repo)),
      userProvider.overrideWith(() => _FakeUserProvider(session)),
      appConfigDomainProvider.overrideWith(
        () => _FakeAppConfigDomain(appConfig),
      ),
    ],
  );

  setUpAll(() {
    registerFallbackValue(
      TTWaterMeterInitParam(
        mac: '',
        name: '',
        payMode: TTMeterPayMode.postpaid,
        price: 0,
      ),
    );
    registerFallbackValue(TTWaterMeterFeature.catOne);
    registerFallbackValue(TTMeterPayMode.postpaid);
  });

  setUp(() {
    repo = _MockRepo();
    waterMeterApi = _MockWaterMeterApi();
    TTLock.setImplementations(waterMeterApi: waterMeterApi);
    container = makeContainer();
    domain = container.read(waterMeterDomainProvider.notifier);

    // url 随站点变化，具体取值由「基础链路」用例逐字断言。
    when(
      () => waterMeterApi.waterMeterSetClientParam(any(), 'cid', 'tk'),
    ).thenAnswer((_) async {});
    // connect 仅绑定时需要；已绑定表的指令不连不断，故不 stub disconnect。
    when(() => waterMeterApi.waterMeterConnect(any())).thenAnswer((_) async {});
    when(
      () => waterMeterApi.waterMeterIsSupportFunction(any(), any()),
    ).thenAnswer((_) async => false);
    when(
      () => waterMeterApi.waterMeterConfigApn(any(), any()),
    ).thenAnswer((_) async {});
    when(
      () => waterMeterApi.waterMeterConfigServer(any(), any(), any()),
    ).thenAnswer((_) async {});
    when(
      () => waterMeterApi.waterMeterGetDeviceInfo(any()),
    ).thenAnswer((_) async => deviceInfo);
    when(
      () => repo.detail(any()),
    ).thenAnswer((_) => TaskEither.right(catOneMeter));
    when(
      () => repo.configCatOneInfo(
        any(),
        catOneNodeId: any(named: 'catOneNodeId'),
        catOneCardNumber: any(named: 'catOneCardNumber'),
        catOneOperator: any(named: 'catOneOperator'),
        catOneImsi: any(named: 'catOneImsi'),
        catOneRssi: any(named: 'catOneRssi'),
        catOneApn: any(named: 'catOneApn'),
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
  });

  tearDown(() {
    container.dispose();
    BleGuard.reset();
    TTLock.configurePigeon();
  });

  Future<Either<AppException, ({int meterId, bool isCatOne, bool needsApn})>>
  enroll({WaterMeterDomain? on}) => (on ?? domain)
      .addViaBle(
        scan: scan,
        name: '水表A',
        payMode: MeterPayMode.prepaid,
        price: 2.5,
      )
      .run();

  group('connectMeter（添加前段）', () {
    test(
      'setClientParam 用站点域名 cnapi.ttlock.com → connect，且不主动 disconnect',
      () async {
        final r = await domain.connectMeter(scan: scan).run();
        expect(r.isRight(), isTrue);
        verifyInOrder([
          () => waterMeterApi.waterMeterSetClientParam(
            'https://cnapi.ttlock.com/v3/waterMeter/executeCommand',
            'cid',
            'tk',
          ),
          () => waterMeterApi.waterMeterConnect('AA:W1'),
        ]);
        verifyNever(() => waterMeterApi.waterMeterDisconnect(any()));
      },
    );

    test('海外站点 → euapi.ttlock.com', () async {
      final overseas = makeContainer(appConfig: overseasConfig);
      addTearDown(overseas.dispose);
      final r = await overseas
          .read(waterMeterDomainProvider.notifier)
          .connectMeter(scan: scan)
          .run();
      expect(r.isRight(), isTrue);
      verify(
        () => waterMeterApi.waterMeterSetClientParam(
          'https://euapi.ttlock.com/v3/waterMeter/executeCommand',
          'cid',
          'tk',
        ),
      ).called(1);
    });

    test('connect 失败 → Left', () async {
      when(
        () => waterMeterApi.waterMeterConnect(any()),
      ).thenThrow(AppException.unknown(message: 'connect failed'));
      final r = await domain.connectMeter(scan: scan).run();
      expect(r.isLeft(), isTrue);
    });

    test('凭证缺失 → business(-32)', () async {
      final bare = makeContainer(session: null);
      addTearDown(bare.dispose);
      final r = await bare
          .read(waterMeterDomainProvider.notifier)
          .connectMeter(scan: scan)
          .run();
      expect(r.isLeft(), isTrue);
      expect((r.getLeft().toNullable()! as AppBusinessException).code, -32);
      verifyNever(() => waterMeterApi.waterMeterConnect(any()));
    });
  });

  group('addViaBle 基础链路', () {
    test('init id>0 直用；不重复连接，凭证重设恰好一次', () async {
      when(() => waterMeterApi.waterMeterInit(any())).thenAnswer(
        (_) async => TTWaterMeterInitResult(waterMeterId: 7, featureValue: ''),
      );
      final r = await enroll();
      expect(r.getRight().toNullable()?.meterId, 7);
      // init 也经 _runBleCommand：凭证是 SDK 侧内存态，下发前必须重设一次。
      verify(
        () => waterMeterApi.waterMeterSetClientParam(
          'https://cnapi.ttlock.com/v3/waterMeter/executeCommand',
          'cid',
          'tk',
        ),
      ).called(1);
      verifyNever(() => waterMeterApi.waterMeterConnect(any()));
      verifyNever(() => repo.add(mac: 'AA:W1', name: '水表A'));
      verifyNever(() => waterMeterApi.waterMeterDisconnect(any()));
    });

    test('init 返回 waterMeterId<=0 → 回退云 add', () async {
      when(() => waterMeterApi.waterMeterInit(any())).thenAnswer(
        (_) async => TTWaterMeterInitResult(waterMeterId: 0, featureValue: ''),
      );
      when(
        () => repo.add(mac: 'AA:W1', name: '水表A'),
      ).thenAnswer((_) => TaskEither.right(8));
      final r = await enroll();
      expect(r.getRight().toNullable()?.meterId, 8);
      verify(() => repo.add(mac: 'AA:W1', name: '水表A')).called(1);
      verifyNever(() => waterMeterApi.waterMeterDisconnect(any()));
    });

    test('init 抛异常 → Left，且不再调用 disconnect', () async {
      when(
        () => waterMeterApi.waterMeterInit(any()),
      ).thenThrow(AppException.unknown(message: 'init failed'));
      final r = await enroll();
      expect(r.isLeft(), isTrue);
      verifyNever(() => waterMeterApi.waterMeterDisconnect(any()));
      verifyNever(() => repo.add(mac: 'AA:W1', name: '水表A'));
    });
  });

  group('addViaBle Cat.1 判定', () {
    setUp(() {
      when(() => waterMeterApi.waterMeterInit(any())).thenAnswer(
        (_) async => TTWaterMeterInitResult(waterMeterId: 7, featureValue: ''),
      );
      when(
        () => waterMeterApi.waterMeterIsSupportFunction(
          '',
          TTWaterMeterFeature.catOne,
        ),
      ).thenAnswer((_) async => false);
    });

    test('特征值命中 catOne + 国内 → isCatOne 真、needsApn 假', () async {
      when(() => waterMeterApi.waterMeterInit(any())).thenAnswer(
        (_) async => TTWaterMeterInitResult(
          waterMeterId: 7,
          featureValue: 'fv-4g',
        ),
      );
      when(
        () => waterMeterApi.waterMeterIsSupportFunction(
          'fv-4g',
          TTWaterMeterFeature.catOne,
        ),
      ).thenAnswer((_) async => true);
      final r = await enroll();
      expect(r.getRight().toNullable()?.isCatOne, isTrue);
      expect(r.getRight().toNullable()?.needsApn, isFalse);
    });

    test('特征值命中 catOne + 海外 → needsApn 真', () async {
      when(() => waterMeterApi.waterMeterInit(any())).thenAnswer(
        (_) async => TTWaterMeterInitResult(
          waterMeterId: 7,
          featureValue: 'fv-4g',
        ),
      );
      final overseas = makeContainer(appConfig: overseasConfig);
      addTearDown(overseas.dispose);
      when(
        () => waterMeterApi.waterMeterIsSupportFunction(
          'fv-4g',
          TTWaterMeterFeature.catOne,
        ),
      ).thenAnswer((_) async => true);
      final r = await enroll(
        on: overseas.read(waterMeterDomainProvider.notifier),
      );
      expect(r.getRight().toNullable()?.isCatOne, isTrue);
      expect(r.getRight().toNullable()?.needsApn, isTrue);
    });

    test('特征值未命中 catOne → isCatOne 假', () async {
      when(() => waterMeterApi.waterMeterInit(any())).thenAnswer(
        (_) async => TTWaterMeterInitResult(
          waterMeterId: 7,
          featureValue: 'fv-ble',
        ),
      );
      when(
        () => waterMeterApi.waterMeterIsSupportFunction(
          'fv-ble',
          TTWaterMeterFeature.catOne,
        ),
      ).thenAnswer((_) async => false);
      final r = await enroll();
      expect(r.getRight().toNullable()?.isCatOne, isFalse);
      expect(r.getRight().toNullable()?.needsApn, isFalse);
    });

    test('featureValue 为空 → isCatOne 假', () async {
      // 组内 setUp 已让 init 返回 featureValue: ''。
      final r = await enroll();
      expect(r.getRight().toNullable()?.isCatOne, isFalse);
    });

    test('init 特征值判非 catOne → isCatOne 假，不阻断添加', () async {
      final r = await enroll();
      expect(r.isRight(), isTrue);
      expect(r.getRight().toNullable()?.isCatOne, isFalse);
      expect(r.getRight().toNullable()?.meterId, 7);
    });
  });

  group('configureCatOne', () {
    test('国内：不下发 APN，configServer 用站点端点 → 读设备信息 → 上传', () async {
      final r = await domain.configureCatOne(meterId: 7, mac: 'AA:W1').run();
      expect(r.isRight(), isTrue);
      verifyNever(() => waterMeterApi.waterMeterConfigApn(any(), any()));
      verifyInOrder([
        () => waterMeterApi.waterMeterConfigServer(
          'AA:W1',
          'cnwm.ttlock.com',
          '6999',
        ),
        () => waterMeterApi.waterMeterGetDeviceInfo('AA:W1'),
      ]);
      verify(
        () => repo.configCatOneInfo(
          7,
          catOneNodeId: '860717087140669',
          catOneCardNumber: '898604081225D0033738',
          catOneOperator: 'CHINA MOBILE',
          catOneImsi: '460042888134165',
          catOneRssi: 27,
          catOneApn: null,
        ),
      ).called(1);
    });

    test('海外：configApn 先于 configServer，端点用 eu 域名，APN 一并回传', () async {
      final overseas = makeContainer(appConfig: overseasConfig);
      addTearDown(overseas.dispose);
      final r = await overseas
          .read(waterMeterDomainProvider.notifier)
          .configureCatOne(meterId: 7, mac: 'AA:W1', apn: 'cmnet')
          .run();
      expect(r.isRight(), isTrue);
      verifyInOrder([
        () => waterMeterApi.waterMeterConfigApn('AA:W1', 'cmnet'),
        () => waterMeterApi.waterMeterConfigServer(
          'AA:W1',
          'euwm.ttlock.com',
          '6999',
        ),
        () => waterMeterApi.waterMeterGetDeviceInfo('AA:W1'),
      ]);
      verify(
        () => repo.configCatOneInfo(
          7,
          catOneNodeId: any(named: 'catOneNodeId'),
          catOneCardNumber: any(named: 'catOneCardNumber'),
          catOneOperator: any(named: 'catOneOperator'),
          catOneImsi: any(named: 'catOneImsi'),
          catOneRssi: any(named: 'catOneRssi'),
          catOneApn: 'cmnet',
        ),
      ).called(1);
    });

    test('configServer 失败 → Left，不读设备信息也不上传', () async {
      when(
        () => waterMeterApi.waterMeterConfigServer(any(), any(), any()),
      ).thenThrow(AppException.unknown(message: 'config server failed'));
      final r = await domain.configureCatOne(meterId: 7, mac: 'AA:W1').run();
      expect(r.isLeft(), isTrue);
      verifyNever(() => waterMeterApi.waterMeterGetDeviceInfo(any()));
      verifyNever(
        () => repo.configCatOneInfo(
          any(),
          catOneNodeId: any(named: 'catOneNodeId'),
          catOneCardNumber: any(named: 'catOneCardNumber'),
          catOneOperator: any(named: 'catOneOperator'),
          catOneImsi: any(named: 'catOneImsi'),
          catOneRssi: any(named: 'catOneRssi'),
          catOneApn: any(named: 'catOneApn'),
        ),
      );
    });

    test('读设备信息失败 → Left', () async {
      when(
        () => waterMeterApi.waterMeterGetDeviceInfo(any()),
      ).thenThrow(AppException.unknown(message: 'device info failed'));
      final r = await domain.configureCatOne(meterId: 7, mac: 'AA:W1').run();
      expect(r.isLeft(), isTrue);
    });

    test('catOneInfo 上传失败 → 仍 Right（不阻断添加）', () async {
      when(
        () => repo.configCatOneInfo(
          any(),
          catOneNodeId: any(named: 'catOneNodeId'),
          catOneCardNumber: any(named: 'catOneCardNumber'),
          catOneOperator: any(named: 'catOneOperator'),
          catOneImsi: any(named: 'catOneImsi'),
          catOneRssi: any(named: 'catOneRssi'),
          catOneApn: any(named: 'catOneApn'),
        ),
      ).thenAnswer(
        (_) => TaskEither.left(AppException.unknown(message: 'not online')),
      );
      final r = await domain.configureCatOne(meterId: 7, mac: 'AA:W1').run();
      expect(r.isRight(), isTrue);
    });
  });

  test('water delete: BLE 失败不云删', () async {
    when(
      () => waterMeterApi.waterMeterDelete('AA:W1'),
    ).thenThrow(AppException.unknown(message: 'ble'));
    final r = await domain
        .delete(meter: const WaterMeterEntity(waterMeterId: 7, mac: 'AA:W1'))
        .run();
    expect(r.isLeft(), isTrue);
    verifyNever(() => repo.delete(waterMeterId: 7));
  });

  test('water delete: 纯 BLE —— 成功也不调云删（SDK 通知服务器）', () async {
    when(
      () => waterMeterApi.waterMeterDelete('AA:W1'),
    ).thenAnswer((_) async {});
    final r = await domain
        .delete(meter: const WaterMeterEntity(waterMeterId: 7, mac: 'AA:W1'))
        .run();
    expect(r.isRight(), isTrue);
    verify(() => waterMeterApi.waterMeterDelete('AA:W1')).called(1);
    // 云端 /v3/waterMeter/delete 本地文档集无出处，且删除由 SDK 通知服务器。
    verifyNever(() => repo.delete(waterMeterId: 7));
  });

  test('water delete: mac 为空 → Left', () async {
    final r = await domain
        .delete(meter: const WaterMeterEntity(waterMeterId: 7))
        .run();
    expect(r.isLeft(), isTrue);
    verifyNever(() => waterMeterApi.waterMeterDelete('AA:W1'));
    verifyNever(() => repo.delete(waterMeterId: 7));
  });

  test('WaterMeterDto.toEntity 映射 mac 与 featureValue 字段', () {
    final e = WaterMeterDto.fromJson({
      'mac': 'AA:W1',
      'featureValue': 'fv-4g',
    }).toEntity();
    expect(e.mac, 'AA:W1');
    expect(e.featureValue, 'fv-4g');
  });

  test('domain.list 透传到 repo', () async {
    when(
      () => repo.list(pageNo: 1, pageSize: 20, groupId: null, searchStr: null),
    ).thenAnswer((_) => TaskEither.right(const PageState<WaterMeterEntity>()));
    final r = await domain.list().run();
    expect(r.isRight(), isTrue);
    verify(
      () => repo.list(pageNo: 1, pageSize: 20, groupId: null, searchStr: null),
    ).called(1);
  });

  group('双通道操作（云优先、失败回退 BLE）', () {
    const onlineMeter = WaterMeterEntity(
      waterMeterId: 7,
      mac: 'AA:W1',
      online: true,
      payMode: MeterPayMode.prepaid,
    );
    const offlineMeter = WaterMeterEntity(
      waterMeterId: 7,
      mac: 'AA:W1',
      online: false,
      payMode: MeterPayMode.prepaid,
    );

    test('online 真：通断水走云，不建 BLE 会话', () async {
      when(
        () => repo.controlOnOff(7, on: true),
      ).thenAnswer((_) => TaskEither.right(unit));
      final r = await domain.setPowerOnOff(onlineMeter, on: true).run();
      expect(r.isRight(), isTrue);
      verify(() => repo.controlOnOff(7, on: true)).called(1);
      verifyNever(() => waterMeterApi.waterMeterSetPowerOnOff(any(), any()));
    });

    test('online 假：通断水不调云端，直接走 BLE', () async {
      when(
        () => waterMeterApi.waterMeterSetPowerOnOff('AA:W1', true),
      ).thenAnswer((_) async {});
      final r = await domain.setPowerOnOff(offlineMeter, on: true).run();
      expect(r.isRight(), isTrue);
      verifyNever(() => repo.controlOnOff(any(), on: any(named: 'on')));
      verify(
        () => waterMeterApi.waterMeterSetPowerOnOff('AA:W1', true),
      ).called(1);
      verifyNever(() => waterMeterApi.waterMeterConnect(any()));
      verifyNever(() => waterMeterApi.waterMeterDisconnect(any()));
    });

    test('online 真：清零走云 clear，不调 BLE', () async {
      when(
        () => repo.clear(waterMeterId: 7),
      ).thenAnswer((_) => TaskEither.right(unit));
      final r = await domain.clearRemainder(onlineMeter).run();
      expect(r.isRight(), isTrue);
      verify(() => repo.clear(waterMeterId: 7)).called(1);
      verifyNever(() => waterMeterApi.waterMeterClearRemainderM3(any()));
    });

    test('online 假：清零走 BLE clearRemainderM3，不调云端', () async {
      when(
        () => waterMeterApi.waterMeterClearRemainderM3('AA:W1'),
      ).thenAnswer((_) async {});
      final r = await domain.clearRemainder(offlineMeter).run();
      expect(r.isRight(), isTrue);
      verifyNever(() => repo.clear(waterMeterId: any(named: 'waterMeterId')));
      verify(
        () => waterMeterApi.waterMeterClearRemainderM3('AA:W1'),
      ).called(1);
    });

    test('总用量调整：云走 updateTotal，BLE 走 setTotalUsage', () async {
      when(
        () => repo.updateTotal(waterMeterId: 7, totalKwh: 12.5),
      ).thenAnswer((_) => TaskEither.right(unit));
      await domain.setTotalUsage(onlineMeter, totalM3: 12.5).run();
      verify(() => repo.updateTotal(waterMeterId: 7, totalKwh: 12.5)).called(1);

      when(
        () => waterMeterApi.waterMeterSetTotalUsage('AA:W1', 12.5),
      ).thenAnswer((_) async {});
      await domain.setTotalUsage(offlineMeter, totalM3: 12.5).run();
      verify(
        () => waterMeterApi.waterMeterSetTotalUsage('AA:W1', 12.5),
      ).called(1);
    });

    test('云失败（业务错误）时回退 BLE', () async {
      when(
        () => repo.updatePayMode(waterMeterId: 7, payMode: 1, price: null),
      ).thenAnswer(
        (_) => TaskEither.left(AppException.business(code: 7, message: 'off')),
      );
      when(
        () => waterMeterApi.waterMeterSetPayMode(
          'AA:W1',
          TTMeterPayMode.prepaid,
          0,
        ),
      ).thenAnswer((_) async {});
      final r = await domain
          .setPayMode(onlineMeter, mode: MeterPayMode.prepaid)
          .run();
      expect(r.isRight(), isTrue);
      verify(
        () => waterMeterApi.waterMeterSetPayMode(
          'AA:W1',
          TTMeterPayMode.prepaid,
          0,
        ),
      ).called(1);
      verifyNever(() => waterMeterApi.waterMeterConnect(any()));
      verifyNever(() => waterMeterApi.waterMeterDisconnect(any()));
    });

    test('云失败（解析错误）不回退 BLE', () async {
      when(
        () => repo.updatePayMode(waterMeterId: 7, payMode: 1, price: null),
      ).thenAnswer((_) => TaskEither.left(AppException.parse(message: 'bad')));
      final r = await domain
          .setPayMode(onlineMeter, mode: MeterPayMode.prepaid)
          .run();
      expect(r.isLeft(), isTrue);
      verifyNever(
        () => waterMeterApi.waterMeterSetPayMode(any(), any(), any()),
      );
    });

    test('两路皆失败时回传云侧错误码', () async {
      when(() => repo.controlOnOff(7, on: false)).thenAnswer(
        (_) => TaskEither.left(AppException.business(code: 42, message: 'c')),
      );
      when(
        () => waterMeterApi.waterMeterSetPowerOnOff('AA:W1', false),
      ).thenThrow(AppException.firmware(message: 'ble'));
      final r = await domain.setPowerOnOff(onlineMeter, on: false).run();
      expect(r.isLeft(), isTrue);
      expect((r.getLeft().toNullable()! as AppBusinessException).code, 42);
    });

    test('充值：云走 recharge，BLE 走 charge', () async {
      when(
        () => repo.recharge(7, amount: 100.0, m3: 50.0),
      ).thenAnswer((_) => TaskEither.right(unit));
      await domain.rechargeMeter(onlineMeter, amount: 100, m3: 50).run();
      verify(() => repo.recharge(7, amount: 100.0, m3: 50.0)).called(1);

      when(
        () => waterMeterApi.waterMeterCharge('AA:W1', 100.0, 50.0),
      ).thenAnswer((_) async {});
      await domain.rechargeMeter(offlineMeter, amount: 100, m3: 50).run();
      verify(
        () => waterMeterApi.waterMeterCharge('AA:W1', 100.0, 50.0),
      ).called(1);
    });

    test('configureCatOneFromSettings 重设凭证后执行完整配置链，不连不断', () async {
      when(
        () => waterMeterApi.waterMeterGetDeviceInfo('AA:W1'),
      ).thenAnswer((_) async => deviceInfo);
      when(
        () => repo.configCatOneInfo(
          7,
          catOneNodeId: any(named: 'catOneNodeId'),
          catOneCardNumber: any(named: 'catOneCardNumber'),
          catOneOperator: any(named: 'catOneOperator'),
          catOneImsi: any(named: 'catOneImsi'),
          catOneRssi: any(named: 'catOneRssi'),
          catOneApn: any(named: 'catOneApn'),
        ),
      ).thenAnswer((_) => TaskEither.right(unit));

      final r = await domain
          .configureCatOneFromSettings(onlineMeter, apn: 'cmnet')
          .run();
      expect(r.isRight(), isTrue);
      verifyInOrder([
        () => waterMeterApi.waterMeterSetClientParam(any(), 'cid', 'tk'),
        () => waterMeterApi.waterMeterConfigApn('AA:W1', 'cmnet'),
        () => waterMeterApi.waterMeterConfigServer(
          'AA:W1',
          'cnwm.ttlock.com',
          '6999',
        ),
        () => waterMeterApi.waterMeterGetDeviceInfo('AA:W1'),
      ]);
      verifyNever(() => waterMeterApi.waterMeterConnect(any()));
      verifyNever(() => waterMeterApi.waterMeterDisconnect(any()));
    });

    test('抄表：online 真走 syncState，假走 readData', () async {
      when(() => repo.syncState(7)).thenAnswer((_) => TaskEither.right(unit));
      await domain.readMeter(onlineMeter).run();
      verify(() => repo.syncState(7)).called(1);

      when(() => waterMeterApi.waterMeterReadData('AA:W1'))
          .thenAnswer((_) async {});
      await domain.readMeter(offlineMeter).run();
      verify(() => waterMeterApi.waterMeterReadData('AA:W1')).called(1);
    });

    test('操作成功后附一次同通道抄表：online 真 → 云 syncState', () async {
      when(
        () => repo.controlOnOff(7, on: true),
      ).thenAnswer((_) => TaskEither.right(unit));
      when(() => repo.syncState(7)).thenAnswer((_) => TaskEither.right(unit));

      final r = await domain.setPowerOnOff(onlineMeter, on: true).run();
      expect(r.isRight(), isTrue);
      verify(() => repo.syncState(7)).called(1);
      verifyNever(() => waterMeterApi.waterMeterReadData(any()));
    });

    test('操作成功后附一次同通道抄表：online 假 → BLE readData', () async {
      when(
        () => waterMeterApi.waterMeterSetPowerOnOff('AA:W1', true),
      ).thenAnswer((_) async {});
      when(
        () => waterMeterApi.waterMeterReadData('AA:W1'),
      ).thenAnswer((_) async {});

      final r = await domain.setPowerOnOff(offlineMeter, on: true).run();
      expect(r.isRight(), isTrue);
      verify(() => waterMeterApi.waterMeterReadData('AA:W1')).called(1);
      verifyNever(() => repo.syncState(any()));
    });

    test('附带的抄表失败不阻断操作（指令已生效）', () async {
      when(
        () => repo.controlOnOff(7, on: true),
      ).thenAnswer((_) => TaskEither.right(unit));
      when(
        () => repo.syncState(7),
      ).thenThrow(AppException.unknown(message: 'sync down'));

      final r = await domain.setPowerOnOff(onlineMeter, on: true).run();
      expect(r.isRight(), isTrue);
      verify(() => repo.syncState(7)).called(1);
    });

    test('记录与信息读取直接透传 repo，不走通道判定', () async {
      when(
        () => repo.listOperationRecords(
          waterMeterId: 7,
          pageNo: 1,
          pageSize: 20,
          recordType: '7',
        ),
      ).thenAnswer(
        (_) => TaskEither.right(const PaginatedOperationRecords(total: 1)),
      );
      final r = await domain.listOperationRecords(7, recordType: '7').run();
      expect(r.getRight().toNullable()?.total, 1);
      verify(
        () => repo.listOperationRecords(
          waterMeterId: 7,
          pageNo: 1,
          pageSize: 20,
          recordType: '7',
        ),
      ).called(1);
    });

    test('isCatOne 走本地 Pigeon 位运算，透传 featureValue', () async {
      when(
        () => waterMeterApi.waterMeterIsSupportFunction(
          'fv-4g',
          TTWaterMeterFeature.catOne,
        ),
      ).thenAnswer((_) async => true);

      expect(await domain.isCatOne('fv-4g'), isTrue);
      verify(
        () => waterMeterApi.waterMeterIsSupportFunction(
          'fv-4g',
          TTWaterMeterFeature.catOne,
        ),
      ).called(1);
    });

    test('catOneNeedsApn 只反映站点是否海外', () async {
      final overseas = makeContainer(appConfig: overseasConfig);
      expect(
        await overseas
            .read(waterMeterDomainProvider.notifier)
            .catOneNeedsApn()
            .run(),
        right(true),
      );
      expect(await domain.catOneNeedsApn().run(), right(false));
    });
  });
}
