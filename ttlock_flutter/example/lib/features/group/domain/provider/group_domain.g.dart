// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GroupDomain)
const groupDomainProvider = GroupDomainProvider._();

final class GroupDomainProvider extends $NotifierProvider<GroupDomain, void> {
  const GroupDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groupDomainProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groupDomainHash();

  @$internal
  @override
  GroupDomain create() => GroupDomain();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$groupDomainHash() => r'276eff40e9f2ceb8aa2712f6cc599794485214cb';

abstract class _$GroupDomain extends $Notifier<void> {
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
