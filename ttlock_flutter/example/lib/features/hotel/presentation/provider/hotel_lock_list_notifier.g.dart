// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_lock_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 列表页 provider。
///
/// `name` 显式固定为 `hotelLockListNotifierProvider`：生成器默认会把类名的
/// `Notifier` 后缀剥掉产出 `hotelLockListProvider`，与跨任务约定的名字不符
/// （Task 4 列表页按 `hotelLockListNotifierProvider` 消费）。

@ProviderFor(HotelLockListNotifier)
const hotelLockListNotifierProvider = HotelLockListNotifierProvider._();

/// 列表页 provider。
///
/// `name` 显式固定为 `hotelLockListNotifierProvider`：生成器默认会把类名的
/// `Notifier` 后缀剥掉产出 `hotelLockListProvider`，与跨任务约定的名字不符
/// （Task 4 列表页按 `hotelLockListNotifierProvider` 消费）。
final class HotelLockListNotifierProvider
    extends $AsyncNotifierProvider<HotelLockListNotifier, HotelLockListState> {
  /// 列表页 provider。
  ///
  /// `name` 显式固定为 `hotelLockListNotifierProvider`：生成器默认会把类名的
  /// `Notifier` 后缀剥掉产出 `hotelLockListProvider`，与跨任务约定的名字不符
  /// （Task 4 列表页按 `hotelLockListNotifierProvider` 消费）。
  const HotelLockListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hotelLockListNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hotelLockListNotifierHash();

  @$internal
  @override
  HotelLockListNotifier create() => HotelLockListNotifier();
}

String _$hotelLockListNotifierHash() =>
    r'5ec00c2d868b62785a195809f0a2a9e3c16ac091';

/// 列表页 provider。
///
/// `name` 显式固定为 `hotelLockListNotifierProvider`：生成器默认会把类名的
/// `Notifier` 后缀剥掉产出 `hotelLockListProvider`，与跨任务约定的名字不符
/// （Task 4 列表页按 `hotelLockListNotifierProvider` 消费）。

abstract class _$HotelLockListNotifier
    extends $AsyncNotifier<HotelLockListState> {
  FutureOr<HotelLockListState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<HotelLockListState>, HotelLockListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<HotelLockListState>, HotelLockListState>,
              AsyncValue<HotelLockListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
