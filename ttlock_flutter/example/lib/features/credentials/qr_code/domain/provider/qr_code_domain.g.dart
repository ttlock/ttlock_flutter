// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QrCodeDomain)
const qrCodeDomainProvider = QrCodeDomainProvider._();

final class QrCodeDomainProvider extends $NotifierProvider<QrCodeDomain, void> {
  const QrCodeDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'qrCodeDomainProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$qrCodeDomainHash();

  @$internal
  @override
  QrCodeDomain create() => QrCodeDomain();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$qrCodeDomainHash() => r'823995a514578af14c994473a7ad69bb7040b81b';

abstract class _$QrCodeDomain extends $Notifier<void> {
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
