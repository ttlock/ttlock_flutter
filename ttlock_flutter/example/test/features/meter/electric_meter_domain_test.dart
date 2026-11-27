import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/config/app_site.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/data/repository/electric_meter_repository.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/provider/electric_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_cat_one_info.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_firmware.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_operation_record.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config_domain.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

class _MockRepo extends Mock implements ElectricMeterRepository {}

class _MockElectricMeterApi extends Mock implements TTElectricMeterApi {}

class _FakeRepo extends ElectricMeterRepository {
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
  TaskEither<AppException, PageState<ElectricMeterEntity>> list({
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
  TaskEither<AppException, ElectricMeterEntity> detail(int meterId) =>
      _mock.detail(meterId);

  @override
  TaskEither<AppException, Unit> rename(int meterId, String name) =>
      _mock.rename(meterId, name);

  @override
  TaskEither<AppException, Unit> recharge(
    int meterId, {
    required double amount,
    required double kwh,
  }) => _mock.recharge(meterId, amount: amount, kwh: kwh);

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
  TaskEither<AppException, Unit> updateMaxPower(
    int meterId, {
    required int maxPower,
  }) => _mock.updateMaxPower(meterId, maxPower: maxPower);

  @override
  TaskEither<AppException, List<ElectricMeterUsageRecordEntity>> listRecords(
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
    required int electricMeterId,
    int pageNo = 1,
    int pageSize = 20,
    String? recordType,
  }) => _mock.listOperationRecords(
    electricMeterId: electricMeterId,
    pageNo: pageNo,
    pageSize: pageSize,
    recordType: recordType,
  );

  @override
  TaskEither<AppException, MeterCatOneInfoEntity> catOneInfo({
    required int electricMeterId,
  }) => _mock.catOneInfo(electricMeterId: electricMeterId);

  @override
  TaskEither<AppException, MeterFirmwareEntity> firmwareInfo({
    required int electricMeterId,
  }) => _mock.firmwareInfo(electricMeterId: electricMeterId);

  @override
  TaskEither<AppException, Unit> clear({required int electricMeterId}) =>
      _mock.clear(electricMeterId: electricMeterId);

  @override
  TaskEither<AppException, Unit> updatePayMode({
    required int electricMeterId,
    required int payMode,
    double? price,
  }) => _mock.updatePayMode(
    electricMeterId: electricMeterId,
    payMode: payMode,
    price: price,
  );
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
  late _MockElectricMeterApi electricMeterApi;
  late ProviderContainer container;
  late ElectricMeterDomain domain;

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
    name: 'EM-1',
    mac: 'BB:W1',
    rssi: -50,
    isInited: false,
    type: 1,
  );

