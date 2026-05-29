// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_local_storage_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lockLocalCacheNotifierHash() =>
    r'db01eb2ac53d982192e8ca3fda5da1fee33e7b91';

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

abstract class _$LockLocalCacheNotifier
    extends BuildlessAutoDisposeAsyncNotifier<LockLocalCache> {
  late final String lockMac;

  FutureOr<LockLocalCache> build(
    String lockMac,
  );
}

/// See also [LockLocalCacheNotifier].
@ProviderFor(LockLocalCacheNotifier)
const lockLocalCacheNotifierProvider = LockLocalCacheNotifierFamily();

/// See also [LockLocalCacheNotifier].
class LockLocalCacheNotifierFamily extends Family<AsyncValue<LockLocalCache>> {
  /// See also [LockLocalCacheNotifier].
  const LockLocalCacheNotifierFamily();

  /// See also [LockLocalCacheNotifier].
  LockLocalCacheNotifierProvider call(
    String lockMac,
  ) {
    return LockLocalCacheNotifierProvider(
      lockMac,
    );
  }

  @override
  LockLocalCacheNotifierProvider getProviderOverride(
    covariant LockLocalCacheNotifierProvider provider,
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
  String? get name => r'lockLocalCacheNotifierProvider';
}

/// See also [LockLocalCacheNotifier].
class LockLocalCacheNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<LockLocalCacheNotifier,
        LockLocalCache> {
  /// See also [LockLocalCacheNotifier].
  LockLocalCacheNotifierProvider(
    String lockMac,
  ) : this._internal(
          () => LockLocalCacheNotifier()..lockMac = lockMac,
          from: lockLocalCacheNotifierProvider,
          name: r'lockLocalCacheNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lockLocalCacheNotifierHash,
          dependencies: LockLocalCacheNotifierFamily._dependencies,
          allTransitiveDependencies:
              LockLocalCacheNotifierFamily._allTransitiveDependencies,
          lockMac: lockMac,
        );

  LockLocalCacheNotifierProvider._internal(
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
  FutureOr<LockLocalCache> runNotifierBuild(
    covariant LockLocalCacheNotifier notifier,
  ) {
    return notifier.build(
      lockMac,
    );
  }

  @override
  Override overrideWith(LockLocalCacheNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: LockLocalCacheNotifierProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<LockLocalCacheNotifier,
      LockLocalCache> createElement() {
    return _LockLocalCacheNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LockLocalCacheNotifierProvider && other.lockMac == lockMac;
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
mixin LockLocalCacheNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<LockLocalCache> {
  /// The parameter `lockMac` of this provider.
  String get lockMac;
}

class _LockLocalCacheNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LockLocalCacheNotifier,
        LockLocalCache> with LockLocalCacheNotifierRef {
  _LockLocalCacheNotifierProviderElement(super.provider);

  @override
  String get lockMac => (origin as LockLocalCacheNotifierProvider).lockMac;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
