// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_lock_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 酒店锁详情页编排。
///
/// `name` 显式固定为 `hotelLockDetailNotifierProvider`：生成器默认剥掉类名的
/// `Notifier` 后缀产出 `hotelLockDetailProvider`，与页面/测试约定的名字不符。

@ProviderFor(HotelLockDetailNotifier)
const hotelLockDetailNotifierProvider = HotelLockDetailNotifierFamily._();

/// 酒店锁详情页编排。
///
/// `name` 显式固定为 `hotelLockDetailNotifierProvider`：生成器默认剥掉类名的
/// `Notifier` 后缀产出 `hotelLockDetailProvider`，与页面/测试约定的名字不符。
final class HotelLockDetailNotifierProvider
    extends $NotifierProvider<HotelLockDetailNotifier, HotelLockDetailState> {
  /// 酒店锁详情页编排。
  ///
  /// `name` 显式固定为 `hotelLockDetailNotifierProvider`：生成器默认剥掉类名的
  /// `Notifier` 后缀产出 `hotelLockDetailProvider`，与页面/测试约定的名字不符。
  const HotelLockDetailNotifierProvider._({
    required HotelLockDetailNotifierFamily super.from,
    required HotelLockDetailArgs super.argument,
  }) : super(
         retry: null,
         name: r'hotelLockDetailNotifierProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$hotelLockDetailNotifierHash();

  @override
  String toString() {
    return r'hotelLockDetailNotifierProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  HotelLockDetailNotifier create() => HotelLockDetailNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HotelLockDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HotelLockDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is HotelLockDetailNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$hotelLockDetailNotifierHash() =>
    r'26e3e9eebb9f9de5824e114c7759d325757e3f7e';

/// 酒店锁详情页编排。
///
/// `name` 显式固定为 `hotelLockDetailNotifierProvider`：生成器默认剥掉类名的
/// `Notifier` 后缀产出 `hotelLockDetailProvider`，与页面/测试约定的名字不符。

final class HotelLockDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          HotelLockDetailNotifier,
          HotelLockDetailState,
          HotelLockDetailState,
          HotelLockDetailState,
          HotelLockDetailArgs
        > {
  const HotelLockDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'hotelLockDetailNotifierProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 酒店锁详情页编排。
  ///
  /// `name` 显式固定为 `hotelLockDetailNotifierProvider`：生成器默认剥掉类名的
  /// `Notifier` 后缀产出 `hotelLockDetailProvider`，与页面/测试约定的名字不符。

  HotelLockDetailNotifierProvider call(HotelLockDetailArgs args) =>
      HotelLockDetailNotifierProvider._(argument: args, from: this);

  @override
  String toString() => r'hotelLockDetailNotifierProvider';
}

/// 酒店锁详情页编排。
///
/// `name` 显式固定为 `hotelLockDetailNotifierProvider`：生成器默认剥掉类名的
/// `Notifier` 后缀产出 `hotelLockDetailProvider`，与页面/测试约定的名字不符。

abstract class _$HotelLockDetailNotifier
    extends $Notifier<HotelLockDetailState> {
  late final _$args = ref.$arg as HotelLockDetailArgs;
  HotelLockDetailArgs get args => _$args;

  HotelLockDetailState build(HotelLockDetailArgs args);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<HotelLockDetailState, HotelLockDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HotelLockDetailState, HotelLockDetailState>,
              HotelLockDetailState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
