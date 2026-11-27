// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passcode_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PasscodeListNotifier)
const passcodeListProvider = PasscodeListNotifierFamily._();

final class PasscodeListNotifierProvider
    extends $AsyncNotifierProvider<PasscodeListNotifier, PasscodeListState> {
  const PasscodeListNotifierProvider._({
    required PasscodeListNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'passcodeListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$passcodeListNotifierHash();

  @override
  String toString() {
    return r'passcodeListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PasscodeListNotifier create() => PasscodeListNotifier();

  @override
  bool operator ==(Object other) {
    return other is PasscodeListNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$passcodeListNotifierHash() =>
    r'7e1685adec4013f6008b9f409ef06cff96e0273c';

final class PasscodeListNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PasscodeListNotifier,
          AsyncValue<PasscodeListState>,
          PasscodeListState,
          FutureOr<PasscodeListState>,
          int
        > {
  const PasscodeListNotifierFamily._()
    : super(
        retry: null,
        name: r'passcodeListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PasscodeListNotifierProvider call(int lockId) =>
      PasscodeListNotifierProvider._(argument: lockId, from: this);

  @override
  String toString() => r'passcodeListProvider';
}

abstract class _$PasscodeListNotifier
    extends $AsyncNotifier<PasscodeListState> {
  late final _$args = ref.$arg as int;
  int get lockId => _$args;

  FutureOr<PasscodeListState> build(int lockId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<PasscodeListState>, PasscodeListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PasscodeListState>, PasscodeListState>,
              AsyncValue<PasscodeListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
