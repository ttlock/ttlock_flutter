// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_add_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RemoteAddNotifier)
const remoteAddProvider = RemoteAddNotifierFamily._();

final class RemoteAddNotifierProvider
    extends $NotifierProvider<RemoteAddNotifier, RemoteAddState> {
  const RemoteAddNotifierProvider._({
    required RemoteAddNotifierFamily super.from,
    required LockEntity super.argument,
  }) : super(
         retry: null,
         name: r'remoteAddProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$remoteAddNotifierHash();

  @override
  String toString() {
    return r'remoteAddProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RemoteAddNotifier create() => RemoteAddNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RemoteAddState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RemoteAddState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RemoteAddNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$remoteAddNotifierHash() => r'25842486f4ee3e0dd5113eea9d15d014346b479e';

final class RemoteAddNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          RemoteAddNotifier,
          RemoteAddState,
          RemoteAddState,
          RemoteAddState,
          LockEntity
        > {
  const RemoteAddNotifierFamily._()
    : super(
        retry: null,
        name: r'remoteAddProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RemoteAddNotifierProvider call(LockEntity lock) =>
      RemoteAddNotifierProvider._(argument: lock, from: this);

  @override
  String toString() => r'remoteAddProvider';
}

abstract class _$RemoteAddNotifier extends $Notifier<RemoteAddState> {
  late final _$args = ref.$arg as LockEntity;
  LockEntity get lock => _$args;

  RemoteAddState build(LockEntity lock);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<RemoteAddState, RemoteAddState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RemoteAddState, RemoteAddState>,
              RemoteAddState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
