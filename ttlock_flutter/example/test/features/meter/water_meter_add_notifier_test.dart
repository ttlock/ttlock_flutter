import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/provider/water_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_add_state.dart';

typedef _Outcome = ({int meterId, bool isCatOne, bool needsApn});
typedef _ConnectCall = ({TTMeterScanModel scan});
typedef _EnrollCall = ({
  TTMeterScanModel scan,
  String name,
  MeterPayMode payMode,
  double price,
});
typedef _ConfigCall = ({int meterId, String mac, String? apn});
typedef _RenameCall = ({int meterId, String name});

class _MockWaterMeterApi extends Mock implements TTWaterMeterApi {}

class _FakeWaterMeterDomain extends WaterMeterDomain {
  _FakeWaterMeterDomain(
    this._connect,
    this._enroll,
    this._configure,
    this._rename,
  );

  final TaskEither<AppException, Unit> Function(_ConnectCall) _connect;
  final TaskEither<AppException, _Outcome> Function(_EnrollCall) _enroll;
  final TaskEither<AppException, Unit> Function(_ConfigCall) _configure;
  final TaskEither<AppException, Unit> Function(_RenameCall) _rename;

  @override
  void build() {}

  @override
  TaskEither<AppException, Unit> connectMeter({
    required TTMeterScanModel scan,
  }) => _connect((scan: scan));

  @override
  TaskEither<AppException, _Outcome> addViaBle({
    required TTMeterScanModel scan,
    required String name,
    required MeterPayMode payMode,
    required double price,
  }) => _enroll((scan: scan, name: name, payMode: payMode, price: price));

  @override
  TaskEither<AppException, Unit> configureCatOne({
    required int meterId,
    required String mac,
    String? apn,
  }) => _configure((meterId: meterId, mac: mac, apn: apn));

  @override
  TaskEither<AppException, Unit> rename(int meterId, String name) =>
      _rename((meterId: meterId, name: name));
}

