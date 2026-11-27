// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passcode_add_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PasscodeAddNotifier)
const passcodeAddProvider = PasscodeAddNotifierFamily._();

final class PasscodeAddNotifierProvider
    extends $NotifierProvider<PasscodeAddNotifier, PasscodeAddState> {
  const PasscodeAddNotifierProvider._({
    required PasscodeAddNotifierFamily super.from,
    required LockEntity super.argument,
  }) : super(
         retry: null,
         name: r'passcodeAddProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$passcodeAddNotifierHash();

  @override
  String toString() {
    return r'passcodeAddProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PasscodeAddNotifier create() => PasscodeAddNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PasscodeAddState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PasscodeAddState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PasscodeAddNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$passcodeAddNotifierHash() =>
    r'c6185cd4e156cf1f5532dea01be45d06c08a2bd4';

final class PasscodeAddNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PasscodeAddNotifier,
          PasscodeAddState,
          PasscodeAddState,
          PasscodeAddState,
          LockEntity
        > {
  const PasscodeAddNotifierFamily._()
    : super(
        retry: null,
        name: r'passcodeAddProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PasscodeAddNotifierProvider call(LockEntity lock) =>
      PasscodeAddNotifierProvider._(argument: lock, from: this);

  @override
  String toString() => r'passcodeAddProvider';
}

abstract class _$PasscodeAddNotifier extends $Notifier<PasscodeAddState> {
  late final _$args = ref.$arg as LockEntity;
  LockEntity get lock => _$args;

  PasscodeAddState build(LockEntity lock);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<PasscodeAddState, PasscodeAddState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PasscodeAddState, PasscodeAddState>,
              PasscodeAddState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
