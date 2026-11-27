// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_encoder_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CardEncoderRepository)
const cardEncoderRepositoryProvider = CardEncoderRepositoryProvider._();

final class CardEncoderRepositoryProvider
    extends $NotifierProvider<CardEncoderRepository, void> {
  const CardEncoderRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cardEncoderRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cardEncoderRepositoryHash();

  @$internal
  @override
  CardEncoderRepository create() => CardEncoderRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$cardEncoderRepositoryHash() =>
    r'1e904445dcad886bdd3d643922691043003bef45';

abstract class _$CardEncoderRepository extends $Notifier<void> {
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
