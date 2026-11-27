// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FaceDetailNotifier)
const faceDetailProvider = FaceDetailNotifierFamily._();

final class FaceDetailNotifierProvider
    extends $NotifierProvider<FaceDetailNotifier, FaceDetailState> {
  const FaceDetailNotifierProvider._({
    required FaceDetailNotifierFamily super.from,
    required FaceDetailArgs super.argument,
  }) : super(
         retry: null,
         name: r'faceDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$faceDetailNotifierHash();

  @override
  String toString() {
    return r'faceDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FaceDetailNotifier create() => FaceDetailNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FaceDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FaceDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FaceDetailNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$faceDetailNotifierHash() =>
    r'2f17a49e4c32c54689eeda2f79555c2228819799';

final class FaceDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          FaceDetailNotifier,
          FaceDetailState,
          FaceDetailState,
          FaceDetailState,
          FaceDetailArgs
        > {
  const FaceDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'faceDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FaceDetailNotifierProvider call(FaceDetailArgs args) =>
      FaceDetailNotifierProvider._(argument: args, from: this);

  @override
  String toString() => r'faceDetailProvider';
}

abstract class _$FaceDetailNotifier extends $Notifier<FaceDetailState> {
  late final _$args = ref.$arg as FaceDetailArgs;
  FaceDetailArgs get args => _$args;

  FaceDetailState build(FaceDetailArgs args);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<FaceDetailState, FaceDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FaceDetailState, FaceDetailState>,
              FaceDetailState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
