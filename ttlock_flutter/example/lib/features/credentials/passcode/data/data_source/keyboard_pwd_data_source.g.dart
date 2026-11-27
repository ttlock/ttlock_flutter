// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyboard_pwd_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(keyboardPwdApi)
const keyboardPwdApiProvider = KeyboardPwdApiProvider._();

final class KeyboardPwdApiProvider
    extends $FunctionalProvider<KeyboardPwdApi, KeyboardPwdApi, KeyboardPwdApi>
    with $Provider<KeyboardPwdApi> {
  const KeyboardPwdApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'keyboardPwdApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$keyboardPwdApiHash();

  @$internal
  @override
  $ProviderElement<KeyboardPwdApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  KeyboardPwdApi create(Ref ref) {
    return keyboardPwdApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(KeyboardPwdApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<KeyboardPwdApi>(value),
    );
  }
}

String _$keyboardPwdApiHash() => r'92200f4f652d08435aac73e37967b3a855186150';

@ProviderFor(KeyboardPwdDataSource)
const keyboardPwdDataSourceProvider = KeyboardPwdDataSourceProvider._();

final class KeyboardPwdDataSourceProvider
    extends $NotifierProvider<KeyboardPwdDataSource, void> {
  const KeyboardPwdDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'keyboardPwdDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$keyboardPwdDataSourceHash();

  @$internal
  @override
  KeyboardPwdDataSource create() => KeyboardPwdDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$keyboardPwdDataSourceHash() =>
    r'40153e790369d32c0ee219206c7fb37034fd96bd';

abstract class _$KeyboardPwdDataSource extends $Notifier<void> {
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
