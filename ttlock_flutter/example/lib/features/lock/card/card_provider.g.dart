// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cardListHash() => r'e2c7a1a556ab6322905139d7bdb9ca08ab0c4312';

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

abstract class _$CardList
    extends BuildlessAutoDisposeAsyncNotifier<List<TTICCardModel>> {
  late final String lockMac;

  FutureOr<List<TTICCardModel>> build(
    String lockMac,
  );
}

/// See also [CardList].
@ProviderFor(CardList)
const cardListProvider = CardListFamily();

/// See also [CardList].
class CardListFamily extends Family<AsyncValue<List<TTICCardModel>>> {
  /// See also [CardList].
  const CardListFamily();

  /// See also [CardList].
  CardListProvider call(
    String lockMac,
  ) {
    return CardListProvider(
      lockMac,
    );
  }

  @override
  CardListProvider getProviderOverride(
    covariant CardListProvider provider,
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
  String? get name => r'cardListProvider';
}

/// See also [CardList].
class CardListProvider extends AutoDisposeAsyncNotifierProviderImpl<CardList,
    List<TTICCardModel>> {
  /// See also [CardList].
  CardListProvider(
    String lockMac,
  ) : this._internal(
          () => CardList()..lockMac = lockMac,
          from: cardListProvider,
          name: r'cardListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cardListHash,
          dependencies: CardListFamily._dependencies,
          allTransitiveDependencies: CardListFamily._allTransitiveDependencies,
          lockMac: lockMac,
        );

  CardListProvider._internal(
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
  FutureOr<List<TTICCardModel>> runNotifierBuild(
    covariant CardList notifier,
  ) {
    return notifier.build(
      lockMac,
    );
  }

  @override
  Override overrideWith(CardList Function() create) {
    return ProviderOverride(
      origin: this,
      override: CardListProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<CardList, List<TTICCardModel>>
      createElement() {
    return _CardListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CardListProvider && other.lockMac == lockMac;
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
mixin CardListRef on AutoDisposeAsyncNotifierProviderRef<List<TTICCardModel>> {
  /// The parameter `lockMac` of this provider.
  String get lockMac;
}

class _CardListProviderElement extends AutoDisposeAsyncNotifierProviderElement<
    CardList, List<TTICCardModel>> with CardListRef {
  _CardListProviderElement(super.provider);

  @override
  String get lockMac => (origin as CardListProvider).lockMac;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
