// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserDomain)
const userDomainProvider = UserDomainProvider._();

final class UserDomainProvider extends $NotifierProvider<UserDomain, void> {
  const UserDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userDomainProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userDomainHash();

  @$internal
  @override
  UserDomain create() => UserDomain();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$userDomainHash() => r'632e10dda514677380c799df6c92c6de21f8359e';

abstract class _$UserDomain extends $Notifier<void> {
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
