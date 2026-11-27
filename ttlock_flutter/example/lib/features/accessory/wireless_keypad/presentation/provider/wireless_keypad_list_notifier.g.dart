// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wireless_keypad_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WirelessKeypadListNotifier)
const wirelessKeypadListProvider = WirelessKeypadListNotifierFamily._();

final class WirelessKeypadListNotifierProvider
    extends
        $AsyncNotifierProvider<
          WirelessKeypadListNotifier,
          List<WirelessKeypadEntity>
        > {
  const WirelessKeypadListNotifierProvider._({
    required WirelessKeypadListNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'wirelessKeypadListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$wirelessKeypadListNotifierHash();

  @override
  String toString() {
    return r'wirelessKeypadListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  WirelessKeypadListNotifier create() => WirelessKeypadListNotifier();

  @override
  bool operator ==(Object other) {
    return other is WirelessKeypadListNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$wirelessKeypadListNotifierHash() =>
    r'8898a3c51eb55eb88f1dcb99e713f0f579d5db44';

final class WirelessKeypadListNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          WirelessKeypadListNotifier,
          AsyncValue<List<WirelessKeypadEntity>>,
          List<WirelessKeypadEntity>,
          FutureOr<List<WirelessKeypadEntity>>,
          int
        > {
  const WirelessKeypadListNotifierFamily._()
    : super(
        retry: null,
        name: r'wirelessKeypadListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WirelessKeypadListNotifierProvider call(int lockId) =>
      WirelessKeypadListNotifierProvider._(argument: lockId, from: this);

  @override
  String toString() => r'wirelessKeypadListProvider';
}

abstract class _$WirelessKeypadListNotifier
    extends $AsyncNotifier<List<WirelessKeypadEntity>> {
  late final _$args = ref.$arg as int;
  int get lockId => _$args;

  FutureOr<List<WirelessKeypadEntity>> build(int lockId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<WirelessKeypadEntity>>,
              List<WirelessKeypadEntity>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<WirelessKeypadEntity>>,
                List<WirelessKeypadEntity>
              >,
              AsyncValue<List<WirelessKeypadEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
