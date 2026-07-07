// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$faceListHash() => r'5f03f4d9c4ba182a9c2bbf96f1198c57df8c777b';

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

abstract class _$FaceList
    extends BuildlessAutoDisposeAsyncNotifier<List<CachedFace>> {
  late final String lockMac;

  FutureOr<List<CachedFace>> build(
    String lockMac,
  );
}

/// See also [FaceList].
@ProviderFor(FaceList)
const faceListProvider = FaceListFamily();

/// See also [FaceList].
class FaceListFamily extends Family<AsyncValue<List<CachedFace>>> {
  /// See also [FaceList].
  const FaceListFamily();

  /// See also [FaceList].
  FaceListProvider call(
    String lockMac,
  ) {
    return FaceListProvider(
      lockMac,
    );
  }

  @override
  FaceListProvider getProviderOverride(
    covariant FaceListProvider provider,
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
  String? get name => r'faceListProvider';
}

/// See also [FaceList].
class FaceListProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FaceList, List<CachedFace>> {
  /// See also [FaceList].
  FaceListProvider(
    String lockMac,
  ) : this._internal(
          () => FaceList()..lockMac = lockMac,
          from: faceListProvider,
          name: r'faceListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$faceListHash,
          dependencies: FaceListFamily._dependencies,
          allTransitiveDependencies: FaceListFamily._allTransitiveDependencies,
          lockMac: lockMac,
        );

  FaceListProvider._internal(
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
  FutureOr<List<CachedFace>> runNotifierBuild(
    covariant FaceList notifier,
  ) {
    return notifier.build(
      lockMac,
    );
  }

  @override
  Override overrideWith(FaceList Function() create) {
    return ProviderOverride(
      origin: this,
      override: FaceListProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<FaceList, List<CachedFace>>
      createElement() {
    return _FaceListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FaceListProvider && other.lockMac == lockMac;
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
mixin FaceListRef on AutoDisposeAsyncNotifierProviderRef<List<CachedFace>> {
  /// The parameter `lockMac` of this provider.
  String get lockMac;
}

class _FaceListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FaceList, List<CachedFace>>
    with FaceListRef {
  _FaceListProviderElement(super.provider);

  @override
  String get lockMac => (origin as FaceListProvider).lockMac;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
