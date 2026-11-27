import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/provider/wifi_lock_config_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/provider/wifi_lock_config_state.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/ip_address_field.dart';

/// 锁网络配置页：展示云端已配置信息、选择 WiFi、填写密码 / 静态 IP / DNS，
/// 提交后由 [WifiLockConfigNotifier] 下发到锁。
///
/// 初值由 FutureProvider 一次性载入；静态 IP / DNS UI 由 `supportsStaticIp` 控制。
class WifiLockConfigScreen extends HookConsumerWidget {
  const WifiLockConfigScreen({super.key, required this.lockId, this.lock});

  final int lockId;
  final LockEntity? lock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final lockEntity = lock ?? LockEntity(lockId: lockId);
    final provider = wifiLockConfigProvider(lockId, lockEntity);
    final stateAsync = ref.watch(provider);

    final allowPop = useState(false);

    return PopScope(
      canPop: allowPop.value,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        final hasExisting =
            stateAsync.value?.hasExistingWifi ?? false;
        if (hasExisting && context.canPop()) {
          allowPop.value = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) context.pop();
          });
        } else {
          LockDetailRoute(lockId: lockId, $extra: lockEntity).push(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.wifiConfig)),
        body: stateAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('$e')),
          data: (state) => _WifiLockConfigBody(
            lockId: lockId,
            lockEntity: lockEntity,
            state: state,
          ),
        ),
      ),
    );
  }
}

class _WifiLockConfigBody extends HookConsumerWidget {
  const _WifiLockConfigBody({
    required this.lockId,
    required this.lockEntity,
    required this.state,
  });

  final int lockId;
  final LockEntity lockEntity;
  final WifiLockConfigState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = wifiLockConfigProvider(lockId, lockEntity);
    final notifier = ref.read(provider.notifier);

    final passwordController = useTextEditingController();
    final staticIpController = useTextEditingController(
      text: state.configuredIp,
    );
    final subnetMaskController = useTextEditingController(
      text: state.configuredSubnetMask,
    );
    final defaultGatewayController = useTextEditingController(
      text: state.configuredDefaultGateway,
    );
    final preferredDnsController = useTextEditingController(
      text: state.configuredPreferredDns,
    );
    final alternateDnsController = useTextEditingController(
      text: state.configuredAlternateDns,
    );

    final advancedExpanded = useState(false);

    /// 静态 IP / 自定义 DNS 开关：null = 用户未改动，展示云端推导值。
    final staticIpOverride = useState<bool?>(null);
    final customDnsOverride = useState<bool?>(null);

    final useStaticIp =
        state.supportsStaticIp &&
        (staticIpOverride.value ?? state.configuredIp.isNotEmpty);
    final useCustomDns =
        state.supportsStaticIp &&
        (customDnsOverride.value ??
            (state.configuredPreferredDns.isNotEmpty ||
                state.configuredAlternateDns.isNotEmpty));

    /// 省电模式：null = 用户未改动，展示云端值。
    final powerSavingOverride = useState<bool?>(null);
    final configuredPowerSaving = state.configuredPowerSavingMode == 1;
    final powerSavingEnabled =
        powerSavingOverride.value ?? configuredPowerSaving;
    final powerSavingModeOn =
        powerSavingOverride.value != null &&
            powerSavingOverride.value != configuredPowerSaving
        ? powerSavingOverride.value
        : null;

    /// 本次会话刚提交成功：云端 MAC / 在线状态尚未回读，徽标不可信。
    final justProvisioned = useState(false);

    useEffect(() {
      if (lockEntity.lockData.isNotEmpty) {
        unawaited(notifier.scan(lockEntity));
      }
      return null;
    }, [lockEntity.lockData]);

    /// 空串视为合法（表示不填）。
    bool isValidIp(String value) {
      final trimmed = value.trim();
      if (trimmed.isEmpty) return true;
      if (!RegExp(r'^(\d{1,3}\.){3}\d{1,3}$').hasMatch(trimmed)) return false;
      return trimmed.split('.').every((part) {
        final segment = int.tryParse(part);
        return segment != null && segment >= 0 && segment <= 255;
      });
    }

