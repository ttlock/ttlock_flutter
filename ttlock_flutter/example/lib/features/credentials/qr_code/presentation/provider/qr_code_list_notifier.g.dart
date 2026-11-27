// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QrCodeListNotifier)
const qrCodeListProvider = QrCodeListNotifierFamily._();

final class QrCodeListNotifierProvider
    extends $AsyncNotifierProvider<QrCodeListNotifier, QrCodeListState> {
  const QrCodeListNotifierProvider._({
    required QrCodeListNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'qrCodeListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$qrCodeListNotifierHash();

  @override
  String toString() {
    return r'qrCodeListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  QrCodeListNotifier create() => QrCodeListNotifier();

  @override
  bool operator ==(Object other) {
    return other is QrCodeListNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$qrCodeListNotifierHash() =>
    r'b86c48c6644573c46282e1a32669dcbc39c43ef8';

final class QrCodeListNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          QrCodeListNotifier,
          AsyncValue<QrCodeListState>,
          QrCodeListState,
          FutureOr<QrCodeListState>,
          int
        > {
  const QrCodeListNotifierFamily._()
    : super(
        retry: null,
        name: r'qrCodeListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  QrCodeListNotifierProvider call(int lockId) =>
      QrCodeListNotifierProvider._(argument: lockId, from: this);

  @override
  String toString() => r'qrCodeListProvider';
}

abstract class _$QrCodeListNotifier extends $AsyncNotifier<QrCodeListState> {
  late final _$args = ref.$arg as int;
  int get lockId => _$args;

  FutureOr<QrCodeListState> build(int lockId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<QrCodeListState>, QrCodeListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<QrCodeListState>, QrCodeListState>,
              AsyncValue<QrCodeListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
