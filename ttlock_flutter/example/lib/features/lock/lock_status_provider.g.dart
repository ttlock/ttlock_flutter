// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_status_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lockStatusHash() => r'926b4aaed8abe939cd6a227b63733918367104cd';

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

abstract class _$LockStatus
    extends BuildlessAutoDisposeAsyncNotifier<LockStatusState> {
  late final String lockMac;

  FutureOr<LockStatusState> build(
    String lockMac,
  );
}

/// See also [LockStatus].
@ProviderFor(LockStatus)
const lockStatusProvider = LockStatusFamily();

/// See also [LockStatus].
class LockStatusFamily extends Family<AsyncValue<LockStatusState>> {
  /// See also [LockStatus].
  const LockStatusFamily();

  /// See also [LockStatus].
  LockStatusProvider call(
    String lockMac,
  ) {
    return LockStatusProvider(
      lockMac,
    );
  }

  @override
  LockStatusProvider getProviderOverride(
    covariant LockStatusProvider provider,
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
  String? get name => r'lockStatusProvider';
}

/// See also [LockStatus].
class LockStatusProvider
    extends AutoDisposeAsyncNotifierProviderImpl<LockStatus, LockStatusState> {
  /// See also [LockStatus].
  LockStatusProvider(
    String lockMac,
  ) : this._internal(
          () => LockStatus()..lockMac = lockMac,
          from: lockStatusProvider,
          name: r'lockStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lockStatusHash,
          dependencies: LockStatusFamily._dependencies,
          allTransitiveDependencies:
              LockStatusFamily._allTransitiveDependencies,
          lockMac: lockMac,
        );

  LockStatusProvider._internal(
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
  FutureOr<LockStatusState> runNotifierBuild(
    covariant LockStatus notifier,
  ) {
    return notifier.build(
      lockMac,
    );
  }

  @override
  Override overrideWith(LockStatus Function() create) {
    return ProviderOverride(
      origin: this,
      override: LockStatusProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<LockStatus, LockStatusState>
      createElement() {
    return _LockStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LockStatusProvider && other.lockMac == lockMac;
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
mixin LockStatusRef on AutoDisposeAsyncNotifierProviderRef<LockStatusState> {
  /// The parameter `lockMac` of this provider.
  String get lockMac;
}

class _LockStatusProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LockStatus, LockStatusState>
    with LockStatusRef {
  _LockStatusProviderElement(super.provider);

  @override
  String get lockMac => (origin as LockStatusProvider).lockMac;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
