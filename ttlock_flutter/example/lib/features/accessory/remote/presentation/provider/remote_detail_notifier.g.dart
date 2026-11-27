// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RemoteDetailNotifier)
const remoteDetailProvider = RemoteDetailNotifierFamily._();

final class RemoteDetailNotifierProvider
    extends $NotifierProvider<RemoteDetailNotifier, RemoteDetailState> {
  const RemoteDetailNotifierProvider._({
    required RemoteDetailNotifierFamily super.from,
    required RemoteDetailArgs super.argument,
  }) : super(
         retry: null,
         name: r'remoteDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$remoteDetailNotifierHash();

  @override
  String toString() {
    return r'remoteDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RemoteDetailNotifier create() => RemoteDetailNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RemoteDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RemoteDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RemoteDetailNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$remoteDetailNotifierHash() =>
    r'3d571da0523624182b67d63759d50ca3b4f21eb1';

final class RemoteDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          RemoteDetailNotifier,
          RemoteDetailState,
          RemoteDetailState,
          RemoteDetailState,
          RemoteDetailArgs
        > {
  const RemoteDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'remoteDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RemoteDetailNotifierProvider call(RemoteDetailArgs args) =>
      RemoteDetailNotifierProvider._(argument: args, from: this);

  @override
  String toString() => r'remoteDetailProvider';
}

abstract class _$RemoteDetailNotifier extends $Notifier<RemoteDetailState> {
  late final _$args = ref.$arg as RemoteDetailArgs;
  RemoteDetailArgs get args => _$args;

  RemoteDetailState build(RemoteDetailArgs args);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<RemoteDetailState, RemoteDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RemoteDetailState, RemoteDetailState>,
              RemoteDetailState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
