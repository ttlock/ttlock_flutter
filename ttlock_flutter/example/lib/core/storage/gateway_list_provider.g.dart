// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gateway_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gatewayByMacHash() => r'624709dafc31de82a30d5558aaf6a999d57ce4bc';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [gatewayByMac].
@ProviderFor(gatewayByMac)
const gatewayByMacProvider = GatewayByMacFamily();

/// See also [gatewayByMac].
class GatewayByMacFamily extends Family<AsyncValue<SavedGatewayDevice?>> {
  /// See also [gatewayByMac].
  const GatewayByMacFamily();

  /// See also [gatewayByMac].
  GatewayByMacProvider call(
    String mac,
  ) {
    return GatewayByMacProvider(
      mac,
    );
  }

  @override
  GatewayByMacProvider getProviderOverride(
    covariant GatewayByMacProvider provider,
  ) {
    return call(
      provider.mac,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'gatewayByMacProvider';
}

/// See also [gatewayByMac].
class GatewayByMacProvider
    extends AutoDisposeFutureProvider<SavedGatewayDevice?> {
  /// See also [gatewayByMac].
  GatewayByMacProvider(
    String mac,
  ) : this._internal(
          (ref) => gatewayByMac(
            ref as GatewayByMacRef,
            mac,
          ),
          from: gatewayByMacProvider,
          name: r'gatewayByMacProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gatewayByMacHash,
          dependencies: GatewayByMacFamily._dependencies,
          allTransitiveDependencies:
              GatewayByMacFamily._allTransitiveDependencies,
          mac: mac,
        );

  GatewayByMacProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mac,
  }) : super.internal();

  final String mac;

  @override
  Override overrideWith(
    FutureOr<SavedGatewayDevice?> Function(GatewayByMacRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GatewayByMacProvider._internal(
        (ref) => create(ref as GatewayByMacRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mac: mac,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SavedGatewayDevice?> createElement() {
    return _GatewayByMacProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GatewayByMacProvider && other.mac == mac;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mac.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GatewayByMacRef on AutoDisposeFutureProviderRef<SavedGatewayDevice?> {
  /// The parameter `mac` of this provider.
  String get mac;
}

class _GatewayByMacProviderElement
    extends AutoDisposeFutureProviderElement<SavedGatewayDevice?>
    with GatewayByMacRef {
  _GatewayByMacProviderElement(super.provider);

  @override
  String get mac => (origin as GatewayByMacProvider).mac;
}

String _$gatewayListNotifierHash() =>
    r'86ec69b072c4a3dc8b0e30155740403c7ed575a6';

/// See also [GatewayListNotifier].
@ProviderFor(GatewayListNotifier)
final gatewayListNotifierProvider = AutoDisposeAsyncNotifierProvider<
    GatewayListNotifier, List<SavedGatewayDevice>>.internal(
  GatewayListNotifier.new,
  name: r'gatewayListNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gatewayListNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GatewayListNotifier
    = AutoDisposeAsyncNotifier<List<SavedGatewayDevice>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
