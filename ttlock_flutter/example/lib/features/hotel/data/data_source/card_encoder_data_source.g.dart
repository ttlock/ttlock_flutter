// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_encoder_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cardEncoderApi)
const cardEncoderApiProvider = CardEncoderApiProvider._();

final class CardEncoderApiProvider
    extends $FunctionalProvider<CardEncoderApi, CardEncoderApi, CardEncoderApi>
    with $Provider<CardEncoderApi> {
  const CardEncoderApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cardEncoderApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cardEncoderApiHash();

  @$internal
  @override
  $ProviderElement<CardEncoderApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CardEncoderApi create(Ref ref) {
    return cardEncoderApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CardEncoderApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CardEncoderApi>(value),
    );
  }
}

String _$cardEncoderApiHash() => r'46a8dee8320fffcac891b07ba969f28829ab58e5';

@ProviderFor(CardEncoderDataSource)
const cardEncoderDataSourceProvider = CardEncoderDataSourceProvider._();

final class CardEncoderDataSourceProvider
    extends $NotifierProvider<CardEncoderDataSource, void> {
  const CardEncoderDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cardEncoderDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cardEncoderDataSourceHash();

  @$internal
  @override
  CardEncoderDataSource create() => CardEncoderDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$cardEncoderDataSourceHash() =>
    r'ee6dd01601c0db19b700744994586703affb021a';

abstract class _$CardEncoderDataSource extends $Notifier<void> {
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
