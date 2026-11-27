// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ekey_send_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EkeySendNotifier)
const ekeySendProvider = EkeySendNotifierFamily._();

final class EkeySendNotifierProvider
    extends $NotifierProvider<EkeySendNotifier, EkeySendState> {
  const EkeySendNotifierProvider._({
    required EkeySendNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'ekeySendProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ekeySendNotifierHash();

  @override
  String toString() {
    return r'ekeySendProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  EkeySendNotifier create() => EkeySendNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EkeySendState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EkeySendState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EkeySendNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ekeySendNotifierHash() => r'57897484b7bd6edc8c31a0ef813b903436ab5924';

final class EkeySendNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          EkeySendNotifier,
          EkeySendState,
          EkeySendState,
          EkeySendState,
          int
        > {
  const EkeySendNotifierFamily._()
    : super(
        retry: null,
        name: r'ekeySendProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  EkeySendNotifierProvider call(int lockId) =>
      EkeySendNotifierProvider._(argument: lockId, from: this);

  @override
  String toString() => r'ekeySendProvider';
}

abstract class _$EkeySendNotifier extends $Notifier<EkeySendState> {
  late final _$args = ref.$arg as int;
  int get lockId => _$args;

  EkeySendState build(int lockId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<EkeySendState, EkeySendState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EkeySendState, EkeySendState>,
              EkeySendState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
