// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FaceRepository)
const faceRepositoryProvider = FaceRepositoryProvider._();

final class FaceRepositoryProvider
    extends $NotifierProvider<FaceRepository, void> {
  const FaceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'faceRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$faceRepositoryHash();

  @$internal
  @override
  FaceRepository create() => FaceRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$faceRepositoryHash() => r'57c377cbebc2af3fc14255dc4ffbcfc0548c0ef8';

abstract class _$FaceRepository extends $Notifier<void> {
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
