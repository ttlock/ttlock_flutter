// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lockSettingsHash() => r'3b68a9cc65a342ed3d970d5cd0cd9d6b3f8f680b';

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

abstract class _$LockSettings
    extends BuildlessAutoDisposeAsyncNotifier<LockSettingsState> {
  late final String lockMac;

  FutureOr<LockSettingsState> build(
    String lockMac,
  );
}

/// See also [LockSettings].
@ProviderFor(LockSettings)
const lockSettingsProvider = LockSettingsFamily();

/// See also [LockSettings].
class LockSettingsFamily extends Family<AsyncValue<LockSettingsState>> {
  /// See also [LockSettings].
  const LockSettingsFamily();

  /// See also [LockSettings].
  LockSettingsProvider call(
    String lockMac,
  ) {
    return LockSettingsProvider(
      lockMac,
    );
  }

  @override
  LockSettingsProvider getProviderOverride(
    covariant LockSettingsProvider provider,
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
  String? get name => r'lockSettingsProvider';
}

/// See also [LockSettings].
class LockSettingsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    LockSettings, LockSettingsState> {
  /// See also [LockSettings].
  LockSettingsProvider(
    String lockMac,
  ) : this._internal(
          () => LockSettings()..lockMac = lockMac,
          from: lockSettingsProvider,
          name: r'lockSettingsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lockSettingsHash,
          dependencies: LockSettingsFamily._dependencies,
          allTransitiveDependencies:
              LockSettingsFamily._allTransitiveDependencies,
          lockMac: lockMac,
        );

  LockSettingsProvider._internal(
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
  FutureOr<LockSettingsState> runNotifierBuild(
    covariant LockSettings notifier,
  ) {
    return notifier.build(
      lockMac,
    );
  }

  @override
  Override overrideWith(LockSettings Function() create) {
    return ProviderOverride(
      origin: this,
      override: LockSettingsProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<LockSettings, LockSettingsState>
      createElement() {
    return _LockSettingsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LockSettingsProvider && other.lockMac == lockMac;
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
mixin LockSettingsRef
    on AutoDisposeAsyncNotifierProviderRef<LockSettingsState> {
  /// The parameter `lockMac` of this provider.
  String get lockMac;
}

class _LockSettingsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LockSettings,
        LockSettingsState> with LockSettingsRef {
  _LockSettingsProviderElement(super.provider);

  @override
  String get lockMac => (origin as LockSettingsProvider).lockMac;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
