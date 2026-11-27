import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/ble/keypad_enroll_timeout.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/data/repository/identity_card_repository.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/entity/identity_card.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/provider/card_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import '../../../helpers/mock_tt_lock_api.dart';

class _MockIdentityCardRepo extends Mock implements IdentityCardRepository {}

/// class 型 Provider 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeIdentityCardRepository extends IdentityCardRepository {
  _FakeIdentityCardRepository(this._mock);
  final _MockIdentityCardRepo _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, List<IdentityCardEntity>> list(int lockId) =>
      _mock.list(lockId);

  @override
  TaskEither<AppException, int> add(
    int lockId,
    String cardNumber, {
    String? cardName,
    DateTime? startDate,
    DateTime? endDate,
    CredentialType cardType = CredentialType.normal,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) => _mock.add(
    lockId,
    cardNumber,
    cardName: cardName,
    startDate: startDate,
    endDate: endDate,
    cardType: cardType,
    cyclicConfig: cyclicConfig,
    channel: channel,
  );

  @override
  TaskEither<AppException, Unit> changePeriod(
    int lockId,
    int cardId, {
    required DateTime startDate,
    required DateTime endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) => _mock.changePeriod(
    lockId,
    cardId,
    startDate: startDate,
    endDate: endDate,
    cyclicConfig: cyclicConfig,
    channel: channel,
  );

  @override
  TaskEither<AppException, Unit> delete(
    int lockId,
    int cardId, {
    ChannelType channel = ChannelType.bleSynced,
  }) => _mock.delete(lockId, cardId, channel: channel);

  @override
  TaskEither<AppException, Unit> rename(int lockId, int cardId, String name) =>
      _mock.rename(lockId, cardId, name);
}

IdentityCardEntity _limitedCard() => IdentityCardEntity(
  cardId: 3,
  cardNumber: 'AA',
  startDate: DateTime(2026, 1, 1),
  endDate: DateTime(2026, 2, 1),
);

void main() {
  late _MockIdentityCardRepo repo;
  late MockTTLockApi ttlock;
  late MockTTRemoteKeypadApi keypad;
  late ProviderContainer container;
  late CardDomain domain;

  setUpAll(() {
    registerTtLockFallbacks();
    registerFallbackValue(Duration.zero);
    registerFallbackValue(TTAliasType.card);
    registerFallbackValue(TTCycleModel(weekDay: 1, startTime: 0, endTime: 1));
    registerFallbackValue(DateTime(2026));
    registerFallbackValue(ChannelType.bleSynced);
    registerFallbackValue(CredentialType.normal);
    registerFallbackValue(TTLockFunction.icCard);
    registerFallbackValue(TTAliasType.card);
    registerFallbackValue(const LockEntity());
    registerFallbackValue(const <CyclicConfig>[]);
    registerFallbackValue(<TTCycleModel>[]);
  });

  tearDown(resetTtLockTestHooks);

  setUp(() {
    repo = _MockIdentityCardRepo();
    ttlock = MockTTLockApi();
    keypad = MockTTRemoteKeypadApi();
    installMockAccessoryApis(lockApi: ttlock, remoteKeypadApi: keypad);
    container = ProviderContainer(
      overrides: [
        identityCardRepositoryProvider.overrideWith(
          () => _FakeIdentityCardRepository(repo),
        ),
      ],
    );
    addTearDown(container.dispose);
    domain = container.read(cardDomainProvider.notifier);
  });

  test('addViaBle 转发给 ttlock.addCard', () async {
    when(
      () => ttlock.lockAddCard('ld', cycleList: any(named: 'cycleList'), startDate: any(named: 'startDate'), endDate: any(named: 'endDate')),
    ).thenAnswer(
      (_) => Stream.fromIterable([
        AddCardEvent(phase: TTAddCardPhase.waiting),
        AddCardEvent(
          phase: TTAddCardPhase.success,
          cardNumber: 'AA',
        ),
      ]),
    );
    final events = await domain
        .addViaBle(lockData: 'ld', startMs: 0, endMs: 0)
        .toList();
    expect(events.last.cardNumber, 'AA');
  });

  test('confirmAdd 调 repo.add channel=bleSynced', () async {
    when(() => ttlock.supportFunction(any(), any(), timeout: any(named: 'timeout'))).thenAnswer((_) async => false);
    when(
      () => repo.add(
        1,
        'AA',
        cardName: 'n',
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cardType: CredentialType.normal,
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    ).thenAnswer((_) => TaskEither.right(3));
    final id =
        (await domain
                .confirmAdd(
                  lockId: 1,
                  lockData: 'ld',
                  cardNumber: 'AA',
                  cardName: 'n',
                  kind: CredentialValidityKind.permanent,
                  start: null,
                  end: null,
                )
                .run())
            .getOrElse((_) => throw TestFailure('left'));
    expect(id, 3);
    verifyNever(
      () => ttlock.setAlias(any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
  });

  test('confirmAdd 奕诺+supportSetAlias：先 setAlias(card) 再云端 add', () async {
    when(
      () => ttlock.supportFunction(TTLockFunction.yiNuoPhotoFace, 'ld', timeout: any(named: 'timeout')),
    ).thenAnswer((_) async => true);
    when(
      () => ttlock.supportFunction(TTLockFunction.supportSetAlias, 'ld', timeout: any(named: 'timeout')),
    ).thenAnswer((_) async => true);
    when(
      () => ttlock.setAlias(TTAliasType.card, 'AA', 'n', 'ld', timeout: any(named: 'timeout')),
    ).thenAnswer((_) async {});
    when(
      () => repo.add(
        1,
        'AA',
        cardName: 'n',
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cardType: CredentialType.normal,
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    ).thenAnswer((_) => TaskEither.right(3));
    await domain
        .confirmAdd(
          lockId: 1,
          lockData: 'ld',
          cardNumber: 'AA',
          cardName: 'n',
          kind: CredentialValidityKind.permanent,
          start: null,
          end: null,
        )
        .run();
    verifyInOrder([
      () => ttlock.setAlias(TTAliasType.card, 'AA', 'n', 'ld', timeout: any(named: 'timeout')),
      () => repo.add(
        1,
        'AA',
        cardName: 'n',
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cardType: CredentialType.normal,
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    ]);
  });

  test('confirmAdd setAlias 失败则不调云端 add', () async {
    when(() => ttlock.supportFunction(any(), any(), timeout: any(named: 'timeout'))).thenAnswer((_) async => true);
    when(
      () => ttlock.setAlias(any(), any(), any(), any(), timeout: any(named: 'timeout')),
    ).thenThrow(AppException.business(code: -21, message: 'ble'));
    final r = await domain
        .confirmAdd(
          lockId: 1,
          lockData: 'ld',
          cardNumber: 'AA',
          cardName: 'n',
          kind: CredentialValidityKind.permanent,
          start: null,
          end: null,
        )
        .run();
    expect(r.isLeft(), isTrue);
    verifyNever(
      () => repo.add(
        any(),
        any(),
        cardName: any(named: 'cardName'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cardType: any(named: 'cardType'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: any(named: 'channel'),
      ),
    );
  });

  test('delete：有网关只调 repo deleteType=2', () async {
    when(
      () => repo.delete(1, 3, channel: ChannelType.gatewayWifi),
    ).thenAnswer((_) => TaskEither.right(unit));
    await domain
        .delete(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          card: const IdentityCardEntity(cardId: 3, cardNumber: 'AA'),
        )
        .run();
    verifyNever(() => ttlock.deleteCard(any(), any(), timeout: any(named: 'timeout')));
  });

  test('confirmAdd 永久 start/end 为 epoch 0', () async {
    when(() => ttlock.supportFunction(any(), any(), timeout: any(named: 'timeout'))).thenAnswer((_) async => false);
    when(
      () => repo.add(
        any(),
        any(),
        cardName: any(named: 'cardName'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cardType: any(named: 'cardType'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: any(named: 'channel'),
      ),
    ).thenAnswer((_) => TaskEither.right(3));
    await domain
        .confirmAdd(
          lockId: 1,
          lockData: 'ld',
          cardNumber: 'AA',
          cardName: 'n',
          kind: CredentialValidityKind.permanent,
          start: null,
          end: null,
        )
        .run();
    final captured = verify(
      () => repo.add(
        1,
        'AA',
        cardName: 'n',
        startDate: captureAny(named: 'startDate'),
        endDate: captureAny(named: 'endDate'),
        cardType: CredentialType.normal,
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    ).captured;
    expect((captured[0] as DateTime).millisecondsSinceEpoch, 0);
    expect((captured[1] as DateTime).millisecondsSinceEpoch, 0);
  });

  test('confirmAdd cyclic forwards cardType and cyclicConfig', () async {
    when(() => ttlock.supportFunction(any(), any(), timeout: any(named: 'timeout'))).thenAnswer((_) async => false);
    CredentialType? gotType;
    List<CyclicConfig>? gotCfg;
    DateTime? gotStart;
    DateTime? gotEnd;
    when(
      () => repo.add(
        any(),
        any(),
        cardName: any(named: 'cardName'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cardType: any(named: 'cardType'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: any(named: 'channel'),
      ),
    ).thenAnswer((inv) {
      gotStart = inv.namedArguments[#startDate] as DateTime?;
      gotEnd = inv.namedArguments[#endDate] as DateTime?;
      gotType = inv.namedArguments[#cardType] as CredentialType?;
      gotCfg = inv.namedArguments[#cyclicConfig] as List<CyclicConfig>?;
      return TaskEither.right(3);
    });
    const schedule = CyclicSchedule(
      weekDays: {1, 2},
      startMinutes: 480,
      endMinutes: 1080,
    );
    await domain
        .confirmAdd(
          lockId: 1,
          lockData: 'ld',
          cardNumber: 'AA',
          cardName: 'n',
          kind: CredentialValidityKind.cyclic,
          start: DateTime(2026, 3, 1),
          end: DateTime(2026, 4, 1),
          schedule: schedule,
        )
        .run();
    expect(gotType, CredentialType.cycle);
    expect(gotCfg, hasLength(2));
    expect(gotStart!.hour, 0);
    expect(gotEnd!.hour, 23);
  });

  test('confirmAdd supports 抛错视为 false，跳过 setAlias 继续 add', () async {
    when(
      () => ttlock.supportFunction(any(), any(), timeout: any(named: 'timeout')),
    ).thenThrow(AppException.business(code: -21, message: 'ble'));
    when(
      () => repo.add(
        1,
        'AA',
        cardName: 'n',
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cardType: CredentialType.normal,
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    ).thenAnswer((_) => TaskEither.right(3));
    final id =
        (await domain
                .confirmAdd(
                  lockId: 1,
                  lockData: 'ld',
                  cardNumber: 'AA',
                  cardName: 'n',
                  kind: CredentialValidityKind.permanent,
                  start: null,
                  end: null,
                )
                .run())
            .getOrElse((_) => throw TestFailure('left'));
    expect(id, 3);
    verifyNever(
      () => ttlock.setAlias(any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
  });

  test('confirmAdd 空别名跳过 setAlias', () async {
    when(() => ttlock.supportFunction(any(), any(), timeout: any(named: 'timeout'))).thenAnswer((_) async => true);
    when(
      () => repo.add(
        1,
        'AA',
        cardName: '  ',
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cardType: CredentialType.normal,
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    ).thenAnswer((_) => TaskEither.right(3));
    await domain
        .confirmAdd(
          lockId: 1,
          lockData: 'ld',
          cardNumber: 'AA',
          cardName: '  ',
          kind: CredentialValidityKind.permanent,
          start: null,
          end: null,
        )
        .run();
    verifyNever(
      () => ttlock.setAlias(any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
  });

  test('cancelAdd 后不再 emit，且不经过云端 add', () async {
    final controller = StreamController<AddCardEvent>();
    when(
      () => ttlock.lockAddCard(any(), cycleList: any(named: 'cycleList'), startDate: any(named: 'startDate'), endDate: any(named: 'endDate')),
    ).thenAnswer((_) => controller.stream);
    final events = <AddCardEvent>[];
    final sub = domain
        .addViaBle(lockData: 'ld', startMs: 0, endMs: 0)
        .listen(events.add);
    addTearDown(() async {
      await sub.cancel();
      await controller.close();
    });
    controller.add(AddCardEvent(phase: TTAddCardPhase.waiting));
    await Future<void>.delayed(Duration.zero);
    domain.cancelAdd();
    controller.add(
      AddCardEvent(
        phase: TTAddCardPhase.success,
        cardNumber: 'AA',
      ),
    );
    await Future<void>.delayed(Duration.zero);
    expect(events.where((e) => e.cardNumber == 'AA'), isEmpty);
    verifyNever(
      () => repo.add(
        any(),
        any(),
        cardName: any(named: 'cardName'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cardType: any(named: 'cardType'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: any(named: 'channel'),
      ),
    );
  });

  test('rename 只调云端，不 setAlias', () async {
    when(
      () => repo.rename(1, 3, 'n2'),
    ).thenAnswer((_) => TaskEither.right(unit));
    await domain
        .rename(
          lock: const LockEntity(lockId: 1, lockData: 'ld'),
          card: const IdentityCardEntity(cardId: 3, cardNumber: 'AA'),
          name: 'n2',
        )
        .run();
    verify(() => repo.rename(1, 3, 'n2')).called(1);
    verifyNever(
      () => ttlock.setAlias(any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
  });

  test('changePeriod permanent card returns Left without BLE', () async {
    final r = await domain
        .changePeriod(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          card: const IdentityCardEntity(cardId: 3, cardNumber: 'AA'),
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 2, 1),
        )
        .run();
    expect(r.isLeft(), isTrue);
    r.fold((err) {
      expect((err as AppBusinessException).code, -23);
    }, (_) => fail('expected left'));
    verifyNever(
      () => ttlock.modifyCardValidityPeriod(any(), any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
    verifyNever(
      () => repo.changePeriod(
        any(),
        any(),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: any(named: 'channel'),
      ),
    );
  });

  test('changePeriod：有网关只调 repo channel=gatewayWifi', () async {
    when(
      () => repo.changePeriod(
        1,
        3,
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.gatewayWifi,
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    await domain
        .changePeriod(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          card: _limitedCard(),
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 2, 1),
        )
        .run();
    verifyNever(
      () => ttlock.modifyCardValidityPeriod(any(), any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
  });

  test('changePeriod cyclic forwards cyclicConfig and cycleList', () async {
    List<CyclicConfig>? gotCfg;
    DateTime? gotStart;
    DateTime? gotEnd;
    when(
      () => repo.changePeriod(
        any(),
        any(),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.gatewayWifi,
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
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          card: IdentityCardEntity(
            cardId: 3,
            cardNumber: 'AA',
            cardType: CredentialType.cycle,
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
      () => ttlock.modifyCardValidityPeriod(any(), any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
  });

  test('changePeriod：网关失败且有 lockData → BLE 再 bleSynced', () async {
    when(
      () => repo.changePeriod(
        any(),
        any(),
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
      () => ttlock.modifyCardValidityPeriod(any(), any(), any(), any(), any(), timeout: any(named: 'timeout')),
    ).thenAnswer((_) async {});
    when(
      () => repo.changePeriod(
        any(),
        any(),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    final r = await domain
        .changePeriod(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          card: _limitedCard(),
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 2, 1),
        )
        .run();
    expect(r.isRight(), isTrue);
    verify(
      () => ttlock.modifyCardValidityPeriod('AA', any(), any(), any(), 'ld', timeout: any(named: 'timeout')),
    ).called(1);
  });

  test('list 透传 repo.list', () async {
    when(() => repo.list(1)).thenAnswer(
      (_) => TaskEither.right(const [
        IdentityCardEntity(cardId: 3, cardNumber: 'AA'),
      ]),
    );
    final items = (await domain.list(1).run()).getOrElse(
      (_) => throw TestFailure('left'),
    );
    expect(items.single.cardId, 3);
  });

  test('addViaKeypad 转发给 accessoryAddKeypadCard', () async {
    when(
      () => keypad.accessoryAddKeypadCard(
        keypadMac: any(named: 'keypadMac'),
        lockData: any(named: 'lockData'),
        cycleList: any(named: 'cycleList'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
      ),
    ).thenAnswer(
      (_) => Stream.fromIterable([
        AddCardEvent(phase: TTAddCardPhase.waiting),
        AddCardEvent(phase: TTAddCardPhase.success, cardNumber: 'K1'),
      ]),
    );

    final events = await domain
        .addViaKeypad(
          keypadMac: 'AA:BB',
          lockData: 'ld',
          startMs: 0,
          endMs: 0,
        )
        .toList();

    expect(events.last.cardNumber, 'K1');
    verify(
      () => keypad.accessoryAddKeypadCard(
        keypadMac: 'AA:BB',
        lockData: 'ld',
        cycleList: null,
        startDate: 0,
        endDate: 0,
      ),
    ).called(1);
  });

  test('addViaKeypad：原生 TIMEOUT 转成 -28 业务码', () async {
    when(
      () => keypad.accessoryAddKeypadCard(
        keypadMac: any(named: 'keypadMac'),
        lockData: any(named: 'lockData'),
        cycleList: any(named: 'cycleList'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
      ),
    ).thenAnswer(
      (_) => Stream.error(
        TTMultifunctionalKeypadException(
          TTMultifunctionalKeypadError.timeout,
          '等待键盘刷卡超时',
        ),
      ),
    );

    Object? caught;
    try {
      await domain
          .addViaKeypad(
            keypadMac: 'AA:BB',
            lockData: 'ld',
            startMs: 0,
            endMs: 0,
          )
          .toList();
    } on Object catch (e) {
      caught = e;
    }

    expect(caught, isA<AppBusinessException>());
    expect((caught! as AppBusinessException).code, kKeypadEnrollTimeoutCode);
  });
}
