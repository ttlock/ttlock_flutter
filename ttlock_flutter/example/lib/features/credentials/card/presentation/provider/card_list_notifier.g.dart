// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CardListNotifier)
const cardListProvider = CardListNotifierFamily._();

final class CardListNotifierProvider
    extends $AsyncNotifierProvider<CardListNotifier, CardListState> {
  const CardListNotifierProvider._({
    required CardListNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'cardListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cardListNotifierHash();

  @override
  String toString() {
    return r'cardListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CardListNotifier create() => CardListNotifier();

  @override
  bool operator ==(Object other) {
    return other is CardListNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cardListNotifierHash() => r'0970893201eb88206f7099f650530ac664bdf9ab';

final class CardListNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          CardListNotifier,
          AsyncValue<CardListState>,
          CardListState,
          FutureOr<CardListState>,
          int
        > {
  const CardListNotifierFamily._()
    : super(
        retry: null,
        name: r'cardListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CardListNotifierProvider call(int lockId) =>
      CardListNotifierProvider._(argument: lockId, from: this);

  @override
  String toString() => r'cardListProvider';
}

abstract class _$CardListNotifier extends $AsyncNotifier<CardListState> {
  late final _$args = ref.$arg as int;
  int get lockId => _$args;

  FutureOr<CardListState> build(int lockId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<CardListState>, CardListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CardListState>, CardListState>,
              AsyncValue<CardListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
