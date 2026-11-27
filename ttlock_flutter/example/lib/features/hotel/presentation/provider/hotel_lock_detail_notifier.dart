import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/hotel/domain/provider/card_encoder_domain.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/provider/hotel_lock_detail_state.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/provider/hotel_lock_list_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/hotel_sector.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';

part 'hotel_lock_detail_notifier.g.dart';

/// 酒店锁详情页编排。
///
/// `name` 显式固定为 `hotelLockDetailNotifierProvider`：生成器默认剥掉类名的
/// `Notifier` 后缀产出 `hotelLockDetailProvider`，与页面/测试约定的名字不符。
@Riverpod(name: 'hotelLockDetailNotifierProvider')
class HotelLockDetailNotifier extends _$HotelLockDetailNotifier {
  late final LockDomain _lockDomain;
  late final CardEncoderDomain _encoder;

  @override
  HotelLockDetailState build(HotelLockDetailArgs args) {
    _lockDomain = ref.read(lockDomainProvider.notifier);
    _encoder = ref.read(cardEncoderDomainProvider.notifier);
    return HotelLockDetailState(lock: args.lock);
  }

  HotelLockDetailArgs get _args => args;

  void clearError() => state = state.copyWith(error: null);

  /// 设置卡扇区：BLE 必先、云端确认。
  ///
  /// 两条失败路径靠错误码区分：
  /// - **BLE 失败** → 透传错误，按普通失败展示（锁未改动）
  /// - **云端失败**（[kHotelSectorCloudPendingCode]）→ 置 `cloudPending` +
  ///   `pendingSector`，**不置 `error`**：此时锁的扇区其实**已改**，
  ///   文案必须区别于「设置失败」。
  Future<void> applySector(String sector) async {
    state = state.copyWith(
      submitting: true,
      error: null,
      cloudPending: false,
      pendingSector: null,
    );
    final lock = _args.lock;
    final r = await _lockDomain
        .applyHotelCardSector(
          lockId: lock.lockId,
          lockData: lock.lockData,
          sector: sector,
        )
        .run();
    state = r.fold((err) {
      // 用 `if (err is ...)` 让流分析把 err 提升为 AppBusinessException，
      // 才能读 `err.data`（`data` 只在该分支上）。
      if (err is AppBusinessException &&
          err.code == kHotelSectorCloudPendingCode) {
        // BLE 已改扇区，详情展示必须跟上；仅云端未同步。
        return state.copyWith(
          submitting: false,
          cloudPending: true,
          pendingSector: err.data as String?,
          lock: state.lock?.copyWith(sector: sector),
        );
      }
      return state.copyWith(submitting: false, error: err);
    }, (_) {
      ref.invalidate(hotelLockListNotifierProvider);
      return state.copyWith(
        submitting: false,
        lock: state.lock?.copyWith(sector: sector),
      );
    });
  }

  /// 只重发云端那一步（BLE 已完成，不重复下发）。
  Future<void> retryCloudSync() async {
    final sector = state.pendingSector;
    if (sector == null) return;
    state = state.copyWith(submitting: true);
    final r = await _lockDomain
        .syncHotelCardSector(_args.lock.lockId, sector)
        .run();
    state = r.fold(
      // 失败时**保持 cloudPending / pendingSector 不变**：锁仍然已改、云端仍然
      // 未同步，状态没有变化。若在此清掉 cloudPending，横幅会消失、重试入口
      // 随之丢失。只置 error 说明原因。
      (err) => state.copyWith(submitting: false, error: err),
      (_) => state.copyWith(
        submitting: false,
        cloudPending: false,
        pendingSector: null,
      ),
    );
  }

  /// 写楼栋/楼层进锁（BLE 单轨）。
  ///
  /// `hotelInfo` **有 10 分钟时效**，故在提交时实时获取、**不做缓存**；
  /// 取不到即返回错误、**不写锁**（占位值写进真锁不可逆）。
  Future<void> writeBuildingFloor({
    required int buildingNumber,
    required int floorNumber,
  }) async {
    state = state.copyWith(submitting: true, error: null);
    final hotelInfo = await _fetchHotelInfo();
    if (hotelInfo == null) {
      // 取不到 hotelInfo 就**不写锁**。短路放在 notifier 内，而不是交给
      // `writeHotelInfo` 的空串校验——否则 `writeHotelInfo` 会被调用一次，
      // 测试的 `verifyNever` 不成立。
      state = state.copyWith(
        submitting: false,
        error: AppException.business(
          code: kCardEncoderUnavailableCode,
          message: 'card_encoder_unavailable',
        ),
      );
      return;
    }
    final r = await _lockDomain
        .writeHotelInfo(
          lockData: _args.lock.lockData,
          hotelInfo: hotelInfo,
          buildingNumber: buildingNumber,
          floorNumber: floorNumber,
        )
        .run();
    state = r.fold(
      (err) => state.copyWith(submitting: false, error: err),
      (_) {
        ref.invalidate(hotelLockListNotifierProvider);
        return state.copyWith(
          submitting: false,
          lock: state.lock?.copyWith(
            buildingNumber: buildingNumber,
            floorNumber: floorNumber,
          ),
        );
      },
    );
  }

  /// 提交时实时取 hotelInfo；失败返回 `null`，由调用方短路返回错误、**不写锁**。
  Future<String?> _fetchHotelInfo() async {
    final r = await _encoder.getHotelInfo().run();
    return r.fold((_) => null, (info) => info);
  }

  /// ICKey 供 PC 发卡器对接展示；失败只影响该区块。
  Future<void> loadIcKey() async {
    if (state.icKeyLoading) return;
    state = state.copyWith(icKeyLoading: true, icKeyError: null);
    final r = await _encoder.getIcKey().run();
    state = r.fold(
      (err) => state.copyWith(icKeyLoading: false, icKeyError: err),
      (key) => state.copyWith(icKeyLoading: false, icKey: key),
    );
  }
}
