// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accessory_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accessoryCountsHash() => r'05d203a8595d7dcb41862504d87acf312c146147';

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

/// See also [accessoryCounts].
@ProviderFor(accessoryCounts)
const accessoryCountsProvider = AccessoryCountsFamily();

/// See also [accessoryCounts].
class AccessoryCountsFamily extends Family<AsyncValue<AccessoryCounts>> {
  /// See also [accessoryCounts].
  const AccessoryCountsFamily();

  /// See also [accessoryCounts].
  AccessoryCountsProvider call(
    String lockMac,
  ) {
    return AccessoryCountsProvider(
      lockMac,
    );
  }

  @override
  AccessoryCountsProvider getProviderOverride(
    covariant AccessoryCountsProvider provider,
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
  String? get name => r'accessoryCountsProvider';
}

/// See also [accessoryCounts].
class AccessoryCountsProvider
    extends AutoDisposeFutureProvider<AccessoryCounts> {
  /// See also [accessoryCounts].
  AccessoryCountsProvider(
    String lockMac,
  ) : this._internal(
          (ref) => accessoryCounts(
            ref as AccessoryCountsRef,
            lockMac,
          ),
          from: accessoryCountsProvider,
          name: r'accessoryCountsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$accessoryCountsHash,
          dependencies: AccessoryCountsFamily._dependencies,
          allTransitiveDependencies:
              AccessoryCountsFamily._allTransitiveDependencies,
          lockMac: lockMac,
        );

  AccessoryCountsProvider._internal(
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
  Override overrideWith(
    FutureOr<AccessoryCounts> Function(AccessoryCountsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AccessoryCountsProvider._internal(
        (ref) => create(ref as AccessoryCountsRef),
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
  AutoDisposeFutureProviderElement<AccessoryCounts> createElement() {
    return _AccessoryCountsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AccessoryCountsProvider && other.lockMac == lockMac;
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
mixin AccessoryCountsRef on AutoDisposeFutureProviderRef<AccessoryCounts> {
  /// The parameter `lockMac` of this provider.
  String get lockMac;
}

class _AccessoryCountsProviderElement
    extends AutoDisposeFutureProviderElement<AccessoryCounts>
    with AccessoryCountsRef {
  _AccessoryCountsProviderElement(super.provider);

  @override
  String get lockMac => (origin as AccessoryCountsProvider).lockMac;
}

String _$doorSensorListNotifierHash() =>
    r'1759d8278587cadf399a8e459481ffd48bd2492d';

abstract class _$DoorSensorListNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<SavedDoorSensor>> {
  late final String lockMac;

  FutureOr<List<SavedDoorSensor>> build(
    String lockMac,
  );
}

/// See also [DoorSensorListNotifier].
@ProviderFor(DoorSensorListNotifier)
const doorSensorListNotifierProvider = DoorSensorListNotifierFamily();

/// See also [DoorSensorListNotifier].
class DoorSensorListNotifierFamily
    extends Family<AsyncValue<List<SavedDoorSensor>>> {
  /// See also [DoorSensorListNotifier].
  const DoorSensorListNotifierFamily();

  /// See also [DoorSensorListNotifier].
  DoorSensorListNotifierProvider call(
    String lockMac,
  ) {
    return DoorSensorListNotifierProvider(
      lockMac,
    );
  }

  @override
  DoorSensorListNotifierProvider getProviderOverride(
    covariant DoorSensorListNotifierProvider provider,
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
  String? get name => r'doorSensorListNotifierProvider';
}

/// See also [DoorSensorListNotifier].
class DoorSensorListNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<DoorSensorListNotifier,
        List<SavedDoorSensor>> {
  /// See also [DoorSensorListNotifier].
  DoorSensorListNotifierProvider(
    String lockMac,
  ) : this._internal(
          () => DoorSensorListNotifier()..lockMac = lockMac,
          from: doorSensorListNotifierProvider,
          name: r'doorSensorListNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$doorSensorListNotifierHash,
          dependencies: DoorSensorListNotifierFamily._dependencies,
          allTransitiveDependencies:
              DoorSensorListNotifierFamily._allTransitiveDependencies,
          lockMac: lockMac,
        );

  DoorSensorListNotifierProvider._internal(
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
  FutureOr<List<SavedDoorSensor>> runNotifierBuild(
    covariant DoorSensorListNotifier notifier,
  ) {
    return notifier.build(
      lockMac,
    );
  }

  @override
  Override overrideWith(DoorSensorListNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: DoorSensorListNotifierProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<DoorSensorListNotifier,
      List<SavedDoorSensor>> createElement() {
    return _DoorSensorListNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DoorSensorListNotifierProvider && other.lockMac == lockMac;
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
mixin DoorSensorListNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<SavedDoorSensor>> {
  /// The parameter `lockMac` of this provider.
  String get lockMac;
}

class _DoorSensorListNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DoorSensorListNotifier,
        List<SavedDoorSensor>> with DoorSensorListNotifierRef {
  _DoorSensorListNotifierProviderElement(super.provider);

  @override
  String get lockMac => (origin as DoorSensorListNotifierProvider).lockMac;
}

String _$remoteKeyListNotifierHash() =>
    r'0692528c3a0565544a9518d03ce9b3ffa0927d3c';

abstract class _$RemoteKeyListNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<SavedRemoteKey>> {
  late final String lockMac;

  FutureOr<List<SavedRemoteKey>> build(
    String lockMac,
  );
}

/// See also [RemoteKeyListNotifier].
@ProviderFor(RemoteKeyListNotifier)
const remoteKeyListNotifierProvider = RemoteKeyListNotifierFamily();

/// See also [RemoteKeyListNotifier].
class RemoteKeyListNotifierFamily
    extends Family<AsyncValue<List<SavedRemoteKey>>> {
  /// See also [RemoteKeyListNotifier].
  const RemoteKeyListNotifierFamily();

  /// See also [RemoteKeyListNotifier].
  RemoteKeyListNotifierProvider call(
    String lockMac,
  ) {
    return RemoteKeyListNotifierProvider(
      lockMac,
    );
  }

  @override
  RemoteKeyListNotifierProvider getProviderOverride(
    covariant RemoteKeyListNotifierProvider provider,
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
  String? get name => r'remoteKeyListNotifierProvider';
}

/// See also [RemoteKeyListNotifier].
class RemoteKeyListNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<RemoteKeyListNotifier,
        List<SavedRemoteKey>> {
  /// See also [RemoteKeyListNotifier].
  RemoteKeyListNotifierProvider(
    String lockMac,
  ) : this._internal(
          () => RemoteKeyListNotifier()..lockMac = lockMac,
          from: remoteKeyListNotifierProvider,
          name: r'remoteKeyListNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$remoteKeyListNotifierHash,
          dependencies: RemoteKeyListNotifierFamily._dependencies,
          allTransitiveDependencies:
              RemoteKeyListNotifierFamily._allTransitiveDependencies,
          lockMac: lockMac,
        );

  RemoteKeyListNotifierProvider._internal(
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
  FutureOr<List<SavedRemoteKey>> runNotifierBuild(
    covariant RemoteKeyListNotifier notifier,
  ) {
    return notifier.build(
      lockMac,
    );
  }

  @override
  Override overrideWith(RemoteKeyListNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: RemoteKeyListNotifierProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<RemoteKeyListNotifier,
      List<SavedRemoteKey>> createElement() {
    return _RemoteKeyListNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RemoteKeyListNotifierProvider && other.lockMac == lockMac;
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
mixin RemoteKeyListNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<SavedRemoteKey>> {
  /// The parameter `lockMac` of this provider.
  String get lockMac;
}

class _RemoteKeyListNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RemoteKeyListNotifier,
        List<SavedRemoteKey>> with RemoteKeyListNotifierRef {
  _RemoteKeyListNotifierProviderElement(super.provider);

  @override
  String get lockMac => (origin as RemoteKeyListNotifierProvider).lockMac;
}

String _$keypadListNotifierHash() =>
    r'831b0a363ae3923c74f3eb1a7971d993f4c44216';

abstract class _$KeypadListNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<SavedKeypad>> {
  late final String lockMac;

  FutureOr<List<SavedKeypad>> build(
    String lockMac,
  );
}

/// See also [KeypadListNotifier].
@ProviderFor(KeypadListNotifier)
const keypadListNotifierProvider = KeypadListNotifierFamily();

/// See also [KeypadListNotifier].
class KeypadListNotifierFamily extends Family<AsyncValue<List<SavedKeypad>>> {
  /// See also [KeypadListNotifier].
  const KeypadListNotifierFamily();

  /// See also [KeypadListNotifier].
  KeypadListNotifierProvider call(
    String lockMac,
  ) {
    return KeypadListNotifierProvider(
      lockMac,
    );
  }

  @override
  KeypadListNotifierProvider getProviderOverride(
    covariant KeypadListNotifierProvider provider,
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
  String? get name => r'keypadListNotifierProvider';
}

/// See also [KeypadListNotifier].
class KeypadListNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    KeypadListNotifier, List<SavedKeypad>> {
  /// See also [KeypadListNotifier].
  KeypadListNotifierProvider(
    String lockMac,
  ) : this._internal(
          () => KeypadListNotifier()..lockMac = lockMac,
          from: keypadListNotifierProvider,
          name: r'keypadListNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$keypadListNotifierHash,
          dependencies: KeypadListNotifierFamily._dependencies,
          allTransitiveDependencies:
              KeypadListNotifierFamily._allTransitiveDependencies,
          lockMac: lockMac,
        );

  KeypadListNotifierProvider._internal(
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
  FutureOr<List<SavedKeypad>> runNotifierBuild(
    covariant KeypadListNotifier notifier,
  ) {
    return notifier.build(
      lockMac,
    );
  }

  @override
  Override overrideWith(KeypadListNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: KeypadListNotifierProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<KeypadListNotifier, List<SavedKeypad>>
      createElement() {
    return _KeypadListNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is KeypadListNotifierProvider && other.lockMac == lockMac;
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
mixin KeypadListNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<SavedKeypad>> {
  /// The parameter `lockMac` of this provider.
  String get lockMac;
}

class _KeypadListNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<KeypadListNotifier,
        List<SavedKeypad>> with KeypadListNotifierRef {
  _KeypadListNotifierProviderElement(super.provider);

  @override
  String get lockMac => (origin as KeypadListNotifierProvider).lockMac;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
