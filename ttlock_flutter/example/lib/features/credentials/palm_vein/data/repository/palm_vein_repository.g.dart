// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palm_vein_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PalmVeinRepository)
const palmVeinRepositoryProvider = PalmVeinRepositoryProvider._();

final class PalmVeinRepositoryProvider
    extends $NotifierProvider<PalmVeinRepository, void> {
  const PalmVeinRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'palmVeinRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$palmVeinRepositoryHash();

  @$internal
  @override
  PalmVeinRepository create() => PalmVeinRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$palmVeinRepositoryHash() =>
    r'a2a380e6b473b40ab77b3373ea559daa850bbd6c';

abstract class _$PalmVeinRepository extends $Notifier<void> {
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
