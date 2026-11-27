// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fingerprint_add_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FingerprintAddNotifier)
const fingerprintAddProvider = FingerprintAddNotifierFamily._();

final class FingerprintAddNotifierProvider
    extends $NotifierProvider<FingerprintAddNotifier, FingerprintAddState> {
  const FingerprintAddNotifierProvider._({
    required FingerprintAddNotifierFamily super.from,
    required FingerprintAddArgs super.argument,
  }) : super(
         retry: null,
         name: r'fingerprintAddProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fingerprintAddNotifierHash();

  @override
  String toString() {
    return r'fingerprintAddProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FingerprintAddNotifier create() => FingerprintAddNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FingerprintAddState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FingerprintAddState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FingerprintAddNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fingerprintAddNotifierHash() =>
    r'8092a141d9f2e15084ba6bb95500b6eeff950b22';

final class FingerprintAddNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          FingerprintAddNotifier,
          FingerprintAddState,
          FingerprintAddState,
          FingerprintAddState,
          FingerprintAddArgs
        > {
  const FingerprintAddNotifierFamily._()
    : super(
        retry: null,
        name: r'fingerprintAddProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FingerprintAddNotifierProvider call(FingerprintAddArgs args) =>
      FingerprintAddNotifierProvider._(argument: args, from: this);

  @override
  String toString() => r'fingerprintAddProvider';
}

abstract class _$FingerprintAddNotifier extends $Notifier<FingerprintAddState> {
  late final _$args = ref.$arg as FingerprintAddArgs;
  FingerprintAddArgs get args => _$args;

  FingerprintAddState build(FingerprintAddArgs args);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<FingerprintAddState, FingerprintAddState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FingerprintAddState, FingerprintAddState>,
              FingerprintAddState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
