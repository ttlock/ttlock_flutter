// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lift_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LiftRepository)
const liftRepositoryProvider = LiftRepositoryProvider._();

final class LiftRepositoryProvider
    extends $NotifierProvider<LiftRepository, void> {
  const LiftRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'liftRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$liftRepositoryHash();

  @$internal
  @override
  LiftRepository create() => LiftRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$liftRepositoryHash() => r'3d2afc473e312691467bf72728547564f79fc6ce';

abstract class _$LiftRepository extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
