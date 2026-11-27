// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FaceListNotifier)
const faceListProvider = FaceListNotifierFamily._();

final class FaceListNotifierProvider
    extends $AsyncNotifierProvider<FaceListNotifier, FaceListState> {
  const FaceListNotifierProvider._({
    required FaceListNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'faceListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$faceListNotifierHash();

  @override
  String toString() {
    return r'faceListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FaceListNotifier create() => FaceListNotifier();

  @override
  bool operator ==(Object other) {
    return other is FaceListNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$faceListNotifierHash() => r'26f0d586804e5f656c863b8b34fa4cd93b7ecd85';

final class FaceListNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          FaceListNotifier,
          AsyncValue<FaceListState>,
          FaceListState,
          FutureOr<FaceListState>,
          int
        > {
  const FaceListNotifierFamily._()
    : super(
        retry: null,
        name: r'faceListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FaceListNotifierProvider call(int lockId) =>
      FaceListNotifierProvider._(argument: lockId, from: this);

  @override
  String toString() => r'faceListProvider';
}

abstract class _$FaceListNotifier extends $AsyncNotifier<FaceListState> {
  late final _$args = ref.$arg as int;
  int get lockId => _$args;

  FutureOr<FaceListState> build(int lockId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<FaceListState>, FaceListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<FaceListState>, FaceListState>,
              AsyncValue<FaceListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
