// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserProvider)
const userProviderProvider = UserProviderProvider._();

final class UserProviderProvider
    extends $NotifierProvider<UserProvider, UserSession?> {
  const UserProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userProviderHash();

  @$internal
  @override
  UserProvider create() => UserProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserSession? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserSession?>(value),
    );
  }
}

String _$userProviderHash() => r'93e020dc57dccd358cc5c977842541b7dfc3a49a';

abstract class _$UserProvider extends $Notifier<UserSession?> {
  UserSession? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UserSession?, UserSession?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserSession?, UserSession?>,
              UserSession?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
