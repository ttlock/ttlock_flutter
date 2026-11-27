import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/provider/electric_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/provider/electric_meter_detail_state.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/provider/electric_meter_list_notifier.dart';

part 'electric_meter_detail_notifier.g.dart';

/// 详情 Notifier：按 id 直取详情接口，读写同一个 Notifier。
///
/// **不复用列表的 entity** —— 每次进入都重新请求 `detail`（列表数据可能是
/// 过时快照，且两处字段集并不相同）。provider 是 autoDispose，离开页面即回收，
/// 再次进入必然重跑 [build]。
@Riverpod()
class ElectricMeterDetailNotifier extends _$ElectricMeterDetailNotifier {
  ElectricMeterDomain get _domain =>
      ref.read(electricMeterDomainProvider.notifier);

  // 不能用 `late final` —— invalidateSelf 会重跑 build，再次赋值会抛
  // LateInitializationError。
  late int _meterId;

  @override
  Future<ElectricMeterDetailState> build(int meterId) async {
    _meterId = meterId;
    return _load();
  }

  Future<ElectricMeterDetailState> _load() async {
    final r = await _domain.detail(_meterId).run();
    final item = r.fold((err) => throw err, (v) => v);
    return ElectricMeterDetailState(item: item);
  }

  void clearError() {
    final current = state.value;
    if (current != null) {
      state = AsyncValue.data(current.copyWith(error: null));
    }
  }

  /// 通断电。
  Future<bool> controlOnOff({required bool on}) =>
      _write(() => _domain.setPowerOnOff(state.value!.item, on: on));

  /// 充值（入口仅预付费模式展示）。
  Future<bool> recharge({required double amount, required double kwh}) => _write(
    () => _domain.rechargeMeter(
      state.value!.item,
      amount: amount,
      kwh: kwh,
    ),
  );

  Future<bool> rename(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return Future.value(false);
    return _write(() => _domain.rename(_meterId, trimmed));
  }

  /// 删除：纯 BLE（SDK 删除后自行通知服务器），不调云端。
  Future<bool> delete() =>
      _write(() => _domain.delete(meter: state.value!.item));

  /// 写操作统一收口：置 operating → 执行 → 成功刷新双端 / 失败留 error。
  Future<bool> _write(
    TaskEither<AppException, Unit> Function() action,
  ) async {
    final current = state.value;
    if (current == null) return false;
    state = AsyncValue.data(current.copyWith(operating: true, error: null));
    final r = await action().runWithLoading(
      status: ref.read(l10nProvider).loading,
    );
    return r.fold(
      (err) {
        final latest = state.value;
        if (latest != null) {
          state = AsyncValue.data(
            latest.copyWith(operating: false, error: err),
          );
        }
        return false;
      },
      (_) {
        _refresh();
        return true;
      },
    );
  }

  /// 写操作成功后同时刷新列表与详情（spec §6.1）。
  void _refresh() {
    ref.invalidate(electricMeterListProvider);
    ref.invalidateSelf();
  }
}
