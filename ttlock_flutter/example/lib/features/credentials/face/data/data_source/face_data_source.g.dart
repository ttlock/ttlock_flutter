// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(faceApi)
const faceApiProvider = FaceApiProvider._();

final class FaceApiProvider
    extends $FunctionalProvider<FaceApi, FaceApi, FaceApi>
    with $Provider<FaceApi> {
  const FaceApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'faceApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$faceApiHash();

  @$internal
  @override
  $ProviderElement<FaceApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FaceApi create(Ref ref) {
    return faceApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FaceApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FaceApi>(value),
    );
  }
}

String _$faceApiHash() => r'629304a7bec475fd27666d79fd4a940617f46b61';

@ProviderFor(FaceDataSource)
const faceDataSourceProvider = FaceDataSourceProvider._();

final class FaceDataSourceProvider
    extends $NotifierProvider<FaceDataSource, void> {
  const FaceDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'faceDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$faceDataSourceHash();

  @$internal
  @override
  FaceDataSource create() => FaceDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$faceDataSourceHash() => r'8dcc5ad069dce2f1ce78a4f4e6acae32d014ff02';

abstract class _$FaceDataSource extends $Notifier<void> {
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
