// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palm_vein_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PalmVeinDetailNotifier)
const palmVeinDetailProvider = PalmVeinDetailNotifierFamily._();

final class PalmVeinDetailNotifierProvider
    extends $NotifierProvider<PalmVeinDetailNotifier, PalmVeinDetailState> {
  const PalmVeinDetailNotifierProvider._({
    required PalmVeinDetailNotifierFamily super.from,
    required PalmVeinDetailArgs super.argument,
  }) : super(
         retry: null,
         name: r'palmVeinDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$palmVeinDetailNotifierHash();

  @override
  String toString() {
    return r'palmVeinDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PalmVeinDetailNotifier create() => PalmVeinDetailNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PalmVeinDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PalmVeinDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PalmVeinDetailNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$palmVeinDetailNotifierHash() =>
    r'6ae8cf3d0130777353ee87a47ce63c5ea828259d';

final class PalmVeinDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PalmVeinDetailNotifier,
          PalmVeinDetailState,
          PalmVeinDetailState,
          PalmVeinDetailState,
          PalmVeinDetailArgs
        > {
  const PalmVeinDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'palmVeinDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PalmVeinDetailNotifierProvider call(PalmVeinDetailArgs args) =>
      PalmVeinDetailNotifierProvider._(argument: args, from: this);

  @override
  String toString() => r'palmVeinDetailProvider';
}

abstract class _$PalmVeinDetailNotifier extends $Notifier<PalmVeinDetailState> {
  late final _$args = ref.$arg as PalmVeinDetailArgs;
  PalmVeinDetailArgs get args => _$args;

  PalmVeinDetailState build(PalmVeinDetailArgs args);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<PalmVeinDetailState, PalmVeinDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PalmVeinDetailState, PalmVeinDetailState>,
              PalmVeinDetailState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
