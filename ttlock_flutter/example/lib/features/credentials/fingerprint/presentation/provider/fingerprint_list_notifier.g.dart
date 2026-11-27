// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fingerprint_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FingerprintListNotifier)
const fingerprintListProvider = FingerprintListNotifierFamily._();

final class FingerprintListNotifierProvider
    extends
        $AsyncNotifierProvider<FingerprintListNotifier, FingerprintListState> {
  const FingerprintListNotifierProvider._({
    required FingerprintListNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'fingerprintListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fingerprintListNotifierHash();

  @override
  String toString() {
    return r'fingerprintListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FingerprintListNotifier create() => FingerprintListNotifier();

  @override
  bool operator ==(Object other) {
    return other is FingerprintListNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fingerprintListNotifierHash() =>
    r'cd64be13828eea44a5fb442bb4515887d2398f69';

final class FingerprintListNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          FingerprintListNotifier,
          AsyncValue<FingerprintListState>,
          FingerprintListState,
          FutureOr<FingerprintListState>,
          int
        > {
  const FingerprintListNotifierFamily._()
    : super(
        retry: null,
        name: r'fingerprintListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FingerprintListNotifierProvider call(int lockId) =>
      FingerprintListNotifierProvider._(argument: lockId, from: this);

  @override
  String toString() => r'fingerprintListProvider';
}

abstract class _$FingerprintListNotifier
    extends $AsyncNotifier<FingerprintListState> {
  late final _$args = ref.$arg as int;
  int get lockId => _$args;

  FutureOr<FingerprintListState> build(int lockId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<AsyncValue<FingerprintListState>, FingerprintListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<FingerprintListState>,
                FingerprintListState
              >,
              AsyncValue<FingerprintListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
