// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(lockApi)
const lockApiProvider = LockApiProvider._();

final class LockApiProvider
    extends $FunctionalProvider<LockApi, LockApi, LockApi>
    with $Provider<LockApi> {
  const LockApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lockApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lockApiHash();

  @$internal
  @override
  $ProviderElement<LockApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LockApi create(Ref ref) {
    return lockApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LockApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LockApi>(value),
    );
  }
}

String _$lockApiHash() => r'35a4d1d6781a50729e37802a92fea23ed3b0e981';

@ProviderFor(LockDataSource)
const lockDataSourceProvider = LockDataSourceProvider._();

final class LockDataSourceProvider
    extends $NotifierProvider<LockDataSource, void> {
  const LockDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lockDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lockDataSourceHash();

  @$internal
  @override
  LockDataSource create() => LockDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$lockDataSourceHash() => r'80d1812e455e8e1864cb8d625ec9326e8e4b2ad2';

abstract class _$LockDataSource extends $Notifier<void> {
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
