// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palm_vein_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PalmVeinListNotifier)
const palmVeinListProvider = PalmVeinListNotifierFamily._();

final class PalmVeinListNotifierProvider
    extends $AsyncNotifierProvider<PalmVeinListNotifier, PalmVeinListState> {
  const PalmVeinListNotifierProvider._({
    required PalmVeinListNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'palmVeinListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$palmVeinListNotifierHash();

  @override
  String toString() {
    return r'palmVeinListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PalmVeinListNotifier create() => PalmVeinListNotifier();

  @override
  bool operator ==(Object other) {
    return other is PalmVeinListNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$palmVeinListNotifierHash() =>
    r'8c1e1966113d17432b333aab25a2cc1b0fc3339b';

final class PalmVeinListNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PalmVeinListNotifier,
          AsyncValue<PalmVeinListState>,
          PalmVeinListState,
          FutureOr<PalmVeinListState>,
          int
        > {
  const PalmVeinListNotifierFamily._()
    : super(
        retry: null,
        name: r'palmVeinListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PalmVeinListNotifierProvider call(int lockId) =>
      PalmVeinListNotifierProvider._(argument: lockId, from: this);

  @override
  String toString() => r'palmVeinListProvider';
}

abstract class _$PalmVeinListNotifier
    extends $AsyncNotifier<PalmVeinListState> {
  late final _$args = ref.$arg as int;
  int get lockId => _$args;

  FutureOr<PalmVeinListState> build(int lockId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<PalmVeinListState>, PalmVeinListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PalmVeinListState>, PalmVeinListState>,
              AsyncValue<PalmVeinListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
