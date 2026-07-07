// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lockByMacHash() => r'33b1dddc8d3cc40fc2602ac1711cdae78158b462';

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

/// See also [lockByMac].
@ProviderFor(lockByMac)
const lockByMacProvider = LockByMacFamily();

/// See also [lockByMac].
class LockByMacFamily extends Family<AsyncValue<SavedLockDevice?>> {
  /// See also [lockByMac].
  const LockByMacFamily();

  /// See also [lockByMac].
  LockByMacProvider call(
    String mac,
  ) {
    return LockByMacProvider(
      mac,
    );
  }

  @override
  LockByMacProvider getProviderOverride(
    covariant LockByMacProvider provider,
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
  String? get name => r'lockByMacProvider';
}

/// See also [lockByMac].
class LockByMacProvider extends AutoDisposeFutureProvider<SavedLockDevice?> {
  /// See also [lockByMac].
  LockByMacProvider(
    String mac,
  ) : this._internal(
          (ref) => lockByMac(
            ref as LockByMacRef,
            mac,
          ),
          from: lockByMacProvider,
          name: r'lockByMacProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lockByMacHash,
          dependencies: LockByMacFamily._dependencies,
          allTransitiveDependencies: LockByMacFamily._allTransitiveDependencies,
          mac: mac,
        );

  LockByMacProvider._internal(
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
    FutureOr<SavedLockDevice?> Function(LockByMacRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LockByMacProvider._internal(
        (ref) => create(ref as LockByMacRef),
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
  AutoDisposeFutureProviderElement<SavedLockDevice?> createElement() {
    return _LockByMacProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LockByMacProvider && other.mac == mac;
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
mixin LockByMacRef on AutoDisposeFutureProviderRef<SavedLockDevice?> {
  /// The parameter `mac` of this provider.
  String get mac;
}

class _LockByMacProviderElement
    extends AutoDisposeFutureProviderElement<SavedLockDevice?>
    with LockByMacRef {
  _LockByMacProviderElement(super.provider);

  @override
  String get mac => (origin as LockByMacProvider).mac;
}

String _$lockListNotifierHash() => r'7e53316b79c8acc82c20649594fb31efc626afae';

/// See also [LockListNotifier].
@ProviderFor(LockListNotifier)
final lockListNotifierProvider = AutoDisposeAsyncNotifierProvider<
    LockListNotifier, List<SavedLockDevice>>.internal(
  LockListNotifier.new,
  name: r'lockListNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lockListNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LockListNotifier = AutoDisposeAsyncNotifier<List<SavedLockDevice>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
