// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_setting_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(lockSettingApi)
const lockSettingApiProvider = LockSettingApiProvider._();

final class LockSettingApiProvider
    extends $FunctionalProvider<LockSettingApi, LockSettingApi, LockSettingApi>
    with $Provider<LockSettingApi> {
  const LockSettingApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lockSettingApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lockSettingApiHash();

  @$internal
  @override
  $ProviderElement<LockSettingApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LockSettingApi create(Ref ref) {
    return lockSettingApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LockSettingApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LockSettingApi>(value),
    );
  }
}

String _$lockSettingApiHash() => r'55e24c9816304a8db7f53607f25f361537161057';

@ProviderFor(LockSettingDataSource)
const lockSettingDataSourceProvider = LockSettingDataSourceProvider._();

final class LockSettingDataSourceProvider
    extends $NotifierProvider<LockSettingDataSource, void> {
  const LockSettingDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lockSettingDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lockSettingDataSourceHash();

  @$internal
  @override
  LockSettingDataSource create() => LockSettingDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$lockSettingDataSourceHash() =>
    r'ca5ea677f537ed5eb0738d40a58149082c9368bf';

abstract class _$LockSettingDataSource extends $Notifier<void> {
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
