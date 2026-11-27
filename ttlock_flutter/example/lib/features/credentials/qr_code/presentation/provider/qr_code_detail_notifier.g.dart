// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QrCodeDetailNotifier)
const qrCodeDetailProvider = QrCodeDetailNotifierFamily._();

final class QrCodeDetailNotifierProvider
    extends $NotifierProvider<QrCodeDetailNotifier, QrCodeDetailState> {
  const QrCodeDetailNotifierProvider._({
    required QrCodeDetailNotifierFamily super.from,
    required QrCodeDetailArgs super.argument,
  }) : super(
         retry: null,
         name: r'qrCodeDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$qrCodeDetailNotifierHash();

  @override
  String toString() {
    return r'qrCodeDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  QrCodeDetailNotifier create() => QrCodeDetailNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QrCodeDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QrCodeDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is QrCodeDetailNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$qrCodeDetailNotifierHash() =>
    r'1265aee5a30dc186a4e6515d7418e9087cfa2676';

final class QrCodeDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          QrCodeDetailNotifier,
          QrCodeDetailState,
          QrCodeDetailState,
          QrCodeDetailState,
          QrCodeDetailArgs
        > {
  const QrCodeDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'qrCodeDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  QrCodeDetailNotifierProvider call(QrCodeDetailArgs args) =>
      QrCodeDetailNotifierProvider._(argument: args, from: this);

  @override
  String toString() => r'qrCodeDetailProvider';
}

abstract class _$QrCodeDetailNotifier extends $Notifier<QrCodeDetailState> {
  late final _$args = ref.$arg as QrCodeDetailArgs;
  QrCodeDetailArgs get args => _$args;

  QrCodeDetailState build(QrCodeDetailArgs args);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<QrCodeDetailState, QrCodeDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<QrCodeDetailState, QrCodeDetailState>,
              QrCodeDetailState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
