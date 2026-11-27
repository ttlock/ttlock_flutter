// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 详情 Notifier：family 第二参为路由 `$extra`（当前 lock Entity 或 null）。
/// cloud detail 不返回 lockData/groupName（lock/detail.md），以 $extra 注入为准，
/// 云端 detail 只刷新其余可变字段；不做事后 `lockData.isEmpty` 补救判断。

@ProviderFor(LockDetailNotifier)
const lockDetailProvider = LockDetailNotifierFamily._();

/// 详情 Notifier：family 第二参为路由 `$extra`（当前 lock Entity 或 null）。
/// cloud detail 不返回 lockData/groupName（lock/detail.md），以 $extra 注入为准，
/// 云端 detail 只刷新其余可变字段；不做事后 `lockData.isEmpty` 补救判断。
final class LockDetailNotifierProvider
    extends $AsyncNotifierProvider<LockDetailNotifier, LockDetailState> {
  /// 详情 Notifier：family 第二参为路由 `$extra`（当前 lock Entity 或 null）。
  /// cloud detail 不返回 lockData/groupName（lock/detail.md），以 $extra 注入为准，
  /// 云端 detail 只刷新其余可变字段；不做事后 `lockData.isEmpty` 补救判断。
  const LockDetailNotifierProvider._({
    required LockDetailNotifierFamily super.from,
    required (int, LockEntity?) super.argument,
  }) : super(
         retry: null,
         name: r'lockDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$lockDetailNotifierHash();

  @override
  String toString() {
    return r'lockDetailProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  LockDetailNotifier create() => LockDetailNotifier();

  @override
  bool operator ==(Object other) {
    return other is LockDetailNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$lockDetailNotifierHash() =>
    r'a64bdda58be124b863bb8422c25a969f70699b7e';

/// 详情 Notifier：family 第二参为路由 `$extra`（当前 lock Entity 或 null）。
/// cloud detail 不返回 lockData/groupName（lock/detail.md），以 $extra 注入为准，
/// 云端 detail 只刷新其余可变字段；不做事后 `lockData.isEmpty` 补救判断。

final class LockDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          LockDetailNotifier,
          AsyncValue<LockDetailState>,
          LockDetailState,
          FutureOr<LockDetailState>,
          (int, LockEntity?)
        > {
  const LockDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'lockDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 详情 Notifier：family 第二参为路由 `$extra`（当前 lock Entity 或 null）。
  /// cloud detail 不返回 lockData/groupName（lock/detail.md），以 $extra 注入为准，
  /// 云端 detail 只刷新其余可变字段；不做事后 `lockData.isEmpty` 补救判断。

  LockDetailNotifierProvider call(int lockId, LockEntity? extra) =>
      LockDetailNotifierProvider._(argument: (lockId, extra), from: this);

  @override
  String toString() => r'lockDetailProvider';
}

/// 详情 Notifier：family 第二参为路由 `$extra`（当前 lock Entity 或 null）。
/// cloud detail 不返回 lockData/groupName（lock/detail.md），以 $extra 注入为准，
/// 云端 detail 只刷新其余可变字段；不做事后 `lockData.isEmpty` 补救判断。

abstract class _$LockDetailNotifier extends $AsyncNotifier<LockDetailState> {
  late final _$args = ref.$arg as (int, LockEntity?);
  int get lockId => _$args.$1;
  LockEntity? get extra => _$args.$2;

  FutureOr<LockDetailState> build(int lockId, LockEntity? extra);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args.$1, _$args.$2);
    final ref = this.ref as $Ref<AsyncValue<LockDetailState>, LockDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LockDetailState>, LockDetailState>,
              AsyncValue<LockDetailState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
