// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LockRepository)
const lockRepositoryProvider = LockRepositoryProvider._();

final class LockRepositoryProvider
    extends $NotifierProvider<LockRepository, void> {
  const LockRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lockRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lockRepositoryHash();

  @$internal
  @override
  LockRepository create() => LockRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$lockRepositoryHash() => r'8a7037a710dc0a4fb291732d1bc3b4311a49b2b6';

abstract class _$LockRepository extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
