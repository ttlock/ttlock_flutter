// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyboard_pwd_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(KeyboardPwdRepository)
const keyboardPwdRepositoryProvider = KeyboardPwdRepositoryProvider._();

final class KeyboardPwdRepositoryProvider
    extends $NotifierProvider<KeyboardPwdRepository, void> {
  const KeyboardPwdRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'keyboardPwdRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$keyboardPwdRepositoryHash();

  @$internal
  @override
  KeyboardPwdRepository create() => KeyboardPwdRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$keyboardPwdRepositoryHash() =>
    r'a5ab53296a6605a118c3156ee0f5d38973f42984';

abstract class _$KeyboardPwdRepository extends $Notifier<void> {
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
