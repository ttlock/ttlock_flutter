// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CardDetailNotifier)
const cardDetailProvider = CardDetailNotifierFamily._();

final class CardDetailNotifierProvider
    extends $NotifierProvider<CardDetailNotifier, CardDetailState> {
  const CardDetailNotifierProvider._({
    required CardDetailNotifierFamily super.from,
    required CardDetailArgs super.argument,
  }) : super(
         retry: null,
         name: r'cardDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cardDetailNotifierHash();

  @override
  String toString() {
    return r'cardDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CardDetailNotifier create() => CardDetailNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CardDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CardDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CardDetailNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cardDetailNotifierHash() =>
    r'06649b243a0d023f37aa948257dd482490633755';

final class CardDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          CardDetailNotifier,
          CardDetailState,
          CardDetailState,
          CardDetailState,
          CardDetailArgs
        > {
  const CardDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'cardDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CardDetailNotifierProvider call(CardDetailArgs args) =>
      CardDetailNotifierProvider._(argument: args, from: this);

  @override
  String toString() => r'cardDetailProvider';
}

abstract class _$CardDetailNotifier extends $Notifier<CardDetailState> {
  late final _$args = ref.$arg as CardDetailArgs;
  CardDetailArgs get args => _$args;

  CardDetailState build(CardDetailArgs args);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<CardDetailState, CardDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CardDetailState, CardDetailState>,
              CardDetailState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
