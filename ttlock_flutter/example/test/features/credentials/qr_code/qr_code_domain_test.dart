import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/data/repository/qr_code_repository.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/entity/qr_code.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/provider/qr_code_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import '../../../helpers/mock_tt_lock_api.dart';

class _MockQrCodeRepo extends Mock implements QrCodeRepository {}

/// class 型 Provider 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeQrCodeRepository extends QrCodeRepository {
  _FakeQrCodeRepository(this._mock);
  final _MockQrCodeRepo _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, PageState<QrCodeEntity>> list(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
    String? name,
  }) => _mock.list(lockId, pageNo: pageNo, pageSize: pageSize, name: name);

  @override
  TaskEither<AppException, QrCodeEntity> add(
    int lockId, {
    String? qrCodeName,
    String? qrCodeNumber,
    DateTime? startDate,
    DateTime? endDate,
    QrCodeType type = QrCodeType.limited,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.cloudOnly,
  }) => _mock.add(
    lockId,
    qrCodeName: qrCodeName,
    qrCodeNumber: qrCodeNumber,
    startDate: startDate,
    endDate: endDate,
    type: type,
    cyclicConfig: cyclicConfig,
    channel: channel,
  );

  @override
  TaskEither<AppException, Unit> update(
    int qrCodeId, {
    required QrCodeType type,
    String? name,
    DateTime? startDate,
    DateTime? endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.cloudOnly,
  }) => _mock.update(
    qrCodeId,
    type: type,
    name: name,
    startDate: startDate,
    endDate: endDate,
    cyclicConfig: cyclicConfig,
    channel: channel,
  );

  @override
  TaskEither<AppException, QrCodeEntity> getData(int qrCodeId) =>
      _mock.getData(qrCodeId);

  @override
  TaskEither<AppException, Unit> delete(
    int lockId,
    int qrCodeId, {
    ChannelType channel = ChannelType.cloudOnly,
  }) => _mock.delete(lockId, qrCodeId, channel: channel);

  @override
  TaskEither<AppException, Unit> clear(int lockId) => _mock.clear(lockId);
}

QrCodeEntity _limitedQr({int qrCodeId = 9, String qrCodeNumber = 'Q1'}) =>
    QrCodeEntity(
      qrCodeId: qrCodeId,
      qrCodeNumber: qrCodeNumber,
      type: QrCodeType.limited,
      startDate: DateTime(2026, 1, 1),
      endDate: DateTime(2026, 6, 1),
    );

const _cloudLock = LockEntity(lockId: 1, lockData: 'ld', hasGateway: false);
const _gatewayLock = LockEntity(lockId: 1, lockData: 'ld', hasGateway: true);

