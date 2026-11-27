// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keypad_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 键盘详情页状态（family 参数复用既有的 [WirelessKeypadDetailArgs]）。
///
/// 页面本身只渲染，业务全在这里——包括解绑的两步编排与「云端未同步」标志。

@ProviderFor(KeypadDetailNotifier)
const keypadDetailProvider = KeypadDetailNotifierFamily._();

/// 键盘详情页状态（family 参数复用既有的 [WirelessKeypadDetailArgs]）。
///
/// 页面本身只渲染，业务全在这里——包括解绑的两步编排与「云端未同步」标志。
final class KeypadDetailNotifierProvider
    extends $AsyncNotifierProvider<KeypadDetailNotifier, KeypadDetailState> {
  /// 键盘详情页状态（family 参数复用既有的 [WirelessKeypadDetailArgs]）。
  ///
  /// 页面本身只渲染，业务全在这里——包括解绑的两步编排与「云端未同步」标志。
  const KeypadDetailNotifierProvider._({
    required KeypadDetailNotifierFamily super.from,
    required WirelessKeypadDetailArgs super.argument,
  }) : super(
         retry: null,
         name: r'keypadDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$keypadDetailNotifierHash();

  @override
  String toString() {
    return r'keypadDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  KeypadDetailNotifier create() => KeypadDetailNotifier();

  @override
  bool operator ==(Object other) {
    return other is KeypadDetailNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$keypadDetailNotifierHash() =>
    r'fef62fc14fce5682e41c43b855e3a12e7252f309';

/// 键盘详情页状态（family 参数复用既有的 [WirelessKeypadDetailArgs]）。
///
/// 页面本身只渲染，业务全在这里——包括解绑的两步编排与「云端未同步」标志。

final class KeypadDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          KeypadDetailNotifier,
          AsyncValue<KeypadDetailState>,
          KeypadDetailState,
          FutureOr<KeypadDetailState>,
          WirelessKeypadDetailArgs
        > {
  const KeypadDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'keypadDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 键盘详情页状态（family 参数复用既有的 [WirelessKeypadDetailArgs]）。
  ///
  /// 页面本身只渲染，业务全在这里——包括解绑的两步编排与「云端未同步」标志。

  KeypadDetailNotifierProvider call(WirelessKeypadDetailArgs args) =>
      KeypadDetailNotifierProvider._(argument: args, from: this);

  @override
  String toString() => r'keypadDetailProvider';
}

/// 键盘详情页状态（family 参数复用既有的 [WirelessKeypadDetailArgs]）。
///
/// 页面本身只渲染，业务全在这里——包括解绑的两步编排与「云端未同步」标志。

abstract class _$KeypadDetailNotifier
    extends $AsyncNotifier<KeypadDetailState> {
  late final _$args = ref.$arg as WirelessKeypadDetailArgs;
  WirelessKeypadDetailArgs get args => _$args;

  FutureOr<KeypadDetailState> build(WirelessKeypadDetailArgs args);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<KeypadDetailState>, KeypadDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<KeypadDetailState>, KeypadDetailState>,
              AsyncValue<KeypadDetailState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
