// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passcode_get_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PasscodeGetNotifier)
const passcodeGetProvider = PasscodeGetNotifierFamily._();

final class PasscodeGetNotifierProvider
    extends $NotifierProvider<PasscodeGetNotifier, PasscodeGetState> {
  const PasscodeGetNotifierProvider._({
    required PasscodeGetNotifierFamily super.from,
    required LockEntity super.argument,
  }) : super(
         retry: null,
         name: r'passcodeGetProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$passcodeGetNotifierHash();

  @override
  String toString() {
    return r'passcodeGetProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PasscodeGetNotifier create() => PasscodeGetNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PasscodeGetState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PasscodeGetState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PasscodeGetNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$passcodeGetNotifierHash() =>
    r'0b1c984f16a68cc508be72463c286fa52e4f862b';

final class PasscodeGetNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PasscodeGetNotifier,
          PasscodeGetState,
          PasscodeGetState,
          PasscodeGetState,
          LockEntity
        > {
  const PasscodeGetNotifierFamily._()
    : super(
        retry: null,
        name: r'passcodeGetProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PasscodeGetNotifierProvider call(LockEntity lock) =>
      PasscodeGetNotifierProvider._(argument: lock, from: this);

  @override
  String toString() => r'passcodeGetProvider';
}

abstract class _$PasscodeGetNotifier extends $Notifier<PasscodeGetState> {
  late final _$args = ref.$arg as LockEntity;
  LockEntity get lock => _$args;

  PasscodeGetState build(LockEntity lock);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<PasscodeGetState, PasscodeGetState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PasscodeGetState, PasscodeGetState>,
              PasscodeGetState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
