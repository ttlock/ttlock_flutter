// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LockListNotifier)
const lockListProvider = LockListNotifierProvider._();

final class LockListNotifierProvider
    extends $AsyncNotifierProvider<LockListNotifier, LockListState> {
  const LockListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lockListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lockListNotifierHash();

  @$internal
  @override
  LockListNotifier create() => LockListNotifier();
}

String _$lockListNotifierHash() => r'3b00d9d9a0d14780a20a09eaecb55cfdae052352';

abstract class _$LockListNotifier extends $AsyncNotifier<LockListState> {
  FutureOr<LockListState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<LockListState>, LockListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LockListState>, LockListState>,
              AsyncValue<LockListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
