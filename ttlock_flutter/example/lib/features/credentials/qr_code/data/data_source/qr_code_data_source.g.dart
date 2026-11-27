// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(qrCodeApi)
const qrCodeApiProvider = QrCodeApiProvider._();

final class QrCodeApiProvider
    extends $FunctionalProvider<QrCodeApi, QrCodeApi, QrCodeApi>
    with $Provider<QrCodeApi> {
  const QrCodeApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'qrCodeApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$qrCodeApiHash();

  @$internal
  @override
  $ProviderElement<QrCodeApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QrCodeApi create(Ref ref) {
    return qrCodeApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QrCodeApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QrCodeApi>(value),
    );
  }
}

String _$qrCodeApiHash() => r'26827eb59f3047ad8c36c8c397b7ef03a1f0cb2f';

@ProviderFor(QrCodeDataSource)
const qrCodeDataSourceProvider = QrCodeDataSourceProvider._();

final class QrCodeDataSourceProvider
    extends $NotifierProvider<QrCodeDataSource, void> {
  const QrCodeDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'qrCodeDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$qrCodeDataSourceHash();

  @$internal
  @override
  QrCodeDataSource create() => QrCodeDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$qrCodeDataSourceHash() => r'e13ffa23f3e7c45dfdf69474accaed8b3962bb53';

abstract class _$QrCodeDataSource extends $Notifier<void> {
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