    void showMessage(String message) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(message)));
    }

    String? trimmedOrNull(TextEditingController controller, bool enabled) {
      if (!enabled) return null;
      final value = controller.text.trim();
      return value.isEmpty ? null : value;
    }

    Future<void> onSubmit() async {
      if (lockEntity.lockData.isEmpty) {
        showMessage(l10n.missingLockDataCannotConfigWifi);
        return;
      }
      if (state.selectedSsid == null && !state.hasExistingWifi) {
        showMessage(l10n.pleaseSelectWifiNetwork);
        return;
      }
      if (state.needsPassword && passwordController.text.isEmpty) {
        showMessage(l10n.pleaseEnterWifiPasswordLabel);
        return;
      }
      if (useStaticIp) {
        if (!isValidIp(staticIpController.text)) {
          showMessage(l10n.staticIpAddressFormatIncorrect);
          return;
        }
        if (!isValidIp(subnetMaskController.text)) {
          showMessage(l10n.subnetMaskFormatIncorrect);
          return;
        }
        if (!isValidIp(defaultGatewayController.text)) {
          showMessage(l10n.defaultGatewayFormatIncorrect);
          return;
        }
      }
      if (useCustomDns) {
        if (!isValidIp(preferredDnsController.text)) {
          showMessage(l10n.preferredDnsFormatIncorrect);
          return;
        }
        if (!isValidIp(alternateDnsController.text)) {
          showMessage(l10n.alternateDnsFormatIncorrect);
          return;
        }
      }

      final hadExistingWifi = state.hasExistingWifi;
      final ok = await notifier.submit(
        lock: lockEntity,
        wifiPassword: state.needsPassword ? passwordController.text : '',
        staticIp: trimmedOrNull(staticIpController, useStaticIp),
        subnetMask: trimmedOrNull(subnetMaskController, useStaticIp),
        defaultGateway: trimmedOrNull(defaultGatewayController, useStaticIp),
        preferredDns: trimmedOrNull(preferredDnsController, useCustomDns),
        alternateDns: trimmedOrNull(alternateDnsController, useCustomDns),
        powerSavingModeOn: powerSavingModeOn,
      );
      if (!context.mounted) return;

      if (!ok) {
        final error = ref.read(provider).value?.error;
        showMessage(
          error == null
              ? l10n.errorUnknown
              : getUserFriendlyMessage(error, l10n),
        );
        return;
      }

      justProvisioned.value = true;
      showMessage(l10n.wifiConfigSuccess);
      if (hadExistingWifi && context.canPop()) {
        context.pop();
      } else {
        LockDetailRoute(lockId: lockId, $extra: lockEntity).go(context);
      }
    }

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final onlineKnown =
        state.configuredSsid.isNotEmpty && !justProvisioned.value;
    final loadError = state.loadError;

    return Column(
      children: [
        Expanded(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 20,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            l10n.wifiConfigHint,
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (loadError != null)
                    Container(
                      key: const Key('wifi_config_load_error'),
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colorScheme.errorContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 20,
                            color: colorScheme.onErrorContainer,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              getUserFriendlyMessage(loadError, l10n),
                              style: textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onErrorContainer,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  const Divider(height: 1),
                  ListTile(
                    key: const Key('wifi_config_current_network'),
                    leading: const Icon(Icons.wifi),
                    title: Text(l10n.currentNetwork),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          state.configuredSsid.isEmpty
                              ? l10n.notSelected
                              : state.configuredSsid,
                        ),
                        if (state.configuredWifiMac.isNotEmpty)
                          Text(
                            '${l10n.wifiMacLabel}: ${state.configuredWifiMac}',
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                      ],
                    ),
                    trailing: Container(
                      key: const Key('wifi_config_online_badge'),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color:
                            (onlineKnown
                                    ? (state.configuredOnline
                                          ? Colors.green
                                          : Colors.grey)
                                    : colorScheme.outline)
                                .withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 8,
                            color: onlineKnown
                                ? (state.configuredOnline
                                      ? Colors.green
                                      : Colors.grey)
                                : colorScheme.outline,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            onlineKnown
                                ? (state.configuredOnline
                                      ? l10n.online
                                      : l10n.offline)
                                : '—',
                            style: textTheme.labelSmall?.copyWith(
                              color: onlineKnown
                                  ? (state.configuredOnline
                                        ? Colors.green
                                        : Colors.grey)
                                  : colorScheme.outline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    key: const Key('wifi_config_network_row'),
                    leading: const Icon(Icons.wifi_find),
                    title: Text(l10n.wifiNetwork),
                    subtitle: Text(
                      state.selectedSsid ??
                          (state.configuredSsid.isEmpty
                              ? l10n.notSelected
                              : state.configuredSsid),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      if (lockEntity.lockData.isEmpty) {
                        showMessage(l10n.missingLockDataCannotScanWifi);
                        return;
                      }
                      LockWifiNetworkSheetRoute(
                        lockId: lockId,
                        $extra: lockEntity,
                      ).push(context);
                    },
                  ),
                  if (state.needsPassword)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                      child: TextField(
                        key: const Key('wifi_config_password'),
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: l10n.wifiPasswordLabel,
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.lock_outline),
                        ),
                      ),
                    ),
                  const Divider(height: 1),
                  SwitchListTile(
                    key: const Key('wifi_config_power_saving'),
                    title: Text(l10n.powerSavingMode),
                    value: powerSavingEnabled,
                    onChanged: (value) => powerSavingOverride.value = value,
                  ),
                  // 静态 IP / DNS 同属 configIP；能力位不支持时整块隐藏。
                  if (state.supportsStaticIp) ...[
                    const Divider(height: 1),
                    ListTile(
                      key: const Key('wifi_config_advanced_toggle'),
                      leading: const Icon(Icons.settings),
                      title: Text(l10n.advancedSettings),
                      subtitle: Text(l10n.staticIpConfigDnsConfig),
                      trailing: AnimatedRotation(
                        duration: const Duration(milliseconds: 200),
                        turns: advancedExpanded.value ? 0.5 : 0,
                        child: const Icon(Icons.expand_more),
                      ),
                      onTap: () =>
                          advancedExpanded.value = !advancedExpanded.value,
                    ),
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 200),
                      crossFadeState: advancedExpanded.value
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      firstChild: const SizedBox(width: double.infinity),
                      secondChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Divider(height: 1),
                          SwitchListTile(
                            key: const Key('wifi_config_use_static_ip'),
                            title: Text(l10n.useStaticIp),
                            value: useStaticIp,
                            onChanged: (value) =>
                                staticIpOverride.value = value,
                          ),
                          if (useStaticIp) ...[
                            _IpField(
                              fieldKey: const Key('wifi_config_static_ip'),
                              controller: staticIpController,
                              label: l10n.staticIpAddress,
                              hint: l10n.staticIpAddressExample,
                              icon: Icons.computer,
                            ),
                            _IpField(
                              fieldKey: const Key('wifi_config_subnet_mask'),
                              controller: subnetMaskController,
                              label: l10n.subnetMask,
                              hint: l10n.subnetMaskExample,
                              icon: Icons.network_check,
                            ),
                            _IpField(
                              fieldKey: const Key(
                                'wifi_config_default_gateway',
                              ),
                              controller: defaultGatewayController,
                              label: l10n.defaultGateway,
                              hint: l10n.defaultGatewayExample,
                              icon: Icons.router,
                              bottomPadding: 16,
                            ),
                          ],
                          const Divider(height: 1),
                          SwitchListTile(
                            key: const Key('wifi_config_use_custom_dns'),
                            title: Text(l10n.useCustomDns),
                            value: useCustomDns,
                            onChanged: (value) =>
                                customDnsOverride.value = value,
                          ),
                          if (useCustomDns) ...[
                            _IpField(
                              fieldKey: const Key('wifi_config_preferred_dns'),
                              controller: preferredDnsController,
                              label: l10n.preferredDns,
                              icon: Icons.dns,
                            ),
                            _IpField(
                              fieldKey: const Key('wifi_config_alternate_dns'),
                              controller: alternateDnsController,
                              label: l10n.alternateDnsOptional,
                              icon: Icons.dns,
                              bottomPadding: 16,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                key: const Key('wifi_config_submit'),
                onPressed: state.submitting ? null : onSubmit,
                child: state.submitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(
                        state.hasExistingWifi ? l10n.save : l10n.startConfig,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// 静态 IP / DNS 输入行（四分段，点号固定）。
class _IpField extends StatelessWidget {
  const _IpField({
    required this.fieldKey,
    required this.controller,
    required this.label,
    required this.icon,
    this.hint,
    this.bottomPadding = 8,
  });

  final Key fieldKey;
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final String? hint;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, bottomPadding),
      child: IpAddressField(
        key: fieldKey,
        controller: controller,
        label: label,
        hint: hint,
        prefixIcon: Icon(icon),
      ),
    );
  }
}
