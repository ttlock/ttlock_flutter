// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_encoder_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// cardEncoder 域编排（纯云端）。
///
/// 两接口是**收费功能**且要求账号已创建酒店；失败时返回 `Left(-29)`，
/// 页面据此给出「需已创建酒店」的说明文案。

@ProviderFor(CardEncoderDomain)
const cardEncoderDomainProvider = CardEncoderDomainProvider._();

/// cardEncoder 域编排（纯云端）。
///
/// 两接口是**收费功能**且要求账号已创建酒店；失败时返回 `Left(-29)`，
/// 页面据此给出「需已创建酒店」的说明文案。
final class CardEncoderDomainProvider
    extends $NotifierProvider<CardEncoderDomain, void> {
  /// cardEncoder 域编排（纯云端）。
  ///
  /// 两接口是**收费功能**且要求账号已创建酒店；失败时返回 `Left(-29)`，
  /// 页面据此给出「需已创建酒店」的说明文案。
  const CardEncoderDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cardEncoderDomainProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cardEncoderDomainHash();

  @$internal
  @override
  CardEncoderDomain create() => CardEncoderDomain();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$cardEncoderDomainHash() => r'aa1857c84c43b9433643a2478991264bc79e7cf6';

/// cardEncoder 域编排（纯云端）。
///
/// 两接口是**收费功能**且要求账号已创建酒店；失败时返回 `Left(-29)`，
/// 页面据此给出「需已创建酒店」的说明文案。

abstract class _$CardEncoderDomain extends $Notifier<void> {
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
