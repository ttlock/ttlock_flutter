import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/provider/hotel_lock_list_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';

class _MockLockDomain extends Mock implements LockDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeLockDomain extends LockDomain {
  _FakeLockDomain(this._mock);
  final _MockLockDomain _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, PageState<HotelLockEntity>> listHotelLocks({
    int pageNo = 1,
    int pageSize = 20,
    int? type,
    String? lockAlias,
    int? groupId,
  }) => _mock.listHotelLocks(
    pageNo: pageNo,
    pageSize: pageSize,
    type: type,
    lockAlias: lockAlias,
    groupId: groupId,
  );
}

PageState<HotelLockEntity> page(
  List<int> ids, {
  int pageNo = 1,
  int total = 0,
}) => PageState(
  data: ids.map((id) => HotelLockEntity(lockId: id)).toList(),
  currentPage: pageNo,
  total: total == 0 ? ids.length : total,
);

void main() {
  late _MockLockDomain lockDomain;
  late ProviderContainer container;

  ProviderContainer makeContainer() => ProviderContainer(
    overrides: [
      lockDomainProvider.overrideWith(() => _FakeLockDomain(lockDomain)),
    ],
  );

  setUp(() {
    lockDomain = _MockLockDomain();
    container = makeContainer();
    addTearDown(container.dispose);
  });

  test('build 拉第 1 页，type 默认 1', () async {
    when(
      () => lockDomain.listHotelLocks(
        pageNo: any(named: 'pageNo'),
        pageSize: any(named: 'pageSize'),
        type: any(named: 'type'),
        lockAlias: any(named: 'lockAlias'),
        groupId: any(named: 'groupId'),
      ),
    ).thenAnswer((_) => TaskEither.right(page([1, 2])));

    final state = await container.read(hotelLockListNotifierProvider.future);

    expect(state.type, 1);
    expect(state.pageState.data.length, 2);
    verify(
      () => lockDomain.listHotelLocks(
        pageNo: 1,
        pageSize: 20,
        type: 1,
        lockAlias: null,
        groupId: null,
      ),
    ).called(1);
  });

  test('loadMore 追加下一页并推进 currentPage', () async {
    when(
      () => lockDomain.listHotelLocks(
        pageNo: any(named: 'pageNo'),
        pageSize: any(named: 'pageSize'),
        type: any(named: 'type'),
        lockAlias: any(named: 'lockAlias'),
        groupId: any(named: 'groupId'),
      ),
    ).thenAnswer((inv) {
      final no = inv.namedArguments[#pageNo] as int;
      return TaskEither.right(
        page(no == 1 ? [1, 2] : [3], pageNo: no, total: 3),
      );
    });

    await container.read(hotelLockListNotifierProvider.future);
    await container.read(hotelLockListNotifierProvider.notifier).loadMore();

    final state = container.read(hotelLockListNotifierProvider).value!;
    expect(state.pageState.data.length, 3);
    expect(state.pageState.currentPage, 2);
  });

  test('loadMore 在无更多数据时不发请求', () async {
    when(
      () => lockDomain.listHotelLocks(
        pageNo: any(named: 'pageNo'),
        pageSize: any(named: 'pageSize'),
        type: any(named: 'type'),
        lockAlias: any(named: 'lockAlias'),
        groupId: any(named: 'groupId'),
      ),
    ).thenAnswer((_) => TaskEither.right(page([1], total: 1)));

    await container.read(hotelLockListNotifierProvider.future);
    await container.read(hotelLockListNotifierProvider.notifier).loadMore();

    verify(
      () => lockDomain.listHotelLocks(
        pageNo: any(named: 'pageNo'),
        pageSize: any(named: 'pageSize'),
        type: any(named: 'type'),
        lockAlias: any(named: 'lockAlias'),
        groupId: any(named: 'groupId'),
      ),
    ).called(1); // 仅 build 的那次
  });

  test('setType 重置到第 1 页并带新 type 重查', () async {
    when(
      () => lockDomain.listHotelLocks(
        pageNo: any(named: 'pageNo'),
        pageSize: any(named: 'pageSize'),
        type: any(named: 'type'),
        lockAlias: any(named: 'lockAlias'),
        groupId: any(named: 'groupId'),
      ),
    ).thenAnswer((_) => TaskEither.right(page([1])));

    await container.read(hotelLockListNotifierProvider.future);
    await container.read(hotelLockListNotifierProvider.notifier).setType(2);

    final state = container.read(hotelLockListNotifierProvider).value!;
    expect(state.type, 2);
    verify(
      () => lockDomain.listHotelLocks(
        pageNo: 1,
        pageSize: 20,
        type: 2,
        lockAlias: null,
        groupId: null,
      ),
    ).called(1);
  });

  test('setAlias 重置到第 1 页并带别名重查', () async {
    when(
      () => lockDomain.listHotelLocks(
        pageNo: any(named: 'pageNo'),
        pageSize: any(named: 'pageSize'),
        type: any(named: 'type'),
        lockAlias: any(named: 'lockAlias'),
        groupId: any(named: 'groupId'),
      ),
    ).thenAnswer((_) => TaskEither.right(page([1])));

    await container.read(hotelLockListNotifierProvider.future);
    await container
        .read(hotelLockListNotifierProvider.notifier)
        .setAlias('101');

    final state = container.read(hotelLockListNotifierProvider).value!;
    expect(state.lockAlias, '101');
    verify(
      () => lockDomain.listHotelLocks(
        pageNo: 1,
        pageSize: 20,
        type: 1,
        lockAlias: '101',
        groupId: null,
      ),
    ).called(1);
  });

  test('build 失败后 refresh 能真正恢复（错误态不再堵死重试）', () async {
    var failing = true;
    when(
      () => lockDomain.listHotelLocks(
        pageNo: any(named: 'pageNo'),
        pageSize: any(named: 'pageSize'),
        type: any(named: 'type'),
        lockAlias: any(named: 'lockAlias'),
        groupId: any(named: 'groupId'),
      ),
    ).thenAnswer(
      (_) => failing
          ? TaskEither.left(AppException.business(code: 500, message: 'boom'))
          : TaskEither.right(page([1, 2])),
    );

    container.listen(hotelLockListNotifierProvider, (_, _) {});
    container.read(hotelLockListNotifierProvider);
    for (var i = 0; i < 5; i++) {
      await Future<void>.delayed(Duration.zero);
    }
    expect(container.read(hotelLockListNotifierProvider).hasError, isTrue);

    failing = false;
    await container.read(hotelLockListNotifierProvider.notifier).refresh();

    final st = container.read(hotelLockListNotifierProvider);
    expect(st.hasError, isFalse);
    expect(st.value!.pageState.data.length, 2);
  });

  test('错误态下 setType 仍发请求并恢复', () async {
    when(
      () => lockDomain.listHotelLocks(
        pageNo: any(named: 'pageNo'),
        pageSize: any(named: 'pageSize'),
        type: any(named: 'type'),
        lockAlias: any(named: 'lockAlias'),
        groupId: any(named: 'groupId'),
      ),
    ).thenAnswer((inv) {
      final type = inv.namedArguments[#type] as int?;
      return type == 2
          ? TaskEither.right(page([3], total: 1))
          : TaskEither.left(AppException.business(code: 500, message: 'boom'));
    });

    container.listen(hotelLockListNotifierProvider, (_, _) {});
    container.read(hotelLockListNotifierProvider);
    for (var i = 0; i < 5; i++) {
      await Future<void>.delayed(Duration.zero);
    }
    expect(container.read(hotelLockListNotifierProvider).hasError, isTrue);

    await container.read(hotelLockListNotifierProvider.notifier).setType(2);

    final st = container.read(hotelLockListNotifierProvider);
    expect(st.hasError, isFalse);
    expect(st.value!.type, 2);
    expect(st.value!.pageState.data.single.lockId, 3);
  });

  test('错误态下 selectedType / searchAlias 仍反映当前查询参数', () async {
    when(
      () => lockDomain.listHotelLocks(
        pageNo: any(named: 'pageNo'),
        pageSize: any(named: 'pageSize'),
        type: any(named: 'type'),
        lockAlias: any(named: 'lockAlias'),
        groupId: any(named: 'groupId'),
      ),
    ).thenAnswer(
      (_) => TaskEither.left(AppException.business(code: 500, message: 'boom')),
    );

    container.listen(hotelLockListNotifierProvider, (_, _) {});
    container.read(hotelLockListNotifierProvider);
    for (var i = 0; i < 5; i++) {
      await Future<void>.delayed(Duration.zero);
    }
    expect(container.read(hotelLockListNotifierProvider).hasError, isTrue);

    final notifier = container.read(hotelLockListNotifierProvider.notifier);
    await notifier.setType(2);
    await notifier.setAlias('大门');

    // 页面下拉框 / 搜索框据此还原选中值：错误态下 `state.value` 为 null，
    // 若从 state 读就会退回默认值，用户再选同一个值又被 `setType` 早退成 no-op。
    expect(notifier.selectedType, 2);
    expect(notifier.searchAlias, '大门');
  });

  test('列表失败进 error 态', () async {
    when(
      () => lockDomain.listHotelLocks(
        pageNo: any(named: 'pageNo'),
        pageSize: any(named: 'pageSize'),
        type: any(named: 'type'),
        lockAlias: any(named: 'lockAlias'),
        groupId: any(named: 'groupId'),
      ),
    ).thenAnswer(
      (_) => TaskEither.left(AppException.business(code: 500, message: 'boom')),
    );

    // 不用 `.future` + `throwsA`：本版 Riverpod 会自动重试，future 挂起。
    // 需先 subscribe 保持 autoDispose provider 存活，否则错误态会被回收掉。
    container.listen(hotelLockListNotifierProvider, (_, _) {});
    container.read(hotelLockListNotifierProvider);
    for (var i = 0; i < 5; i++) {
      await Future<void>.delayed(Duration.zero);
    }

    final st = container.read(hotelLockListNotifierProvider);
    expect(st.hasError, isTrue);
    expect(st.error, isA<AppException>());
  });

  test('setType 失败进 error 态，且不抛给调用方', () async {
    when(
      () => lockDomain.listHotelLocks(
        pageNo: any(named: 'pageNo'),
        pageSize: any(named: 'pageSize'),
        type: any(named: 'type'),
        lockAlias: any(named: 'lockAlias'),
        groupId: any(named: 'groupId'),
      ),
    ).thenAnswer((inv) {
      final type = inv.namedArguments[#type] as int?;
      return type == 2
          ? TaskEither.left(AppException.business(code: 500, message: 'boom'))
          : TaskEither.right(page([1]));
    });

    await container.read(hotelLockListNotifierProvider.future);
    // 用 guard 包住 → 这里不该抛；抛出去就是未被页面接住的未捕获异常。
    await container.read(hotelLockListNotifierProvider.notifier).setType(2);

    expect(container.read(hotelLockListNotifierProvider).hasError, isTrue);
  });

  test('refresh 失败进 error 态，且不抛给调用方', () async {
    when(
      () => lockDomain.listHotelLocks(
        pageNo: any(named: 'pageNo'),
        pageSize: any(named: 'pageSize'),
        type: any(named: 'type'),
        lockAlias: any(named: 'lockAlias'),
        groupId: any(named: 'groupId'),
      ),
    ).thenAnswer((inv) {
      final no = inv.namedArguments[#pageNo] as int;
      return no == 1
          ? TaskEither.right(page([1]))
          : TaskEither.left(AppException.business(code: 500, message: 'boom'));
    });

    await container.read(hotelLockListNotifierProvider.future);
    when(
      () => lockDomain.listHotelLocks(
        pageNo: any(named: 'pageNo'),
        pageSize: any(named: 'pageSize'),
        type: any(named: 'type'),
        lockAlias: any(named: 'lockAlias'),
        groupId: any(named: 'groupId'),
      ),
    ).thenAnswer(
      (_) => TaskEither.left(AppException.business(code: 500, message: 'boom')),
    );

    await container.read(hotelLockListNotifierProvider.notifier).refresh();

    expect(container.read(hotelLockListNotifierProvider).hasError, isTrue);
  });
}
