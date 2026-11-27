// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(groupApi)
const groupApiProvider = GroupApiProvider._();

final class GroupApiProvider
    extends $FunctionalProvider<GroupApi, GroupApi, GroupApi>
    with $Provider<GroupApi> {
  const GroupApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groupApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groupApiHash();

  @$internal
  @override
  $ProviderElement<GroupApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GroupApi create(Ref ref) {
    return groupApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GroupApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GroupApi>(value),
    );
  }
}

String _$groupApiHash() => r'd84fa9ddf61597ddf563be5d709e052f52d765ca';

@ProviderFor(GroupDataSource)
const groupDataSourceProvider = GroupDataSourceProvider._();

final class GroupDataSourceProvider
    extends $NotifierProvider<GroupDataSource, void> {
  const GroupDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groupDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groupDataSourceHash();

  @$internal
  @override
  GroupDataSource create() => GroupDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$groupDataSourceHash() => r'2121ee6d6012ca824d9a667c7d94bf870e644c51';

abstract class _$GroupDataSource extends $Notifier<void> {
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
