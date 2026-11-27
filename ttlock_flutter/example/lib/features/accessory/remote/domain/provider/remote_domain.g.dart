// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RemoteDomain)
const remoteDomainProvider = RemoteDomainProvider._();

final class RemoteDomainProvider extends $NotifierProvider<RemoteDomain, void> {
  const RemoteDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remoteDomainProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$remoteDomainHash();

  @$internal
  @override
  RemoteDomain create() => RemoteDomain();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$remoteDomainHash() => r'e9281ae2bb21e5cde28703ffb1c4da25af955c70';

abstract class _$RemoteDomain extends $Notifier<void> {
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