void main() {
  late _MockQrCodeRepo repo;
  late MockTTLockApi ttlock;
  late ProviderContainer container;
  late QrCodeDomain domain;

  void stubCustom(bool supported) {
    when(
      () => ttlock.supportFunction(
        TTLockFunction.customQRCode,
        any(),
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((_) async => supported);
  }

  setUpAll(() {
    registerTtLockFallbacks();
    registerFallbackValue(Duration.zero);
    registerFallbackValue(TTAliasType.card);
    registerFallbackValue(TTCycleModel(weekDay: 1, startTime: 0, endTime: 1));
    registerFallbackValue(DateTime(2026));
    registerFallbackValue(QrCodeType.limited);
    registerFallbackValue(ChannelType.cloudOnly);
    registerFallbackValue(const <CyclicConfig>[]);
    registerFallbackValue(<TTCycleModel>[]);
  });

  tearDown(resetTtLockTestHooks);

  setUp(() {
    repo = _MockQrCodeRepo();
    ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
    stubCustom(false);
    container = ProviderContainer(
      overrides: [
        qrCodeRepositoryProvider.overrideWith(
          () => _FakeQrCodeRepository(repo),
        ),
      ],
    );
    addTearDown(container.dispose);
    domain = container.read(qrCodeDomainProvider.notifier);
  });

  test('qrCodeTypeFor maps 2/1/4', () {
    expect(
      qrCodeTypeFor(CredentialValidityKind.permanent),
      QrCodeType.permanent,
    );
    expect(qrCodeTypeFor(CredentialValidityKind.limited), QrCodeType.limited);
    expect(qrCodeTypeFor(CredentialValidityKind.cyclic), QrCodeType.cycle);
  });

  test('add 仅 qrCode：cloudOnly 并返回 link', () async {
    when(
      () => repo.add(
        1,
        qrCodeName: '小明',
        qrCodeNumber: any(named: 'qrCodeNumber'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        type: QrCodeType.limited,
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.cloudOnly,
      ),
    ).thenAnswer(
      (_) => TaskEither.right(
        const QrCodeEntity(qrCodeId: 1, link: 'https://ttekey.com/q?k=x'),
      ),
    );
    final e =
        (await domain
                .add(
                  lock: _cloudLock,
                  name: '小明',
                  kind: CredentialValidityKind.limited,
                  start: DateTime(2026, 1, 1),
                  end: DateTime(2026, 6, 1),
                )
                .run())
            .getOrElse((_) => throw TestFailure('left'));
    expect(e.link, contains('ttekey.com'));
    verifyNever(
      () => ttlock.addQrCode(
        any(),
        any(),
        any(),
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
  });

  test('add 仅 qrCode：不调用 addQrCode', () async {
    when(
      () => repo.add(
        any(),
        qrCodeName: any(named: 'qrCodeName'),
        qrCodeNumber: any(named: 'qrCodeNumber'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        type: any(named: 'type'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.cloudOnly,
      ),
    ).thenAnswer((_) => TaskEither.right(const QrCodeEntity(qrCodeId: 1)));
    await domain
        .add(lock: _cloudLock, name: 'n', kind: CredentialValidityKind.permanent)
        .run();
    verifyNever(
      () => ttlock.addQrCode(
        any(),
        any(),
        any(),
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
  });

  test('add 仅 qrCode：cyclic forwards type=4 and cyclicConfig', () async {
    QrCodeType? gotType;
    List<CyclicConfig>? gotCfg;
    DateTime? gotStart;
    DateTime? gotEnd;
    when(
      () => repo.add(
        any(),
        qrCodeName: any(named: 'qrCodeName'),
        qrCodeNumber: any(named: 'qrCodeNumber'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        type: any(named: 'type'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.cloudOnly,
      ),
    ).thenAnswer((inv) {
      gotType = inv.namedArguments[#type] as QrCodeType?;
      gotCfg = inv.namedArguments[#cyclicConfig] as List<CyclicConfig>?;
      gotStart = inv.namedArguments[#startDate] as DateTime?;
      gotEnd = inv.namedArguments[#endDate] as DateTime?;
      return TaskEither.right(const QrCodeEntity(qrCodeId: 1));
    });
    const schedule = CyclicSchedule(
      weekDays: {1, 3},
      startMinutes: 480,
      endMinutes: 1080,
    );
    final r = await domain
        .add(
          lock: _cloudLock,
          name: 'cycle',
          kind: CredentialValidityKind.cyclic,
          start: DateTime(2026, 1, 1, 12),
          end: DateTime(2026, 12, 31, 12),
          schedule: schedule,
        )
        .run();
    expect(r.isRight(), isTrue);
    expect(gotType, QrCodeType.cycle);
    expect(gotType!.value, 4);
    expect(gotCfg!.map((e) => e.weekDay), [1, 3]);
    expect(gotStart!.hour, 0);
    expect(gotEnd!.millisecond, 999);
    verifyNever(
      () => ttlock.addQrCode(
        any(),
        any(),
        any(),
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
  });

  test('add customQRCode：有网关走 gatewayWifi 并带 qrCodeNumber', () async {
    stubCustom(true);
    String? gotNumber;
    ChannelType? gotChannel;
    when(
      () => repo.add(
        1,
        qrCodeName: any(named: 'qrCodeName'),
        qrCodeNumber: any(named: 'qrCodeNumber'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        type: any(named: 'type'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.gatewayWifi,
      ),
    ).thenAnswer((inv) {
      gotNumber = inv.namedArguments[#qrCodeNumber] as String?;
      gotChannel = inv.namedArguments[#channel] as ChannelType?;
      return TaskEither.right(const QrCodeEntity(qrCodeId: 2, link: 'L'));
    });
    final r = await domain
        .add(
          lock: _gatewayLock,
          name: 'custom',
          kind: CredentialValidityKind.limited,
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 6, 1),
        )
        .run();
    expect(r.isRight(), isTrue);
    expect(gotChannel, ChannelType.gatewayWifi);
    expect(gotNumber, isNotNull);
    final n = int.parse(gotNumber!);
    expect(n, greaterThan(65535));
    expect(n, lessThanOrEqualTo(4294967295));
    verifyNever(
      () => ttlock.addQrCode(
        any(),
        any(),
        any(),
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
  });

  test('add customQRCode：网关失败 → BLE addQrCode 再 bleSynced', () async {
    stubCustom(true);
    when(
      () => repo.add(
        any(),
        qrCodeName: any(named: 'qrCodeName'),
        qrCodeNumber: any(named: 'qrCodeNumber'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        type: any(named: 'type'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.gatewayWifi,
      ),
    ).thenAnswer(
      (_) => TaskEither.left(
        AppException.network(exception: Exception('down'), message: 'down'),
      ),
    );
    when(
      () => ttlock.addQrCode(
        any(),
        any(),
        any(),
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => repo.add(
        any(),
        qrCodeName: any(named: 'qrCodeName'),
        qrCodeNumber: any(named: 'qrCodeNumber'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        type: any(named: 'type'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    ).thenAnswer((_) => TaskEither.right(const QrCodeEntity(qrCodeId: 3)));
    final r = await domain
        .add(
          lock: _gatewayLock,
          name: 'custom',
          kind: CredentialValidityKind.limited,
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 6, 1),
        )
        .run();
    expect(r.isRight(), isTrue);
    verify(
      () => ttlock.addQrCode(
        any(),
        any(),
        any(),
        any(),
        'ld',
        timeout: any(named: 'timeout'),
      ),
    ).called(1);
    verify(
      () => repo.add(
        1,
        qrCodeName: any(named: 'qrCodeName'),
        qrCodeNumber: any(named: 'qrCodeNumber'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        type: any(named: 'type'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    ).called(1);
  });

  test('delete 仅 qrCode：cloudOnly，不调 SDK', () async {
    when(
      () => repo.delete(1, 9, channel: ChannelType.cloudOnly),
    ).thenAnswer((_) => TaskEither.right(unit));
    final r = await domain
        .delete(lock: _cloudLock, qrCode: _limitedQr())
        .run();
    expect(r.isRight(), isTrue);
    verify(() => repo.delete(1, 9, channel: ChannelType.cloudOnly)).called(1);
    verifyNever(() => repo.clear(any()));
    verifyNever(
      () => ttlock.deleteQrCode(
        any(),
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
  });

  test('delete customQRCode：有网关走 gatewayWifi', () async {
    stubCustom(true);
    when(
      () => repo.delete(1, 9, channel: ChannelType.gatewayWifi),
    ).thenAnswer((_) => TaskEither.right(unit));
    final r = await domain
        .delete(lock: _gatewayLock, qrCode: _limitedQr())
        .run();
    expect(r.isRight(), isTrue);
    verify(() => repo.delete(1, 9, channel: ChannelType.gatewayWifi)).called(1);
    verifyNever(
      () => ttlock.deleteQrCode(
        any(),
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
  });

  test('delete customQRCode：网关失败 → BLE deleteQrCode 再 bleSynced', () async {
    stubCustom(true);
    when(
      () => repo.delete(1, 9, channel: ChannelType.gatewayWifi),
    ).thenAnswer(
      (_) => TaskEither.left(
        AppException.network(exception: Exception('down'), message: 'down'),
      ),
    );
    when(
      () => ttlock.deleteQrCode(
        any(),
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => repo.delete(1, 9, channel: ChannelType.bleSynced),
    ).thenAnswer((_) => TaskEither.right(unit));
    final qr = _limitedQr();
    final r = await domain.delete(lock: _gatewayLock, qrCode: qr).run();
    expect(r.isRight(), isTrue);
    verify(
      () => ttlock.deleteQrCode(
        'Q1',
        qr.endDate!.millisecondsSinceEpoch,
        'ld',
        timeout: any(named: 'timeout'),
      ),
    ).called(1);
    verify(() => repo.delete(1, 9, channel: ChannelType.bleSynced)).called(1);
  });

  test('changePeriod permanent returns Left without BLE', () async {
    final r = await domain
        .changePeriod(
          lock: _gatewayLock,
          qrCode: const QrCodeEntity(
            qrCodeId: 9,
            type: QrCodeType.permanent,
            qrCodeNumber: 'Q1',
          ),
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 2, 1),
        )
        .run();
    expect(r.isLeft(), isTrue);
    r.fold((err) {
      expect((err as AppBusinessException).code, -23);
    }, (_) => fail('expected left'));
    verifyNever(
      () => ttlock.modifyQrCodeValidityPeriod(
        any(),
        any(),
        any(),
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
    verifyNever(
      () => repo.update(
        any(),
        type: any(named: 'type'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: any(named: 'channel'),
      ),
    );
  });

  test('changePeriod 仅 qrCode：cloudOnly，不调 SDK', () async {
    QrCodeType? gotType;
    ChannelType? gotChannel;
    when(
      () => repo.update(
        9,
        type: any(named: 'type'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.cloudOnly,
      ),
    ).thenAnswer((inv) {
      gotType = inv.namedArguments[#type] as QrCodeType?;
      gotChannel = inv.namedArguments[#channel] as ChannelType?;
      return TaskEither.right(unit);
    });
    await domain
        .changePeriod(
          lock: _gatewayLock,
          qrCode: _limitedQr(),
          start: DateTime(2026, 3, 1),
          end: DateTime(2026, 4, 1),
        )
        .run();
    expect(gotType, QrCodeType.limited);
    expect(gotChannel, ChannelType.cloudOnly);
    verifyNever(
      () => ttlock.modifyQrCodeValidityPeriod(
        any(),
        any(),
        any(),
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
  });

  test('changePeriod 仅 qrCode：cyclic 走 cloudOnly', () async {
    List<CyclicConfig>? gotCfg;
    DateTime? gotStart;
    DateTime? gotEnd;
    when(
      () => repo.update(
        any(),
        type: QrCodeType.cycle,
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.cloudOnly,
      ),
    ).thenAnswer((inv) {
      gotStart = inv.namedArguments[#startDate] as DateTime?;
      gotEnd = inv.namedArguments[#endDate] as DateTime?;
      gotCfg = inv.namedArguments[#cyclicConfig] as List<CyclicConfig>?;
      return TaskEither.right(unit);
    });
    const schedule = CyclicSchedule(
      weekDays: {1},
      startMinutes: 60,
      endMinutes: 120,
    );
    await domain
        .changePeriod(
          lock: _gatewayLock,
          qrCode: QrCodeEntity(
            qrCodeId: 9,
            qrCodeNumber: 'Q1',
            type: QrCodeType.cycle,
            startDate: DateTime(2026, 1, 1),
            endDate: DateTime(2026, 2, 1),
            cyclicConfig: const [
              CyclicConfig(weekDay: 1, startTime: 60, endTime: 120),
            ],
          ),
          start: DateTime(2026, 3, 1, 15),
          end: DateTime(2026, 4, 1, 15),
          schedule: schedule,
        )
        .run();
    expect(gotStart!.hour, 0);
    expect(gotEnd!.hour, 23);
    expect(gotCfg!.single.weekDay, 1);
    verifyNever(
      () => ttlock.modifyQrCodeValidityPeriod(
        any(),
        any(),
        any(),
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
  });

  test('changePeriod customQRCode：有网关走 gatewayWifi', () async {
    stubCustom(true);
    ChannelType? gotChannel;
    when(
      () => repo.update(
        9,
        type: any(named: 'type'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.gatewayWifi,
      ),
    ).thenAnswer((inv) {
      gotChannel = inv.namedArguments[#channel] as ChannelType?;
      return TaskEither.right(unit);
    });
    await domain
        .changePeriod(
          lock: _gatewayLock,
          qrCode: _limitedQr(),
          start: DateTime(2026, 3, 1),
          end: DateTime(2026, 4, 1),
        )
        .run();
    expect(gotChannel, ChannelType.gatewayWifi);
    verifyNever(
      () => ttlock.modifyQrCodeValidityPeriod(
        any(),
        any(),
        any(),
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
  });

  test('changePeriod customQRCode：网关失败且有 lockData → BLE 再 bleSynced', () async {
    stubCustom(true);
    when(
      () => repo.update(
        any(),
        type: any(named: 'type'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.gatewayWifi,
      ),
    ).thenAnswer(
      (_) => TaskEither.left(
        AppException.network(exception: Exception('down'), message: 'down'),
      ),
    );
    when(
      () => ttlock.modifyQrCodeValidityPeriod(
        any(),
        any(),
        any(),
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => repo.update(
        any(),
        type: any(named: 'type'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    final r = await domain
        .changePeriod(
          lock: _gatewayLock,
          qrCode: _limitedQr(),
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 2, 1),
        )
        .run();
    expect(r.isRight(), isTrue);
    verify(
      () => ttlock.modifyQrCodeValidityPeriod(
        'Q1',
        any(),
        any(),
        any(),
        'ld',
        timeout: any(named: 'timeout'),
      ),
    ).called(1);
    verify(
      () => repo.update(
        9,
        type: QrCodeType.limited,
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    ).called(1);
  });
}
