// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(remoteApi)
const remoteApiProvider = RemoteApiProvider._();

final class RemoteApiProvider
    extends $FunctionalProvider<RemoteApi, RemoteApi, RemoteApi>
    with $Provider<RemoteApi> {
  const RemoteApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remoteApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$remoteApiHash();

  @$internal
  @override
  $ProviderElement<RemoteApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RemoteApi create(Ref ref) {
    return remoteApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RemoteApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RemoteApi>(value),
    );
  }
}

String _$remoteApiHash() => r'6b32088baafb30c07e82e99f779a033712f23186';

@ProviderFor(RemoteDataSource)
const remoteDataSourceProvider = RemoteDataSourceProvider._();

final class RemoteDataSourceProvider
    extends $NotifierProvider<RemoteDataSource, void> {
  const RemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$remoteDataSourceHash();

  @$internal
  @override
  RemoteDataSource create() => RemoteDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$remoteDataSourceHash() => r'c59cf8863dff44e7721b36f9c81cd0f32e9d358e';

abstract class _$RemoteDataSource extends $Notifier<void> {
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
