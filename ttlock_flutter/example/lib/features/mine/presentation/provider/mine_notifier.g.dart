// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mine_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MineNotifier)
const mineProvider = MineNotifierProvider._();

final class MineNotifierProvider
    extends $NotifierProvider<MineNotifier, MineState> {
  const MineNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mineProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mineNotifierHash();

  @$internal
  @override
  MineNotifier create() => MineNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MineState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MineState>(value),
    );
  }
}

String _$mineNotifierHash() => r'f94f2d2b55d4188f7e00d35cbc229d2b77a496c9';

abstract class _$MineNotifier extends $Notifier<MineState> {
  MineState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MineState, MineState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MineState, MineState>,
              MineState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
