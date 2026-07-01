// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palm_vein_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$palmVeinListHash() => r'e98a99e7d6d654802decb6d27a633f65fd8048f4';

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

abstract class _$PalmVeinList
    extends BuildlessAutoDisposeAsyncNotifier<List<CachedPalmVein>> {
  late final String lockMac;

  FutureOr<List<CachedPalmVein>> build(
    String lockMac,
  );
}

/// See also [PalmVeinList].
@ProviderFor(PalmVeinList)
const palmVeinListProvider = PalmVeinListFamily();

/// See also [PalmVeinList].
class PalmVeinListFamily extends Family<AsyncValue<List<CachedPalmVein>>> {
  /// See also [PalmVeinList].
  const PalmVeinListFamily();

  /// See also [PalmVeinList].
  PalmVeinListProvider call(
    String lockMac,
  ) {
    return PalmVeinListProvider(
      lockMac,
    );
  }

  @override
  PalmVeinListProvider getProviderOverride(
    covariant PalmVeinListProvider provider,
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
  String? get name => r'palmVeinListProvider';
}

/// See also [PalmVeinList].
class PalmVeinListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    PalmVeinList, List<CachedPalmVein>> {
  /// See also [PalmVeinList].
  PalmVeinListProvider(
    String lockMac,
  ) : this._internal(
          () => PalmVeinList()..lockMac = lockMac,
          from: palmVeinListProvider,
          name: r'palmVeinListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$palmVeinListHash,
          dependencies: PalmVeinListFamily._dependencies,
          allTransitiveDependencies:
              PalmVeinListFamily._allTransitiveDependencies,
          lockMac: lockMac,
        );

  PalmVeinListProvider._internal(
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
  FutureOr<List<CachedPalmVein>> runNotifierBuild(
    covariant PalmVeinList notifier,
  ) {
    return notifier.build(
      lockMac,
    );
  }

  @override
  Override overrideWith(PalmVeinList Function() create) {
    return ProviderOverride(
      origin: this,
      override: PalmVeinListProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<PalmVeinList, List<CachedPalmVein>>
      createElement() {
    return _PalmVeinListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PalmVeinListProvider && other.lockMac == lockMac;
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
mixin PalmVeinListRef
    on AutoDisposeAsyncNotifierProviderRef<List<CachedPalmVein>> {
  /// The parameter `lockMac` of this provider.
  String get lockMac;
}

class _PalmVeinListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PalmVeinList,
        List<CachedPalmVein>> with PalmVeinListRef {
  _PalmVeinListProviderElement(super.provider);

  @override
  String get lockMac => (origin as PalmVeinListProvider).lockMac;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
