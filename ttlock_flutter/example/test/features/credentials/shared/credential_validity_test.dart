import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';

void main() {
  test('CyclicSchedule expands sorted weekDays', () {
    final s = CyclicSchedule(
      weekDays: {3, 1},
      startMinutes: 480,
      endMinutes: 1080,
    );
    expect(s.isValid, isTrue);
    final cfg = s.toCyclicConfig();
    expect(cfg.map((e) => e.weekDay), [1, 3]);
    expect(cfg.first.startTime, 480);
    expect(s.toCycleModels().first.weekDay, 1);
  });

  test('isValid rejects empty days and equal times', () {
    expect(
      const CyclicSchedule(
        weekDays: {},
        startMinutes: 0,
        endMinutes: 60,
      ).isValid,
      isFalse,
    );
    expect(
      CyclicSchedule(weekDays: {1}, startMinutes: 100, endMinutes: 100).isValid,
      isFalse,
    );
  });

  test('cyclicDayStart/End local bounds', () {
    final d = DateTime(2026, 9, 4, 15, 30);
    expect(cyclicDayStart(d), DateTime(2026, 9, 4, 0, 0, 0, 0));
    expect(cyclicDayEnd(d), DateTime(2026, 9, 4, 23, 59, 59, 999));
  });

  test('resolveValidity cyclic requires schedule', () {
    expect(
      () => resolveValidity(
        kind: CredentialValidityKind.cyclic,
        start: DateTime(2026, 1, 1),
        end: DateTime(2026, 12, 31),
        schedule: null,
      ),
      throwsA(isA<ArgumentError>()),
    );
    final r = resolveValidity(
      kind: CredentialValidityKind.cyclic,
      start: DateTime(2026, 1, 1, 12),
      end: DateTime(2026, 12, 31, 12),
      schedule: CyclicSchedule(
        weekDays: {1},
        startMinutes: 480,
        endMinutes: 1080,
      ),
    );
    expect(r.type, CredentialType.cycle);
    expect(r.start!.hour, 0);
    expect(r.end!.millisecond, 999);
    expect(r.cycleList, isNotNull);
    expect(r.cycleList, isNotEmpty);
  });

  test('resolveValidity limited uses null cycleList', () {
    final r = resolveValidity(
      kind: CredentialValidityKind.limited,
      start: DateTime(2026, 1, 1, 8),
      end: DateTime(2026, 1, 2, 18),
      schedule: null,
    );
    expect(r.type, CredentialType.normal);
    expect(r.cyclicConfig, isEmpty);
    expect(r.cycleList, isNull);
  });

  test('TTLockFunction has cyclicCardOrFingerprint', () {
    expect(
      TTLockFunction.values.contains(TTLockFunction.cyclicCardOrFingerprint),
      isTrue,
    );
  });
}
