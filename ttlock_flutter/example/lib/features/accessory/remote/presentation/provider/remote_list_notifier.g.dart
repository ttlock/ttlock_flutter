// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RemoteListNotifier)
const remoteListProvider = RemoteListNotifierFamily._();

final class RemoteListNotifierProvider
    extends $AsyncNotifierProvider<RemoteListNotifier, RemoteListState> {
  const RemoteListNotifierProvider._({
    required RemoteListNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'remoteListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$remoteListNotifierHash();

  @override
  String toString() {
    return r'remoteListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RemoteListNotifier create() => RemoteListNotifier();

  @override
  bool operator ==(Object other) {
    return other is RemoteListNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$remoteListNotifierHash() =>
    r'b83ad0f04ec778ec6a7117885256f75c3da34c42';

final class RemoteListNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          RemoteListNotifier,
          AsyncValue<RemoteListState>,
          RemoteListState,
          FutureOr<RemoteListState>,
          int
        > {
  const RemoteListNotifierFamily._()
    : super(
        retry: null,
        name: r'remoteListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RemoteListNotifierProvider call(int lockId) =>
      RemoteListNotifierProvider._(argument: lockId, from: this);

  @override
  String toString() => r'remoteListProvider';
}

abstract class _$RemoteListNotifier extends $AsyncNotifier<RemoteListState> {
  late final _$args = ref.$arg as int;
  int get lockId => _$args;

  FutureOr<RemoteListState> build(int lockId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<RemoteListState>, RemoteListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<RemoteListState>, RemoteListState>,
              AsyncValue<RemoteListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
