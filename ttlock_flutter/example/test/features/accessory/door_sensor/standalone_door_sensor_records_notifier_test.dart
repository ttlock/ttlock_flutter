import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/provider/standalone_door_sensor_domain.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/mapper/standalone_door_sensor_record_type_label.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/provider/standalone_door_sensor_records_notifier.dart';

typedef _Call = ({int doorSensorId, int pageNo, int pageSize});

class _FakeDomain extends StandaloneDoorSensorDomain {
  _FakeDomain(this._onList);
  final TaskEither<AppException, List<StandaloneDoorSensorRecordEntity>>
  Function(_Call)
  _onList;

  @override
  void build() {}

  @override
  TaskEither<AppException, List<StandaloneDoorSensorRecordEntity>> listRecord(
    int doorSensorId, {
    int pageNo = 1,
    int pageSize = 20,
  }) =>
      _onList((doorSensorId: doorSensorId, pageNo: pageNo, pageSize: pageSize));
}

StandaloneDoorSensorRecordEntity rec(int i) =>
    StandaloneDoorSensorRecordEntity(recordType: i % 4);

void main() {
  late List<_Call> calls;
  late ProviderContainer container;

  ProviderContainer make(
    TaskEither<AppException, List<StandaloneDoorSensorRecordEntity>> Function(
      _Call,
    )
    onList,
  ) {
    calls = [];
    final c = ProviderContainer(
      overrides: [
        standaloneDoorSensorDomainProvider.overrideWith(
          () => _FakeDomain((call) {
            calls.add(call);
            return onList(call);
          }),
        ),
      ],
    );
    addTearDown(c.dispose);
    container = c;
    c.listen(standaloneDoorSensorRecordsProvider(3), (_, _) {});
    return c;
  }

  group('standaloneDoorSensorRecordTypeLabel', () {
    final l10n = lookupAppLocalizations(const Locale('zh'));

    test('0–3 映射既有文案，未知值回落原串', () {
      expect(
        standaloneDoorSensorRecordTypeLabel(l10n, 0),
        l10n.standaloneDoorClosed,
      );
      expect(
        standaloneDoorSensorRecordTypeLabel(l10n, 1),
        l10n.standaloneDoorOpen,
      );
      expect(
        standaloneDoorSensorRecordTypeLabel(l10n, 2),
        l10n.standaloneDoorNotCloseAlert,
      );
      expect(
        standaloneDoorSensorRecordTypeLabel(l10n, 3),
        l10n.standaloneDoorLongTimeNotOpenAlert,
      );
      expect(standaloneDoorSensorRecordTypeLabel(l10n, 99), '99');
    });
  });

  test('满页 20 条 ⇒ hasMore true', () async {
    make((_) => TaskEither.right(List.generate(20, rec)));
    final state = await container.read(
      standaloneDoorSensorRecordsProvider(3).future,
    );
    expect(state.pageState.data, hasLength(20));
    expect(state.pageState.hasMore, isTrue);
    expect(state.pageState.total, 21);
    expect(calls.single.pageNo, 1);
    expect(calls.single.doorSensorId, 3);
    expect(calls.single.pageSize, 20);
  });

  test('首屏 3 条 ⇒ hasMore false', () async {
    make((_) => TaskEither.right(List.generate(3, rec)));
    final state = await container.read(
      standaloneDoorSensorRecordsProvider(3).future,
    );
    expect(state.pageState.data, hasLength(3));
    expect(state.pageState.hasMore, isFalse);
    expect(state.pageState.total, 3);
  });

  test('满页后再空页 ⇒ hasMore false（整数倍边界）', () async {
    make((call) {
      if (call.pageNo == 1) {
        return TaskEither.right(List.generate(20, rec));
      }
      return TaskEither.right(const []);
    });
    final n = container.read(standaloneDoorSensorRecordsProvider(3).notifier);
    await container.read(standaloneDoorSensorRecordsProvider(3).future);
    expect(
      container
          .read(standaloneDoorSensorRecordsProvider(3))
          .value!
          .pageState
          .hasMore,
      isTrue,
    );
    await n.loadMore();
    final page = container
        .read(standaloneDoorSensorRecordsProvider(3))
        .value!
        .pageState;
    expect(page.data, hasLength(20));
    expect(page.hasMore, isFalse);
    expect(page.currentPage, 2);
    expect(page.total, 20);
    expect(calls.map((c) => c.pageNo).toList(), [1, 2]);
  });

  test('loadMore 追加第 2 页短页', () async {
    make((call) {
      if (call.pageNo == 1) {
        return TaskEither.right(List.generate(20, rec));
      }
      return TaskEither.right(List.generate(5, (i) => rec(i + 20)));
    });
    final n = container.read(standaloneDoorSensorRecordsProvider(3).notifier);
    await container.read(standaloneDoorSensorRecordsProvider(3).future);
    await n.loadMore();
    final page = container
        .read(standaloneDoorSensorRecordsProvider(3))
        .value!
        .pageState;
    expect(page.data, hasLength(25));
    expect(page.hasMore, isFalse);
    expect(page.currentPage, 2);
  });

  test('失败 → AsyncError', () async {
    make((_) => TaskEither.left(AppException.unknown(message: 'boom')));
    container.read(standaloneDoorSensorRecordsProvider(3));
    for (var i = 0; i < 5; i++) {
      await Future<void>.delayed(Duration.zero);
    }
    expect(
      container.read(standaloneDoorSensorRecordsProvider(3)).hasError,
      isTrue,
    );
  });
}
