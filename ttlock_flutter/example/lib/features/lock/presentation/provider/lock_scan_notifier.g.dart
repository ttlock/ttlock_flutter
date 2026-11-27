// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_scan_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LockScanNotifier)
const lockScanProvider = LockScanNotifierProvider._();

final class LockScanNotifierProvider
    extends $NotifierProvider<LockScanNotifier, LockScanState> {
  const LockScanNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lockScanProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lockScanNotifierHash();

  @$internal
  @override
  LockScanNotifier create() => LockScanNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LockScanState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LockScanState>(value),
    );
  }
}

String _$lockScanNotifierHash() => r'c27791be43e6565bf6748b2fb19ac01eeb44907e';

abstract class _$LockScanNotifier extends $Notifier<LockScanState> {
  LockScanState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LockScanState, LockScanState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LockScanState, LockScanState>,
              LockScanState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