  /// 4G（Cat.1）表：云端 detail 返回可判定 catOne 的能力位。
  const catOneMeter = ElectricMeterEntity(
    electricMeterId: 9,
    featureValue: 'fv-4g',
  );
  /// 设备侧回读的模块网络信息（configCatOneInfo 的数据来源）。
  final deviceInfo = ElectricMeterDeviceInfo(
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
      electricMeterRepositoryProvider.overrideWith(() => _FakeRepo(repo)),
      userProvider.overrideWith(() => _FakeUserProvider(session)),
      appConfigDomainProvider.overrideWith(
        () => _FakeAppConfigDomain(appConfig),
      ),
    ],
  );

  setUpAll(() {
    registerFallbackValue(
      TTElectricMeterInitParam(
        mac: '',
        name: '',
        payMode: TTMeterPayMode.postpaid,
        price: 0,
      ),
    );
    registerFallbackValue(TTElectricMeterFeature.catOne);
    registerFallbackValue(TTMeterPayMode.postpaid);
  });

  setUp(() {
    repo = _MockRepo();
    electricMeterApi = _MockElectricMeterApi();
    TTLock.setImplementations(electricMeterApi: electricMeterApi);
    container = makeContainer();
    domain = container.read(electricMeterDomainProvider.notifier);

    // url 随站点变化，具体取值由「基础链路」用例逐字断言。
    when(
      () => electricMeterApi.electricMeterSetClientParam(any(), 'cid', 'tk'),
    ).thenAnswer((_) async {});
    // connect 仅绑定时需要；已绑定表的指令不连不断，故不 stub disconnect。
    when(
      () => electricMeterApi.electricMeterConnect(any()),
    ).thenAnswer((_) async {});
    when(
      () => electricMeterApi.electricMeterIsSupportFunction(any(), any()),
    ).thenAnswer((_) async => false);
    when(
      () => electricMeterApi.electricMeterConfigApn(any(), any()),
    ).thenAnswer((_) async {});
    when(
      () => electricMeterApi.electricMeterConfigServer(any(), any(), any()),
    ).thenAnswer((_) async {});
    when(
      () => electricMeterApi.electricMeterGetDeviceInfo(any()),
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
  enroll({ElectricMeterDomain? on}) => (on ?? domain)
      .addViaBle(
        scan: scan,
        name: '电表A',
        payMode: MeterPayMode.prepaid,
        price: 1.5,
      )
      .run();

  group('connectMeter（添加前段）', () {
    test(
      'setClientParam 用站点域名 cnapi.ttlock.com → connect，且不主动 disconnect',
      () async {
        final r = await domain.connectMeter(scan: scan).run();
        expect(r.isRight(), isTrue);
        verifyInOrder([
          () => electricMeterApi.electricMeterSetClientParam(
            'https://cnapi.ttlock.com/v3/electricMeter/executeCommand',
            'cid',
            'tk',
          ),
          () => electricMeterApi.electricMeterConnect('BB:W1'),
        ]);
        verifyNever(() => electricMeterApi.electricMeterDisconnect(any()));
      },
    );

    test('海外站点 → euapi.ttlock.com', () async {
      final overseas = makeContainer(appConfig: overseasConfig);
      addTearDown(overseas.dispose);
      final r = await overseas
          .read(electricMeterDomainProvider.notifier)
          .connectMeter(scan: scan)
          .run();
      expect(r.isRight(), isTrue);
      verify(
        () => electricMeterApi.electricMeterSetClientParam(
          'https://euapi.ttlock.com/v3/electricMeter/executeCommand',
          'cid',
          'tk',
        ),
      ).called(1);
    });

    test('connect 失败 → Left', () async {
      when(
        () => electricMeterApi.electricMeterConnect(any()),
      ).thenThrow(AppException.unknown(message: 'connect failed'));
      final r = await domain.connectMeter(scan: scan).run();
      expect(r.isLeft(), isTrue);
    });

    test('凭证缺失 → business(-32)', () async {
      final bare = makeContainer(session: null);
      addTearDown(bare.dispose);
      final r = await bare
          .read(electricMeterDomainProvider.notifier)
          .connectMeter(scan: scan)
          .run();
      expect(r.isLeft(), isTrue);
      expect((r.getLeft().toNullable()! as AppBusinessException).code, -32);
      verifyNever(() => electricMeterApi.electricMeterConnect(any()));
    });
  });

  group('addViaBle 基础链路', () {
    test('init id>0 直用，且不再重复连接', () async {
      when(() => electricMeterApi.electricMeterInit(any())).thenAnswer(
        (_) async =>
            TTElectricMeterInitResult(electricMeterId: 9, featureValue: ''),
      );
      final r = await enroll();
      expect(r.getRight().toNullable()?.meterId, 9);
      verifyNever(
        () => electricMeterApi.electricMeterSetClientParam(any(), any(), any()),
      );
      verifyNever(() => electricMeterApi.electricMeterConnect(any()));
      verifyNever(() => repo.add(mac: 'BB:W1', name: '电表A'));
      verifyNever(() => electricMeterApi.electricMeterDisconnect(any()));
    });

    test('init 返回 electricMeterId<=0 → 回退云 add', () async {
      when(() => electricMeterApi.electricMeterInit(any())).thenAnswer(
        (_) async =>
            TTElectricMeterInitResult(electricMeterId: 0, featureValue: ''),
      );
      when(
        () => repo.add(mac: 'BB:W1', name: '电表A'),
      ).thenAnswer((_) => TaskEither.right(10));
      final r = await enroll();
      expect(r.getRight().toNullable()?.meterId, 10);
      verify(() => repo.add(mac: 'BB:W1', name: '电表A')).called(1);
      verifyNever(() => electricMeterApi.electricMeterDisconnect(any()));
    });

    test('init 抛异常 → Left，且不再调用 disconnect', () async {
      when(
        () => electricMeterApi.electricMeterInit(any()),
      ).thenThrow(AppException.unknown(message: 'init failed'));
      final r = await enroll();
      expect(r.isLeft(), isTrue);
      verifyNever(() => electricMeterApi.electricMeterDisconnect(any()));
      verifyNever(() => repo.add(mac: 'BB:W1', name: '电表A'));
    });
  });

  group('addViaBle Cat.1 判定', () {
    setUp(() {
      when(() => electricMeterApi.electricMeterInit(any())).thenAnswer(
        (_) async =>
            TTElectricMeterInitResult(electricMeterId: 9, featureValue: ''),
      );
      when(
        () => electricMeterApi.electricMeterIsSupportFunction(
          '',
          TTElectricMeterFeature.catOne,
        ),
      ).thenAnswer((_) async => false);
    });

    test('特征值命中 catOne + 国内 → isCatOne 真、needsApn 假', () async {
      when(() => electricMeterApi.electricMeterInit(any())).thenAnswer(
        (_) async => TTElectricMeterInitResult(
          electricMeterId: 9,
          featureValue: 'fv-4g',
        ),
      );
      when(
        () => electricMeterApi.electricMeterIsSupportFunction(
          'fv-4g',
          TTElectricMeterFeature.catOne,
        ),
      ).thenAnswer((_) async => true);
      final r = await enroll();
      expect(r.getRight().toNullable()?.isCatOne, isTrue);
      expect(r.getRight().toNullable()?.needsApn, isFalse);
    });

    test('特征值命中 catOne + 海外 → needsApn 真', () async {
      when(() => electricMeterApi.electricMeterInit(any())).thenAnswer(
        (_) async => TTElectricMeterInitResult(
          electricMeterId: 9,
          featureValue: 'fv-4g',
        ),
      );
      final overseas = makeContainer(appConfig: overseasConfig);
      addTearDown(overseas.dispose);
      when(
        () => electricMeterApi.electricMeterIsSupportFunction(
          'fv-4g',
          TTElectricMeterFeature.catOne,
        ),
      ).thenAnswer((_) async => true);
      final r = await enroll(
        on: overseas.read(electricMeterDomainProvider.notifier),
      );
      expect(r.getRight().toNullable()?.isCatOne, isTrue);
      expect(r.getRight().toNullable()?.needsApn, isTrue);
    });

    test('特征值未命中 catOne → isCatOne 假', () async {
      when(() => electricMeterApi.electricMeterInit(any())).thenAnswer(
        (_) async => TTElectricMeterInitResult(
          electricMeterId: 9,
          featureValue: 'fv-ble',
        ),
      );
      when(
        () => electricMeterApi.electricMeterIsSupportFunction(
          'fv-ble',
          TTElectricMeterFeature.catOne,
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
      expect(r.getRight().toNullable()?.meterId, 9);
    });
  });

  group('configureCatOne', () {
    test('国内：不下发 APN，configServer 用站点端点 → 读设备信息 → 上传', () async {
      final r = await domain.configureCatOne(meterId: 9, mac: 'BB:W1').run();
      expect(r.isRight(), isTrue);
      verifyNever(() => electricMeterApi.electricMeterConfigApn(any(), any()));
      verifyInOrder([
        () => electricMeterApi.electricMeterConfigServer(
          'BB:W1',
          'cnem.ttlock.com',
          '7999',
        ),
        () => electricMeterApi.electricMeterGetDeviceInfo('BB:W1'),
      ]);
      verify(
        () => repo.configCatOneInfo(
          9,
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
          .read(electricMeterDomainProvider.notifier)
          .configureCatOne(meterId: 9, mac: 'BB:W1', apn: 'cmnet')
          .run();
      expect(r.isRight(), isTrue);
      verifyInOrder([
        () => electricMeterApi.electricMeterConfigApn('BB:W1', 'cmnet'),
        () => electricMeterApi.electricMeterConfigServer(
          'BB:W1',
          'euem.ttlock.com',
          '7999',
        ),
        () => electricMeterApi.electricMeterGetDeviceInfo('BB:W1'),
      ]);
      verify(
        () => repo.configCatOneInfo(
          9,
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
        () => electricMeterApi.electricMeterConfigServer(any(), any(), any()),
      ).thenThrow(AppException.unknown(message: 'config server failed'));
      final r = await domain.configureCatOne(meterId: 9, mac: 'BB:W1').run();
      expect(r.isLeft(), isTrue);
      verifyNever(() => electricMeterApi.electricMeterGetDeviceInfo(any()));
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
        () => electricMeterApi.electricMeterGetDeviceInfo(any()),
      ).thenThrow(AppException.unknown(message: 'device info failed'));
      final r = await domain.configureCatOne(meterId: 9, mac: 'BB:W1').run();
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
      final r = await domain.configureCatOne(meterId: 9, mac: 'BB:W1').run();
      expect(r.isRight(), isTrue);
    });
  });

  test('domain.updateMaxPower 透传到 repo', () async {
    when(
      () => repo.updateMaxPower(3001, maxPower: 100),
    ).thenAnswer((_) => TaskEither.right(unit));
    final r = await domain.updateMaxPower(3001, maxPower: 100).run();
    expect(r.isRight(), isTrue);
    verify(() => repo.updateMaxPower(3001, maxPower: 100)).called(1);
  });

  test('domain.list 透传到 repo', () async {
    when(
      () => repo.list(pageNo: 1, pageSize: 20, groupId: null, searchStr: null),
    ).thenAnswer(
      (_) => TaskEither.right(const PageState<ElectricMeterEntity>()),
    );
    final r = await domain.list().run();
    expect(r.isRight(), isTrue);
    verify(
      () => repo.list(pageNo: 1, pageSize: 20, groupId: null, searchStr: null),
    ).called(1);
  });

  group('双通道操作（云优先、失败回退 BLE）', () {
    const onlineMeter = ElectricMeterEntity(
      electricMeterId: 9,
      mac: 'BB:W1',
      online: true,
      payMode: MeterPayMode.prepaid,
      maxPower: '10',
    );
    const offlineMeter = ElectricMeterEntity(
      electricMeterId: 9,
      mac: 'BB:W1',
      online: false,
      payMode: MeterPayMode.prepaid,
      maxPower: '10',
    );

    test('online 真：通断电走云，不建 BLE 会话', () async {
      when(
        () => repo.controlOnOff(9, on: true),
      ).thenAnswer((_) => TaskEither.right(unit));
      final r = await domain.setPowerOnOff(onlineMeter, on: true).run();
      expect(r.isRight(), isTrue);
      verify(() => repo.controlOnOff(9, on: true)).called(1);
      verifyNever(() => electricMeterApi.electricMeterSetPowerOnOff(any(), any()));
    });

    test('online 假：通断电不调云端，直接走 BLE', () async {
      when(
        () => electricMeterApi.electricMeterSetPowerOnOff('BB:W1', true),
      ).thenAnswer((_) async {});
      final r = await domain.setPowerOnOff(offlineMeter, on: true).run();
      expect(r.isRight(), isTrue);
      verifyNever(() => repo.controlOnOff(any(), on: any(named: 'on')));
      verify(
        () => electricMeterApi.electricMeterSetPowerOnOff('BB:W1', true),
      ).called(1);
      verifyNever(() => electricMeterApi.electricMeterConnect(any()));
      verifyNever(() => electricMeterApi.electricMeterDisconnect(any()));
    });

    test('online 真：清零走云 clear，不调 BLE', () async {
      when(() => repo.clear(electricMeterId: 9))
          .thenAnswer((_) => TaskEither.right(unit));
      final r = await domain.clearRemainder(onlineMeter).run();
      expect(r.isRight(), isTrue);
      verify(() => repo.clear(electricMeterId: 9)).called(1);
      verifyNever(
        () => electricMeterApi.electricMeterClearRemainderKwh(any()),
      );
    });

    test('online 假：清零走 BLE clearRemainderKwh，不调云端', () async {
      when(
        () => electricMeterApi.electricMeterClearRemainderKwh('BB:W1'),
      ).thenAnswer((_) async {});
      final r = await domain.clearRemainder(offlineMeter).run();
      expect(r.isRight(), isTrue);
      verifyNever(() => repo.clear(electricMeterId: any(named: 'electricMeterId')));
      verify(
        () => electricMeterApi.electricMeterClearRemainderKwh('BB:W1'),
      ).called(1);
      verifyNever(() => electricMeterApi.electricMeterConnect(any()));
      verifyNever(() => electricMeterApi.electricMeterDisconnect(any()));
    });

    test('最大功率：云端收 int，BLE 收 double', () async {
      when(() => repo.updateMaxPower(9, maxPower: 255))
          .thenAnswer((_) => TaskEither.right(unit));
      await domain.setMaxPower(onlineMeter, maxPower: 255).run();
      verify(() => repo.updateMaxPower(9, maxPower: 255)).called(1);

      when(
        () => electricMeterApi.electricMeterSetMaxPower('BB:W1', 255.0),
      ).thenAnswer((_) async {});
      await domain.setMaxPower(offlineMeter, maxPower: 255).run();
      verify(
        () => electricMeterApi.electricMeterSetMaxPower('BB:W1', 255.0),
      ).called(1);
      verifyNever(() => electricMeterApi.electricMeterConnect(any()));
      verifyNever(() => electricMeterApi.electricMeterDisconnect(any()));
    });

    test('云失败（业务错误）时回退 BLE', () async {
      when(() => repo.updatePayMode(electricMeterId: 9, payMode: 1, price: null)).thenAnswer(
        (_) => TaskEither.left(AppException.business(code: 7, message: 'off')),
      );
      when(
        () => electricMeterApi.electricMeterSetPayMode(
          'BB:W1',
          TTMeterPayMode.prepaid,
          0,
        ),
      ).thenAnswer((_) async {});
      final r = await domain
          .setPayMode(onlineMeter, mode: MeterPayMode.prepaid)
          .run();
      expect(r.isRight(), isTrue);
      verify(
        () => electricMeterApi.electricMeterSetPayMode(
          'BB:W1',
          TTMeterPayMode.prepaid,
          0,
        ),
      ).called(1);
      verifyNever(() => electricMeterApi.electricMeterConnect(any()));
      verifyNever(() => electricMeterApi.electricMeterDisconnect(any()));
    });

    test('云失败（解析错误）不回退 BLE', () async {
      when(() => repo.updatePayMode(electricMeterId: 9, payMode: 1, price: null)).thenAnswer(
        (_) => TaskEither.left(AppException.parse(message: 'bad')),
      );
      final r = await domain
          .setPayMode(onlineMeter, mode: MeterPayMode.prepaid)
          .run();
      expect(r.isLeft(), isTrue);
      verifyNever(
        () => electricMeterApi.electricMeterSetPayMode(any(), any(), any()),
      );
    });

    test('两路皆失败时回传云侧错误码', () async {
      when(() => repo.controlOnOff(9, on: false)).thenAnswer(
        (_) => TaskEither.left(AppException.business(code: 42, message: 'c')),
      );
      when(
        () => electricMeterApi.electricMeterSetPowerOnOff('BB:W1', false),
      ).thenThrow(AppException.firmware(message: 'ble'));
      final r = await domain.setPowerOnOff(onlineMeter, on: false).run();
      expect(r.isLeft(), isTrue);
      expect((r.getLeft().toNullable()! as AppBusinessException).code, 42);
    });

    test('充值：云走 recharge，BLE 走 charge', () async {
      when(
        () => repo.recharge(9, amount: 100.0, kwh: 50.0),
      ).thenAnswer((_) => TaskEither.right(unit));
      await domain.rechargeMeter(onlineMeter, amount: 100, kwh: 50).run();
      verify(() => repo.recharge(9, amount: 100.0, kwh: 50.0)).called(1);

      when(
        () => electricMeterApi.electricMeterCharge('BB:W1', 100.0, 50.0),
      ).thenAnswer((_) async {});
      await domain.rechargeMeter(offlineMeter, amount: 100, kwh: 50).run();
      verify(
        () => electricMeterApi.electricMeterCharge('BB:W1', 100.0, 50.0),
      ).called(1);
    });

    test('configureCatOneFromSettings 重设凭证后执行完整配置链，不连不断', () async {
      when(
        () => electricMeterApi.electricMeterGetDeviceInfo('BB:W1'),
      ).thenAnswer((_) async => deviceInfo);
      when(
        () => repo.configCatOneInfo(
          9,
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
        () => electricMeterApi.electricMeterSetClientParam(
          any(),
          'cid',
          'tk',
        ),
        () => electricMeterApi.electricMeterConfigApn('BB:W1', 'cmnet'),
        () => electricMeterApi.electricMeterConfigServer(
          'BB:W1',
          'cnem.ttlock.com',
          '7999',
        ),
        () => electricMeterApi.electricMeterGetDeviceInfo('BB:W1'),
      ]);
      verifyNever(() => electricMeterApi.electricMeterConnect(any()));
      verifyNever(() => electricMeterApi.electricMeterDisconnect(any()));
    });

    test('抄表：online 真走 syncState，假走 readData', () async {
      when(() => repo.syncState(9)).thenAnswer((_) => TaskEither.right(unit));
      await domain.readMeter(onlineMeter).run();
      verify(() => repo.syncState(9)).called(1);

      when(() => electricMeterApi.electricMeterReadData('BB:W1'))
          .thenAnswer((_) async {});
      await domain.readMeter(offlineMeter).run();
      verify(() => electricMeterApi.electricMeterReadData('BB:W1')).called(1);
    });

    test('操作成功后附一次同通道抄表：online 真 → 云 syncState', () async {
      when(
        () => repo.controlOnOff(9, on: true),
      ).thenAnswer((_) => TaskEither.right(unit));
      when(() => repo.syncState(9)).thenAnswer((_) => TaskEither.right(unit));

      final r = await domain.setPowerOnOff(onlineMeter, on: true).run();
      expect(r.isRight(), isTrue);
      verify(() => repo.syncState(9)).called(1);
      verifyNever(() => electricMeterApi.electricMeterReadData(any()));
    });

    test('操作成功后附一次同通道抄表：online 假 → BLE readData', () async {
      when(
        () => electricMeterApi.electricMeterSetPowerOnOff('BB:W1', true),
      ).thenAnswer((_) async {});
      when(
        () => electricMeterApi.electricMeterReadData('BB:W1'),
      ).thenAnswer((_) async {});

      final r = await domain.setPowerOnOff(offlineMeter, on: true).run();
      expect(r.isRight(), isTrue);
      verify(() => electricMeterApi.electricMeterReadData('BB:W1')).called(1);
      verifyNever(() => repo.syncState(any()));
    });

    test('附带的抄表失败不阻断操作（指令已生效）', () async {
      when(
        () => repo.controlOnOff(9, on: true),
      ).thenAnswer((_) => TaskEither.right(unit));
      when(
        () => repo.syncState(9),
      ).thenThrow(AppException.unknown(message: 'sync down'));

      final r = await domain.setPowerOnOff(onlineMeter, on: true).run();
      expect(r.isRight(), isTrue);
      verify(() => repo.syncState(9)).called(1);
    });

    test('记录与信息读取直接透传 repo，不走通道判定', () async {
      when(
        () => repo.listOperationRecords(
          electricMeterId: 9,
          pageNo: 1,
          pageSize: 20,
          recordType: '7',
        ),
      ).thenAnswer(
        (_) => TaskEither.right(
          const PaginatedOperationRecords(total: 1),
        ),
      );
      final r = await domain
          .listOperationRecords(9, recordType: '7')
          .run();
      expect(r.getRight().toNullable()?.total, 1);
      verify(
        () => repo.listOperationRecords(
          electricMeterId: 9,
          pageNo: 1,
          pageSize: 20,
          recordType: '7',
        ),
      ).called(1);
    });

    test('isCatOne 走本地 Pigeon 位运算，透传 featureValue', () async {
      when(
        () => electricMeterApi.electricMeterIsSupportFunction(
          'fv-4g',
          TTElectricMeterFeature.catOne,
        ),
      ).thenAnswer((_) async => true);

      expect(await domain.isCatOne('fv-4g'), isTrue);
      verify(
        () => electricMeterApi.electricMeterIsSupportFunction(
          'fv-4g',
          TTElectricMeterFeature.catOne,
        ),
      ).called(1);
    });

    test('electric delete: 纯 BLE，不碰云端', () async {
      when(
        () => electricMeterApi.electricMeterDelete('BB:W1'),
      ).thenAnswer((_) async {});
      final r = await domain
          .delete(
            meter: const ElectricMeterEntity(electricMeterId: 9, mac: 'BB:W1'),
          )
          .run();
      expect(r.isRight(), isTrue);
      verify(() => electricMeterApi.electricMeterDelete('BB:W1')).called(1);
      // 电表云端无 delete 端点；删除由 SDK 通知服务器。
      verifyNever(() => repo.rename(any(), any()));
    });

    test('electric delete: BLE 失败 → Left', () async {
      when(
        () => electricMeterApi.electricMeterDelete('BB:W1'),
      ).thenThrow(AppException.unknown(message: 'ble down'));
      final r = await domain
          .delete(
            meter: const ElectricMeterEntity(electricMeterId: 9, mac: 'BB:W1'),
          )
          .run();
      expect(r.isLeft(), isTrue);
    });

    test('electric delete: mac 为空 → Left，不发 BLE', () async {
      final r = await domain
          .delete(meter: const ElectricMeterEntity(electricMeterId: 9))
          .run();
      expect(r.isLeft(), isTrue);
      verifyNever(() => electricMeterApi.electricMeterDelete(any()));
    });

    test('catOneNeedsApn 只反映站点是否海外', () async {
      final overseas = makeContainer(appConfig: overseasConfig);
      expect(
        await overseas
            .read(electricMeterDomainProvider.notifier)
            .catOneNeedsApn()
            .run(),
        right(true),
      );
      expect(await domain.catOneNeedsApn().run(), right(false));
    });
  });
}
