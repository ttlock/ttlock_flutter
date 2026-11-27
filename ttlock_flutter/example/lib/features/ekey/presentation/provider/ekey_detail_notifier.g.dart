// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ekey_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EkeyDetailNotifier)
const ekeyDetailProvider = EkeyDetailNotifierFamily._();

final class EkeyDetailNotifierProvider
    extends $NotifierProvider<EkeyDetailNotifier, EkeyDetailState> {
  const EkeyDetailNotifierProvider._({
    required EkeyDetailNotifierFamily super.from,
    required EkeyDetailArgs super.argument,
  }) : super(
         retry: null,
         name: r'ekeyDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ekeyDetailNotifierHash();

  @override
  String toString() {
    return r'ekeyDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  EkeyDetailNotifier create() => EkeyDetailNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EkeyDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EkeyDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EkeyDetailNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ekeyDetailNotifierHash() =>
    r'688c12dadba4810984c93edb9a74ebc3924274a8';

final class EkeyDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          EkeyDetailNotifier,
          EkeyDetailState,
          EkeyDetailState,
          EkeyDetailState,
          EkeyDetailArgs
        > {
  const EkeyDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'ekeyDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  EkeyDetailNotifierProvider call(EkeyDetailArgs args) =>
      EkeyDetailNotifierProvider._(argument: args, from: this);

  @override
  String toString() => r'ekeyDetailProvider';
}

abstract class _$EkeyDetailNotifier extends $Notifier<EkeyDetailState> {
  late final _$args = ref.$arg as EkeyDetailArgs;
  EkeyDetailArgs get args => _$args;

  EkeyDetailState build(EkeyDetailArgs args);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<EkeyDetailState, EkeyDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EkeyDetailState, EkeyDetailState>,
              EkeyDetailState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
