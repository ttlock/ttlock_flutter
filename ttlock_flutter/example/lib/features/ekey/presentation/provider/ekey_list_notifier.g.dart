// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ekey_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EkeyListNotifier)
const ekeyListProvider = EkeyListNotifierFamily._();

final class EkeyListNotifierProvider
    extends $AsyncNotifierProvider<EkeyListNotifier, EkeyListState> {
  const EkeyListNotifierProvider._({
    required EkeyListNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'ekeyListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ekeyListNotifierHash();

  @override
  String toString() {
    return r'ekeyListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  EkeyListNotifier create() => EkeyListNotifier();

  @override
  bool operator ==(Object other) {
    return other is EkeyListNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ekeyListNotifierHash() => r'9de92485a66699dd97ec952b6027874ce2dd0712';

final class EkeyListNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          EkeyListNotifier,
          AsyncValue<EkeyListState>,
          EkeyListState,
          FutureOr<EkeyListState>,
          int
        > {
  const EkeyListNotifierFamily._()
    : super(
        retry: null,
        name: r'ekeyListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  EkeyListNotifierProvider call(int lockId) =>
      EkeyListNotifierProvider._(argument: lockId, from: this);

  @override
  String toString() => r'ekeyListProvider';
}

abstract class _$EkeyListNotifier extends $AsyncNotifier<EkeyListState> {
  late final _$args = ref.$arg as int;
  int get lockId => _$args;

  FutureOr<EkeyListState> build(int lockId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<EkeyListState>, EkeyListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<EkeyListState>, EkeyListState>,
              AsyncValue<EkeyListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
