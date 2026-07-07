// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_capabilities_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lockCapabilitiesHash() => r'e572c0642bb07c3c85794113218357fde31847f3';

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

abstract class _$LockCapabilities
    extends BuildlessAutoDisposeAsyncNotifier<Set<TTLockFunction>> {
  late final String lockMac;

  FutureOr<Set<TTLockFunction>> build(
    String lockMac,
  );
}

/// See also [LockCapabilities].
@ProviderFor(LockCapabilities)
const lockCapabilitiesProvider = LockCapabilitiesFamily();

/// See also [LockCapabilities].
class LockCapabilitiesFamily extends Family<AsyncValue<Set<TTLockFunction>>> {
  /// See also [LockCapabilities].
  const LockCapabilitiesFamily();

  /// See also [LockCapabilities].
  LockCapabilitiesProvider call(
    String lockMac,
  ) {
    return LockCapabilitiesProvider(
      lockMac,
    );
  }

  @override
  LockCapabilitiesProvider getProviderOverride(
    covariant LockCapabilitiesProvider provider,
  ) {
    return call(
      provider.lockMac,
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
  String? get name => r'lockCapabilitiesProvider';
}

/// See also [LockCapabilities].
class LockCapabilitiesProvider extends AutoDisposeAsyncNotifierProviderImpl<
    LockCapabilities, Set<TTLockFunction>> {
  /// See also [LockCapabilities].
  LockCapabilitiesProvider(
    String lockMac,
  ) : this._internal(
          () => LockCapabilities()..lockMac = lockMac,
          from: lockCapabilitiesProvider,
          name: r'lockCapabilitiesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lockCapabilitiesHash,
          dependencies: LockCapabilitiesFamily._dependencies,
          allTransitiveDependencies:
              LockCapabilitiesFamily._allTransitiveDependencies,
          lockMac: lockMac,
        );

  LockCapabilitiesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lockMac,
  }) : super.internal();

  final String lockMac;

  @override
  FutureOr<Set<TTLockFunction>> runNotifierBuild(
    covariant LockCapabilities notifier,
  ) {
    return notifier.build(
      lockMac,
    );
  }

  @override
  Override overrideWith(LockCapabilities Function() create) {
    return ProviderOverride(
      origin: this,
      override: LockCapabilitiesProvider._internal(
        () => create()..lockMac = lockMac,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lockMac: lockMac,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<LockCapabilities, Set<TTLockFunction>>
      createElement() {
    return _LockCapabilitiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LockCapabilitiesProvider && other.lockMac == lockMac;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lockMac.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LockCapabilitiesRef
    on AutoDisposeAsyncNotifierProviderRef<Set<TTLockFunction>> {
  /// The parameter `lockMac` of this provider.
  String get lockMac;
}

class _LockCapabilitiesProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LockCapabilities,
        Set<TTLockFunction>> with LockCapabilitiesRef {
  _LockCapabilitiesProviderElement(super.provider);

  @override
  String get lockMac => (origin as LockCapabilitiesProvider).lockMac;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
