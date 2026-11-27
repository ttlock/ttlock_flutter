// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passcode_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PasscodeDetailNotifier)
const passcodeDetailProvider = PasscodeDetailNotifierFamily._();

final class PasscodeDetailNotifierProvider
    extends $NotifierProvider<PasscodeDetailNotifier, PasscodeDetailState> {
  const PasscodeDetailNotifierProvider._({
    required PasscodeDetailNotifierFamily super.from,
    required PasscodeDetailArgs super.argument,
  }) : super(
         retry: null,
         name: r'passcodeDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$passcodeDetailNotifierHash();

  @override
  String toString() {
    return r'passcodeDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PasscodeDetailNotifier create() => PasscodeDetailNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PasscodeDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PasscodeDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PasscodeDetailNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$passcodeDetailNotifierHash() =>
    r'96f15006b257c751c3c059bc6c42f670f49ba06e';

final class PasscodeDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PasscodeDetailNotifier,
          PasscodeDetailState,
          PasscodeDetailState,
          PasscodeDetailState,
          PasscodeDetailArgs
        > {
  const PasscodeDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'passcodeDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PasscodeDetailNotifierProvider call(PasscodeDetailArgs args) =>
      PasscodeDetailNotifierProvider._(argument: args, from: this);

  @override
  String toString() => r'passcodeDetailProvider';
}

abstract class _$PasscodeDetailNotifier extends $Notifier<PasscodeDetailState> {
  late final _$args = ref.$arg as PasscodeDetailArgs;
  PasscodeDetailArgs get args => _$args;

  PasscodeDetailState build(PasscodeDetailArgs args);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<PasscodeDetailState, PasscodeDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PasscodeDetailState, PasscodeDetailState>,
              PasscodeDetailState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
