// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Overridable handler for Open Platform auth-expiry codes (10004 / HTTP 401).
///
/// Default is a no-op; wire session clearing at the composition root
/// ([main]) via [openApiErrorHandlerProvider.overrideWithValue].

@ProviderFor(openApiErrorHandler)
const openApiErrorHandlerProvider = OpenApiErrorHandlerProvider._();

/// Overridable handler for Open Platform auth-expiry codes (10004 / HTTP 401).
///
/// Default is a no-op; wire session clearing at the composition root
/// ([main]) via [openApiErrorHandlerProvider.overrideWithValue].

final class OpenApiErrorHandlerProvider
    extends
        $FunctionalProvider<
          void Function(int code, String message, Ref ref),
          void Function(int code, String message, Ref ref),
          void Function(int code, String message, Ref ref)
        >
    with $Provider<void Function(int code, String message, Ref ref)> {
  /// Overridable handler for Open Platform auth-expiry codes (10004 / HTTP 401).
  ///
  /// Default is a no-op; wire session clearing at the composition root
  /// ([main]) via [openApiErrorHandlerProvider.overrideWithValue].
  const OpenApiErrorHandlerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'openApiErrorHandlerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$openApiErrorHandlerHash();

  @$internal
  @override
  $ProviderElement<void Function(int code, String message, Ref ref)>
  $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  void Function(int code, String message, Ref ref) create(Ref ref) {
    return openApiErrorHandler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    void Function(int code, String message, Ref ref) value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<void Function(int code, String message, Ref ref)>(
            value,
          ),
    );
  }
}

String _$openApiErrorHandlerHash() =>
    r'9c92f926d68407ef3148dd8e4198c75076c52e6b';

@ProviderFor(dio)
const dioProvider = DioProvider._();

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'6b6ff521bac71c02c28532be9da19f39afd7944d';
