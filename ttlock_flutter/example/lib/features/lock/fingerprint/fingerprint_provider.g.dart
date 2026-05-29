// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fingerprint_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fingerprintListHash() => r'378a5e9cc6d65d134dee8ca22ab1ec74865ace8e';

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

abstract class _$FingerprintList
    extends BuildlessAutoDisposeAsyncNotifier<List<TTFingerprintModel>> {
  late final String lockMac;

  FutureOr<List<TTFingerprintModel>> build(
    String lockMac,
  );
}

/// See also [FingerprintList].
@ProviderFor(FingerprintList)
const fingerprintListProvider = FingerprintListFamily();

/// See also [FingerprintList].
class FingerprintListFamily
    extends Family<AsyncValue<List<TTFingerprintModel>>> {
  /// See also [FingerprintList].
  const FingerprintListFamily();

  /// See also [FingerprintList].
  FingerprintListProvider call(
    String lockMac,
  ) {
    return FingerprintListProvider(
      lockMac,
    );
  }

  @override
  FingerprintListProvider getProviderOverride(
    covariant FingerprintListProvider provider,
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
  String? get name => r'fingerprintListProvider';
}

/// See also [FingerprintList].
class FingerprintListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    FingerprintList, List<TTFingerprintModel>> {
  /// See also [FingerprintList].
  FingerprintListProvider(
    String lockMac,
  ) : this._internal(
          () => FingerprintList()..lockMac = lockMac,
          from: fingerprintListProvider,
          name: r'fingerprintListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fingerprintListHash,
          dependencies: FingerprintListFamily._dependencies,
          allTransitiveDependencies:
              FingerprintListFamily._allTransitiveDependencies,
          lockMac: lockMac,
        );

  FingerprintListProvider._internal(
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
  FutureOr<List<TTFingerprintModel>> runNotifierBuild(
    covariant FingerprintList notifier,
  ) {
    return notifier.build(
      lockMac,
    );
  }

  @override
  Override overrideWith(FingerprintList Function() create) {
    return ProviderOverride(
      origin: this,
      override: FingerprintListProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<FingerprintList,
      List<TTFingerprintModel>> createElement() {
    return _FingerprintListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FingerprintListProvider && other.lockMac == lockMac;
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
mixin FingerprintListRef
    on AutoDisposeAsyncNotifierProviderRef<List<TTFingerprintModel>> {
  /// The parameter `lockMac` of this provider.
  String get lockMac;
}

class _FingerprintListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FingerprintList,
        List<TTFingerprintModel>> with FingerprintListRef {
  _FingerprintListProviderElement(super.provider);

  @override
  String get lockMac => (origin as FingerprintListProvider).lockMac;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
