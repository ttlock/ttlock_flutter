// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$scanNotifierHash() => r'038f91c25fbb81ab7eeb953894284eb76a11cdc5';

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

abstract class _$ScanNotifier extends BuildlessAutoDisposeNotifier<ScanState> {
  late final ScanConfig config;

  ScanState build(
    ScanConfig config,
  );
}

/// See also [ScanNotifier].
@ProviderFor(ScanNotifier)
const scanNotifierProvider = ScanNotifierFamily();

/// See also [ScanNotifier].
class ScanNotifierFamily extends Family<ScanState> {
  /// See also [ScanNotifier].
  const ScanNotifierFamily();

  /// See also [ScanNotifier].
  ScanNotifierProvider call(
    ScanConfig config,
  ) {
    return ScanNotifierProvider(
      config,
    );
  }

  @override
  ScanNotifierProvider getProviderOverride(
    covariant ScanNotifierProvider provider,
  ) {
    return call(
      provider.config,
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
  String? get name => r'scanNotifierProvider';
}

/// See also [ScanNotifier].
class ScanNotifierProvider
    extends AutoDisposeNotifierProviderImpl<ScanNotifier, ScanState> {
  /// See also [ScanNotifier].
  ScanNotifierProvider(
    ScanConfig config,
  ) : this._internal(
          () => ScanNotifier()..config = config,
          from: scanNotifierProvider,
          name: r'scanNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$scanNotifierHash,
          dependencies: ScanNotifierFamily._dependencies,
          allTransitiveDependencies:
              ScanNotifierFamily._allTransitiveDependencies,
          config: config,
        );

  ScanNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.config,
  }) : super.internal();

  final ScanConfig config;

  @override
  ScanState runNotifierBuild(
    covariant ScanNotifier notifier,
  ) {
    return notifier.build(
      config,
    );
  }

  @override
  Override overrideWith(ScanNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ScanNotifierProvider._internal(
        () => create()..config = config,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        config: config,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ScanNotifier, ScanState> createElement() {
    return _ScanNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ScanNotifierProvider && other.config == config;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, config.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ScanNotifierRef on AutoDisposeNotifierProviderRef<ScanState> {
  /// The parameter `config` of this provider.
  ScanConfig get config;
}

class _ScanNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<ScanNotifier, ScanState>
    with ScanNotifierRef {
  _ScanNotifierProviderElement(super.provider);

  @override
  ScanConfig get config => (origin as ScanNotifierProvider).config;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
