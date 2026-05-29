// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passcode_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$passcodeListHash() => r'461b996f1c2f9398c91deaf3844e7651ceaec35a';

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

abstract class _$PasscodeList
    extends BuildlessAutoDisposeAsyncNotifier<List<TTPasscodeModel>> {
  late final String lockMac;

  FutureOr<List<TTPasscodeModel>> build(
    String lockMac,
  );
}

/// See also [PasscodeList].
@ProviderFor(PasscodeList)
const passcodeListProvider = PasscodeListFamily();

/// See also [PasscodeList].
class PasscodeListFamily extends Family<AsyncValue<List<TTPasscodeModel>>> {
  /// See also [PasscodeList].
  const PasscodeListFamily();

  /// See also [PasscodeList].
  PasscodeListProvider call(
    String lockMac,
  ) {
    return PasscodeListProvider(
      lockMac,
    );
  }

  @override
  PasscodeListProvider getProviderOverride(
    covariant PasscodeListProvider provider,
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
  String? get name => r'passcodeListProvider';
}

/// See also [PasscodeList].
class PasscodeListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    PasscodeList, List<TTPasscodeModel>> {
  /// See also [PasscodeList].
  PasscodeListProvider(
    String lockMac,
  ) : this._internal(
          () => PasscodeList()..lockMac = lockMac,
          from: passcodeListProvider,
          name: r'passcodeListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$passcodeListHash,
          dependencies: PasscodeListFamily._dependencies,
          allTransitiveDependencies:
              PasscodeListFamily._allTransitiveDependencies,
          lockMac: lockMac,
        );

  PasscodeListProvider._internal(
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
  FutureOr<List<TTPasscodeModel>> runNotifierBuild(
    covariant PasscodeList notifier,
  ) {
    return notifier.build(
      lockMac,
    );
  }

  @override
  Override overrideWith(PasscodeList Function() create) {
    return ProviderOverride(
      origin: this,
      override: PasscodeListProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<PasscodeList, List<TTPasscodeModel>>
      createElement() {
    return _PasscodeListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PasscodeListProvider && other.lockMac == lockMac;
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
mixin PasscodeListRef
    on AutoDisposeAsyncNotifierProviderRef<List<TTPasscodeModel>> {
  /// The parameter `lockMac` of this provider.
  String get lockMac;
}

class _PasscodeListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PasscodeList,
        List<TTPasscodeModel>> with PasscodeListRef {
  _PasscodeListProviderElement(super.provider);

  @override
  String get lockMac => (origin as PasscodeListProvider).lockMac;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
