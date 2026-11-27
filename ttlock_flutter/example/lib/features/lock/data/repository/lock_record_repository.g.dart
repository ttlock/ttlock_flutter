// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_record_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LockRecordRepository)
const lockRecordRepositoryProvider = LockRecordRepositoryProvider._();

final class LockRecordRepositoryProvider
    extends $NotifierProvider<LockRecordRepository, void> {
  const LockRecordRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lockRecordRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lockRecordRepositoryHash();

  @$internal
  @override
  LockRecordRepository create() => LockRecordRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$lockRecordRepositoryHash() =>
    r'c18db757ced0b5f5a006703fb265bb513fb9dd6f';

abstract class _$LockRecordRepository extends $Notifier<void> {
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
