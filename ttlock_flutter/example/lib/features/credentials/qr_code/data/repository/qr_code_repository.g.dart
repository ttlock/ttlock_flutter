// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QrCodeRepository)
const qrCodeRepositoryProvider = QrCodeRepositoryProvider._();

final class QrCodeRepositoryProvider
    extends $NotifierProvider<QrCodeRepository, void> {
  const QrCodeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'qrCodeRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$qrCodeRepositoryHash();

  @$internal
  @override
  QrCodeRepository create() => QrCodeRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$qrCodeRepositoryHash() => r'b41959c850cbbba747296d8d046670851e215147';

abstract class _$QrCodeRepository extends $Notifier<void> {
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