void main() {
  late _MockWaterMeterApi api;
  late ProviderContainer container;
  late WaterMeterAddNotifier notifier;
  late List<_ConnectCall> connectCalls;
  late List<_EnrollCall> enrollCalls;
  late List<_ConfigCall> configureCalls;
  late List<_RenameCall> renameCalls;

  final scan = TTMeterScanModel(
    name: '扫描名',
    mac: 'AA:W1',
    rssi: -48,
    isInited: false,
    type: 1,
  );

  const nonCatOne = (meterId: 7, isCatOne: false, needsApn: false);
  const catOneCn = (meterId: 7, isCatOne: true, needsApn: false);
  const catOneOverseas = (meterId: 7, isCatOne: true, needsApn: true);

  void makeContainer({
    TaskEither<AppException, Unit> Function(_ConnectCall)? connect,
    required TaskEither<AppException, _Outcome> Function(_EnrollCall) enroll,
    TaskEither<AppException, Unit> Function(_ConfigCall)? configure,
    TaskEither<AppException, Unit> Function(_RenameCall)? rename,
  }) {
    connectCalls = [];
    enrollCalls = [];
    configureCalls = [];
    renameCalls = [];
    container = ProviderContainer(
      overrides: [
        waterMeterDomainProvider.overrideWith(
          () => _FakeWaterMeterDomain(
            connect ??
                (call) {
                  connectCalls.add(call);
                  return TaskEither.right(unit);
                },
            (call) {
              enrollCalls.add(call);
              return enroll(call);
            },
            configure ??
                (call) {
                  configureCalls.add(call);
                  return TaskEither.right(unit);
                },
            rename ??
                (call) {
                  renameCalls.add(call);
                  return TaskEither.right(unit);
                },
          ),
        ),
      ],
    );
    addTearDown(container.dispose);
    notifier = container.read(waterMeterAddProvider.notifier);
    // 模拟页面 watch：保持 autoDispose provider 在 await 间隙不被回收。
    container.listen(waterMeterAddProvider, (_, _) {});
  }

  setUp(() {
    api = _MockWaterMeterApi();
    TTLock.setImplementations(waterMeterApi: api);
    when(
      () => api.accessoryWaterMeterStartScan(),
    ).thenAnswer((_) => const Stream<TTMeterScanModel>.empty());
  });

  tearDown(() {
    BleGuard.reset();
    TTLock.configurePigeon();
  });

  Future<void> beginAdd({
    MeterPayMode payMode = MeterPayMode.prepaid,
    double price = 2.5,
  }) => notifier.beginAdd(payMode: payMode, price: price);

  test('初始步骤是表单，不自动开扫', () async {
    makeContainer(enroll: (_) => TaskEither.right(nonCatOne));
    await container.read(waterMeterAddProvider.future);
    expect(notifier.state.value?.step, isA<WaterMeterAddStepForm>());
    verifyNever(() => api.accessoryWaterMeterStartScan());
  });

  test('表单提交进入扫描；连接成功停在待确认（未 init）', () async {
    makeContainer(enroll: (_) => TaskEither.right(nonCatOne));
    await beginAdd();
    expect(notifier.state.value?.step, isA<WaterMeterAddStepScanning>());
    await notifier.connect(scan);
    expect(
      notifier.state.value?.step,
      isA<WaterMeterAddStepConfirmConnection>(),
    );
    expect(connectCalls.single.scan.mac, 'AA:W1');
    expect(enrollCalls, isEmpty);
  });

  test('连接失败 → failure，不进待确认', () async {
    makeContainer(
      connect: (_) =>
          TaskEither.left(AppException.unknown(message: 'connect down')),
      enroll: (_) => TaskEither.right(nonCatOne),
    );
    await beginAdd();
    await notifier.connect(scan);
    expect(notifier.state.value?.step, isA<WaterMeterAddStepFailure>());
  });

  test('弹窗取消 → 回到扫描继续挑设备，未 init', () async {
    makeContainer(enroll: (_) => TaskEither.right(nonCatOne));
    await beginAdd();
    await notifier.connect(scan);
    await notifier.cancelConnection();
    expect(notifier.state.value?.step, isA<WaterMeterAddStepScanning>());
    expect(enrollCalls, isEmpty);
  });

  test('确认：名称一律用扫描到的设备名（表单已无名称输入）', () async {
    makeContainer(enroll: (_) => TaskEither.right(nonCatOne));
    await beginAdd();
    await notifier.connect(scan);
    await notifier.confirmConnected();
    expect(enrollCalls.single.name, '扫描名');
    expect(enrollCalls.single.payMode, MeterPayMode.prepaid);
    // 预付费：init 用用户在表单里填的单价（需求变更后单价必填）。
    expect(enrollCalls.single.price, 2.5);
  });

  test('确认：计能模式的 init 单价归一化为 0（即便表单传了值）', () async {
    makeContainer(enroll: (_) => TaskEither.right(nonCatOne));
    await notifier.beginAdd(payMode: MeterPayMode.energy, price: 9.9);
    await notifier.connect(scan);
    await notifier.confirmConnected();
    expect(enrollCalls.single.price, 0);
  });

  test('确认后停在 success（不再自动 configureCatOne）', () async {
    makeContainer(enroll: (_) => TaskEither.right(catOneCn));
    await beginAdd();
    await notifier.connect(scan);
    await notifier.confirmConnected();
    final step = notifier.state.value?.step;
    expect(step, isA<WaterMeterAddStepSuccess>());
    expect((step! as WaterMeterAddStepSuccess).meterId, 7);
    expect((step as WaterMeterAddStepSuccess).isCatOne, isTrue);
    expect(configureCalls, isEmpty);
  });

  test('非 Cat.1：「完成」→ 只改名 → done', () async {
    makeContainer(enroll: (_) => TaskEither.right(nonCatOne));
    await beginAdd();
    await notifier.connect(scan);
    await notifier.confirmConnected();
    await notifier.finishSuccess(name: ' 水表A ');

    expect(renameCalls.single.name, '水表A');
    expect(renameCalls.single.meterId, 7);
    expect(configureCalls, isEmpty);
    expect(notifier.state.value?.step, isA<WaterMeterAddStepDone>());
  });

  test('名称留空：「完成」不调 rename', () async {
    makeContainer(enroll: (_) => TaskEither.right(nonCatOne));
    await beginAdd();
    await notifier.connect(scan);
    await notifier.confirmConnected();
    await notifier.finishSuccess(name: '   ');
    expect(renameCalls, isEmpty);
    expect(notifier.state.value?.step, isA<WaterMeterAddStepDone>());
  });

  test('Cat.1 国内：「完成」→ 改名 + configureCatOne(apn: null) → done', () async {
    makeContainer(enroll: (_) => TaskEither.right(catOneCn));
    await beginAdd();
    await notifier.connect(scan);
    await notifier.confirmConnected();
    await notifier.finishSuccess(name: '水表A');

    expect(renameCalls.single.name, '水表A');
    expect(configureCalls.single.apn, isNull);
    expect(configureCalls.single.meterId, 7);
    expect(configureCalls.single.mac, 'AA:W1');
    expect(notifier.state.value?.step, isA<WaterMeterAddStepDone>());
  });

  test('Cat.1 海外：「完成」带 trim 后的 APN', () async {
    makeContainer(enroll: (_) => TaskEither.right(catOneOverseas));
    await beginAdd();
    await notifier.connect(scan);
    await notifier.confirmConnected();
    await notifier.finishSuccess(name: '', apn: ' cmnet ');

    expect(configureCalls.single.apn, 'cmnet');
    expect(notifier.state.value?.step, isA<WaterMeterAddStepDone>());
  });

  test('改名失败不阻断 configureCatOne，且错误进一次性通道', () async {
    makeContainer(
      enroll: (_) => TaskEither.right(catOneCn),
      rename: (_) =>
          TaskEither.left(AppException.unknown(message: 'rename down')),
    );
    await beginAdd();
    await notifier.connect(scan);
    await notifier.confirmConnected();
    await notifier.finishSuccess(name: '水表A');

    expect(configureCalls.single.meterId, 7);
    expect(notifier.state.value?.step, isA<WaterMeterAddStepDone>());
    expect(container.read(waterMeterAddErrorProvider), isNotNull);
  });

  test('configureCatOne 失败也按成功结束，且 done 标记 catOneFailed', () async {
    makeContainer(
      enroll: (_) => TaskEither.right(catOneCn),
      configure: (_) =>
          TaskEither.left(AppException.unknown(message: 'configServer down')),
    );
    await beginAdd();
    await notifier.connect(scan);
    await notifier.confirmConnected();
    await notifier.finishSuccess(name: '');

    final step = notifier.state.value?.step;
    expect(step, isA<WaterMeterAddStepDone>());
    expect((step! as WaterMeterAddStepDone).catOneFailed, isTrue);
  });

  test('入网失败 → failure；重试回扫描', () async {
    makeContainer(
      enroll: (_) => TaskEither.left(AppException.unknown(message: 'ble down')),
    );
    await beginAdd();
    await notifier.connect(scan);
    await notifier.confirmConnected();
    expect(notifier.state.value?.step, isA<WaterMeterAddStepFailure>());
    await notifier.restart();
    expect(notifier.state.value?.step, isA<WaterMeterAddStepScanning>());
  });

  test('success 上的返回（skipSuccess）→ 直接 done，不改名不配置', () async {
    makeContainer(enroll: (_) => TaskEither.right(catOneCn));
    await beginAdd();
    await notifier.connect(scan);
    await notifier.confirmConnected();
    notifier.skipSuccess();

    expect(renameCalls, isEmpty);
    expect(configureCalls, isEmpty);
    expect(notifier.state.value?.step, isA<WaterMeterAddStepDone>());
  });
}
