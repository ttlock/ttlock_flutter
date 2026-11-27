// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fingerprint_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FingerprintDetailNotifier)
const fingerprintDetailProvider = FingerprintDetailNotifierFamily._();

final class FingerprintDetailNotifierProvider
    extends
        $NotifierProvider<FingerprintDetailNotifier, FingerprintDetailState> {
  const FingerprintDetailNotifierProvider._({
    required FingerprintDetailNotifierFamily super.from,
    required FingerprintDetailArgs super.argument,
  }) : super(
         retry: null,
         name: r'fingerprintDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fingerprintDetailNotifierHash();

  @override
  String toString() {
    return r'fingerprintDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FingerprintDetailNotifier create() => FingerprintDetailNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FingerprintDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FingerprintDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FingerprintDetailNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fingerprintDetailNotifierHash() =>
    r'c0d1d928765a4ad8c05ef03fa0f7f63318f0e98d';

final class FingerprintDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          FingerprintDetailNotifier,
          FingerprintDetailState,
          FingerprintDetailState,
          FingerprintDetailState,
          FingerprintDetailArgs
        > {
  const FingerprintDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'fingerprintDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FingerprintDetailNotifierProvider call(FingerprintDetailArgs args) =>
      FingerprintDetailNotifierProvider._(argument: args, from: this);

  @override
  String toString() => r'fingerprintDetailProvider';
}

abstract class _$FingerprintDetailNotifier
    extends $Notifier<FingerprintDetailState> {
  late final _$args = ref.$arg as FingerprintDetailArgs;
  FingerprintDetailArgs get args => _$args;

  FingerprintDetailState build(FingerprintDetailArgs args);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<FingerprintDetailState, FingerprintDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FingerprintDetailState, FingerprintDetailState>,
              FingerprintDetailState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
