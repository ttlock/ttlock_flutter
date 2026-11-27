// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(keyApi)
const keyApiProvider = KeyApiProvider._();

final class KeyApiProvider extends $FunctionalProvider<KeyApi, KeyApi, KeyApi>
    with $Provider<KeyApi> {
  const KeyApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'keyApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$keyApiHash();

  @$internal
  @override
  $ProviderElement<KeyApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  KeyApi create(Ref ref) {
    return keyApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(KeyApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<KeyApi>(value),
    );
  }
}

String _$keyApiHash() => r'f99f32081e103b34f7a8184bd3359e604c2d5455';

@ProviderFor(KeyDataSource)
const keyDataSourceProvider = KeyDataSourceProvider._();

final class KeyDataSourceProvider
    extends $NotifierProvider<KeyDataSource, void> {
  const KeyDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'keyDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$keyDataSourceHash();

  @$internal
  @override
  KeyDataSource create() => KeyDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$keyDataSourceHash() => r'3f67be5ce3da19c224c4d270bb56a916f955ebfd';

abstract class _$KeyDataSource extends $Notifier<void> {
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
