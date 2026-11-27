// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_record_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(lockRecordApi)
const lockRecordApiProvider = LockRecordApiProvider._();

final class LockRecordApiProvider
    extends $FunctionalProvider<LockRecordApi, LockRecordApi, LockRecordApi>
    with $Provider<LockRecordApi> {
  const LockRecordApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lockRecordApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lockRecordApiHash();

  @$internal
  @override
  $ProviderElement<LockRecordApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LockRecordApi create(Ref ref) {
    return lockRecordApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LockRecordApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LockRecordApi>(value),
    );
  }
}

String _$lockRecordApiHash() => r'33d130b3b9ef0391d36d5dde49013099152254db';

@ProviderFor(LockRecordDataSource)
const lockRecordDataSourceProvider = LockRecordDataSourceProvider._();

final class LockRecordDataSourceProvider
    extends $NotifierProvider<LockRecordDataSource, void> {
  const LockRecordDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lockRecordDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lockRecordDataSourceHash();

  @$internal
  @override
  LockRecordDataSource create() => LockRecordDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$lockRecordDataSourceHash() =>
    r'752590b90f715b4bbda3538e9dea2d2efe1e931c';

abstract class _$LockRecordDataSource extends $Notifier<void> {
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
