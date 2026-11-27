// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_records_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LockRecordsNotifier)
const lockRecordsProvider = LockRecordsNotifierFamily._();

final class LockRecordsNotifierProvider
    extends $AsyncNotifierProvider<LockRecordsNotifier, LockRecordsState> {
  const LockRecordsNotifierProvider._({
    required LockRecordsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'lockRecordsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$lockRecordsNotifierHash();

  @override
  String toString() {
    return r'lockRecordsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  LockRecordsNotifier create() => LockRecordsNotifier();

  @override
  bool operator ==(Object other) {
    return other is LockRecordsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$lockRecordsNotifierHash() =>
    r'0f49fcfb18bbc3f29d5baf197ac10ba3955e7424';

final class LockRecordsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          LockRecordsNotifier,
          AsyncValue<LockRecordsState>,
          LockRecordsState,
          FutureOr<LockRecordsState>,
          int
        > {
  const LockRecordsNotifierFamily._()
    : super(
        retry: null,
        name: r'lockRecordsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LockRecordsNotifierProvider call(int lockId) =>
      LockRecordsNotifierProvider._(argument: lockId, from: this);

  @override
  String toString() => r'lockRecordsProvider';
}

abstract class _$LockRecordsNotifier extends $AsyncNotifier<LockRecordsState> {
  late final _$args = ref.$arg as int;
  int get lockId => _$args;

  FutureOr<LockRecordsState> build(int lockId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<LockRecordsState>, LockRecordsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LockRecordsState>, LockRecordsState>,
              AsyncValue<LockRecordsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// 同步离线记录的一次性错误通道（UI listen 后 SnackBar 呈现并 clear）。

@ProviderFor(LockRecordsError)
const lockRecordsErrorProvider = LockRecordsErrorProvider._();

/// 同步离线记录的一次性错误通道（UI listen 后 SnackBar 呈现并 clear）。
final class LockRecordsErrorProvider
    extends $NotifierProvider<LockRecordsError, AppException?> {
  /// 同步离线记录的一次性错误通道（UI listen 后 SnackBar 呈现并 clear）。
  const LockRecordsErrorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lockRecordsErrorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lockRecordsErrorHash();

  @$internal
  @override
  LockRecordsError create() => LockRecordsError();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppException? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppException?>(value),
    );
  }
}

String _$lockRecordsErrorHash() => r'338fc3d70ca9552903272caa1ae80e534ca568ef';

/// 同步离线记录的一次性错误通道（UI listen 后 SnackBar 呈现并 clear）。

abstract class _$LockRecordsError extends $Notifier<AppException?> {
  AppException? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AppException?, AppException?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppException?, AppException?>,
              AppException?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
