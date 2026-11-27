// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 运行时权限服务：扫锁 / 近场 BLE 前统一申请蓝牙（及 Android 定位）权限。

@ProviderFor(PermissionService)
const permissionServiceProvider = PermissionServiceProvider._();

/// 运行时权限服务：扫锁 / 近场 BLE 前统一申请蓝牙（及 Android 定位）权限。
final class PermissionServiceProvider
    extends $NotifierProvider<PermissionService, void> {
  /// 运行时权限服务：扫锁 / 近场 BLE 前统一申请蓝牙（及 Android 定位）权限。
  const PermissionServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'permissionServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$permissionServiceHash();

  @$internal
  @override
  PermissionService create() => PermissionService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$permissionServiceHash() => r'af29009f04cc251548edf4bc8d4d46c73428776b';

/// 运行时权限服务：扫锁 / 近场 BLE 前统一申请蓝牙（及 Android 定位）权限。

abstract class _$PermissionService extends $Notifier<void> {
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
