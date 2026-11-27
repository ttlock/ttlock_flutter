// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_add_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CardAddNotifier)
const cardAddProvider = CardAddNotifierFamily._();

final class CardAddNotifierProvider
    extends $NotifierProvider<CardAddNotifier, CardAddState> {
  const CardAddNotifierProvider._({
    required CardAddNotifierFamily super.from,
    required CardAddArgs super.argument,
  }) : super(
         retry: null,
         name: r'cardAddProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cardAddNotifierHash();

  @override
  String toString() {
    return r'cardAddProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CardAddNotifier create() => CardAddNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CardAddState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CardAddState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CardAddNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cardAddNotifierHash() => r'9437f13592da2d77b3a3ad61f1aef08a737454d8';

final class CardAddNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          CardAddNotifier,
          CardAddState,
          CardAddState,
          CardAddState,
          CardAddArgs
        > {
  const CardAddNotifierFamily._()
    : super(
        retry: null,
        name: r'cardAddProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CardAddNotifierProvider call(CardAddArgs args) =>
      CardAddNotifierProvider._(argument: args, from: this);

  @override
  String toString() => r'cardAddProvider';
}

abstract class _$CardAddNotifier extends $Notifier<CardAddState> {
  late final _$args = ref.$arg as CardAddArgs;
  CardAddArgs get args => _$args;

  CardAddState build(CardAddArgs args);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<CardAddState, CardAddState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CardAddState, CardAddState>,
              CardAddState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
