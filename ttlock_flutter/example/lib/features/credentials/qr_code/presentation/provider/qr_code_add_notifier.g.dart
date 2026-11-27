// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_add_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QrCodeAddNotifier)
const qrCodeAddProvider = QrCodeAddNotifierFamily._();

final class QrCodeAddNotifierProvider
    extends $NotifierProvider<QrCodeAddNotifier, QrCodeAddState> {
  const QrCodeAddNotifierProvider._({
    required QrCodeAddNotifierFamily super.from,
    required LockEntity super.argument,
  }) : super(
         retry: null,
         name: r'qrCodeAddProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$qrCodeAddNotifierHash();

  @override
  String toString() {
    return r'qrCodeAddProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  QrCodeAddNotifier create() => QrCodeAddNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QrCodeAddState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QrCodeAddState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is QrCodeAddNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$qrCodeAddNotifierHash() => r'e585844a59869a96d90db53338b16bbb0ff5d80d';

final class QrCodeAddNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          QrCodeAddNotifier,
          QrCodeAddState,
          QrCodeAddState,
          QrCodeAddState,
          LockEntity
        > {
  const QrCodeAddNotifierFamily._()
    : super(
        retry: null,
        name: r'qrCodeAddProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  QrCodeAddNotifierProvider call(LockEntity lock) =>
      QrCodeAddNotifierProvider._(argument: lock, from: this);

  @override
  String toString() => r'qrCodeAddProvider';
}

abstract class _$QrCodeAddNotifier extends $Notifier<QrCodeAddState> {
  late final _$args = ref.$arg as LockEntity;
  LockEntity get lock => _$args;

  QrCodeAddState build(LockEntity lock);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<QrCodeAddState, QrCodeAddState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<QrCodeAddState, QrCodeAddState>,
              QrCodeAddState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
