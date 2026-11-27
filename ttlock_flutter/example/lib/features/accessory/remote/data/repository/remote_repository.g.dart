// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RemoteRepository)
const remoteRepositoryProvider = RemoteRepositoryProvider._();

final class RemoteRepositoryProvider
    extends $NotifierProvider<RemoteRepository, void> {
  const RemoteRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remoteRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$remoteRepositoryHash();

  @$internal
  @override
  RemoteRepository create() => RemoteRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$remoteRepositoryHash() => r'8df442812343f61caceb020f717a53a1eb734e9a';

abstract class _$RemoteRepository extends $Notifier<void> {
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
