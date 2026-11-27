// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_photo_add_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FacePhotoAddNotifier)
const facePhotoAddProvider = FacePhotoAddNotifierFamily._();

final class FacePhotoAddNotifierProvider
    extends $NotifierProvider<FacePhotoAddNotifier, FacePhotoAddState> {
  const FacePhotoAddNotifierProvider._({
    required FacePhotoAddNotifierFamily super.from,
    required LockEntity super.argument,
  }) : super(
         retry: null,
         name: r'facePhotoAddProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$facePhotoAddNotifierHash();

  @override
  String toString() {
    return r'facePhotoAddProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FacePhotoAddNotifier create() => FacePhotoAddNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FacePhotoAddState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FacePhotoAddState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FacePhotoAddNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$facePhotoAddNotifierHash() =>
    r'ab582846a4b498d47fd528c28f45c328abc1e4be';

final class FacePhotoAddNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          FacePhotoAddNotifier,
          FacePhotoAddState,
          FacePhotoAddState,
          FacePhotoAddState,
          LockEntity
        > {
  const FacePhotoAddNotifierFamily._()
    : super(
        retry: null,
        name: r'facePhotoAddProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FacePhotoAddNotifierProvider call(LockEntity lock) =>
      FacePhotoAddNotifierProvider._(argument: lock, from: this);

  @override
  String toString() => r'facePhotoAddProvider';
}

abstract class _$FacePhotoAddNotifier extends $Notifier<FacePhotoAddState> {
  late final _$args = ref.$arg as LockEntity;
  LockEntity get lock => _$args;

  FacePhotoAddState build(LockEntity lock);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<FacePhotoAddState, FacePhotoAddState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FacePhotoAddState, FacePhotoAddState>,
              FacePhotoAddState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
