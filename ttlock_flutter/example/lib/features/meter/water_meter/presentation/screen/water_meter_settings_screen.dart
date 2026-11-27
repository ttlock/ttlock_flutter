import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/widget/meter_info_section.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/widget/meter_ops_section.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_settings_notifier.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_settings_state.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

/// 设备设置页（spec §6.2）。
///
/// 分区顺序：操作 / 设备信息 / 4G 网络（仅 Cat.1）/ 固件升级。
/// 水表的位置由「总用量调整」承担（SDK 无 `setMaxPower`，spec §5.2）。
class WaterMeterSettingsScreen extends ConsumerWidget {
  const WaterMeterSettingsScreen({super.key, required this.meterId});

  final int meterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = waterMeterSettingsProvider(meterId);
    final state = ref.watch(provider);
    ref.listen(provider, (prev, next) {
      final err = next.value?.error;
      if (err != null && err != prev?.value?.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
        );
        ref.read(provider.notifier).clearError();
      }
    });

    final data = state.value;
    return Scaffold(
      key: const Key('water_meter_settings'),
      appBar: AppBar(title: Text(l10n.meterSettings)),
      body: data == null
          ? _placeholder(state, l10n)
          : RefreshIndicator(
              onRefresh: () => ref.refresh(provider.future),
              child: _content(context, ref, data, l10n),
            ),
    );
  }

  Widget _placeholder(
    AsyncValue<WaterMeterSettingsState> state,
    AppLocalizations l10n,
  ) {
    if (state.hasError) {
      final err = state.error;
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            getUserFriendlyMessage(
              err is AppException ? err : AppException.unknown(message: '$err'),
              l10n,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return const Center(child: CircularProgressIndicator());
  }

  Widget _content(
    BuildContext context,
    WidgetRef ref,
    WaterMeterSettingsState data,
    AppLocalizations l10n,
  ) {
    final item = data.item;
    final busy = data.operating;
    final notifier = ref.read(waterMeterSettingsProvider(meterId).notifier);

    return ListView(
      children: [
        // ---- 操作（显隐由本 feature 决定，spec §6.2）----
        MeterOpsSection(
          title: l10n.meterOps,
          items: [
            MeterOpsItem(
              itemKey: const Key('water_meter_settings_total_usage'),
              icon: Icons.water_drop_outlined,
              label: l10n.meterTotalUsageEdit,
              onTap: busy ? null : () => _totalUsage(context, item, notifier),
            ),
            if (data.canEditPrice)
              MeterOpsItem(
                itemKey: const Key('water_meter_settings_price'),
                icon: Icons.currency_yuan,
                label: l10n.waterMeterPriceEdit,
                onTap: busy
                    ? null
                    : () async {
                        final p = await WaterMeterPriceSheetRoute(
                          $extra: item,
                        ).push<double>(context);
                        if (p == null) return;
                        await notifier.setPrice(p);
                      },
              ),
            MeterOpsItem(
              itemKey: const Key('water_meter_settings_pay_mode'),
              icon: Icons.tune,
              label: l10n.meterPayModeEdit,
              onTap: busy
                  ? null
                  : () async {
                      final r = await WaterMeterPayModeSheetRoute(
                        $extra: item,
                      ).push<({MeterPayMode mode, double? price})>(context);
                      if (r == null) return;
                      await notifier.setPayMode(r.mode, price: r.price);
                    },
            ),
            if (data.canClear)
              MeterOpsItem(
                itemKey: const Key('water_meter_settings_clear'),
                icon: Icons.cleaning_services_outlined,
                label: l10n.meterClear,
                onTap: busy
                    ? null
                    : () async {
                        final ok = await const WaterMeterClearConfirmDialogRoute()
                            .push<bool>(context);
                        if (ok != true) return;
                        await notifier.clear();
                      },
              ),
            MeterOpsItem(
              itemKey: const Key('water_meter_settings_read'),
              icon: Icons.sync,
              label: l10n.meterReadData,
              onTap: busy ? null : () => notifier.readMeter(),
            ),
            MeterOpsItem(
              itemKey: const Key('water_meter_settings_set_remainder'),
              icon: Icons.edit_outlined,
              label: l10n.meterSetRemainder,
              onTap: busy
                  ? null
                  : () async {
                      final v = await WaterMeterRemainderSheetRoute(
                        $extra: item,
                      ).push<double>(context);
                      if (v == null) return;
                      await notifier.setRemainder(v);
                    },
            ),
            MeterOpsItem(
              itemKey: const Key('water_meter_settings_refresh_feature'),
              icon: Icons.fingerprint,
              label: l10n.meterRefreshFeatureValue,
              onTap: busy ? null : () => notifier.refreshFeatureValue(),
            ),
            MeterOpsItem(
              itemKey: const Key('water_meter_settings_reset'),
              icon: Icons.restart_alt,
              label: l10n.meterReset,
              onTap: busy
                  ? null
                  : () async {
                      final ok = await const WaterMeterResetConfirmDialogRoute()
                          .push<bool>(context);
                      if (ok != true) return;
                      await notifier.resetMeter();
                    },
            ),
          ],
        ),

        // ---- 设备信息 ----
        MeterInfoSection(
          title: l10n.meterInfo,
          rows: [
            (label: l10n.meterNumber, value: item.number),
            (label: l10n.meterMac, value: item.mac),
            (label: l10n.meterModelNum, value: item.modelNum),
            (label: l10n.meterHardwareRevision, value: item.hardwareRevision),
            (label: l10n.meterFirmwareRevision, value: item.firmwareRevision),
            (label: l10n.meterFeatureValue, value: item.featureValue),
            // 水表的 syncM3Date 是 String（电表侧是 DateTime?），直接展示。
            (label: l10n.meterSyncDate, value: item.syncM3Date),
            (label: l10n.meterGroupName, value: item.groupName),
          ],
        ),

        // ---- 4G 网络（仅 Cat.1，spec §5.3 / §6.3）----
        if (data.isCatOne)
          ListTile(
            key: const Key('water_meter_settings_cat_one'),
            leading: const Icon(Icons.sim_card_outlined),
            title: Text(l10n.meterCatOne),
            onTap: () => WaterMeterCatOneRoute(meterId: meterId).push(context),
          ),

        // ---- 固件升级（仅展示，spec §2 Out）----
        MeterInfoSection(
          title: l10n.meterFirmware,
          rows: data.firmware == null
              ? [
                  (label: l10n.meterFirmwareCurrent, value: ''),
                  (label: l10n.meterFirmwareLatest, value: ''),
                  (
                    label: l10n.meterFirmware,
                    value: l10n.meterFirmwareUnavailable,
                  ),
                ]
              : [
                  (
                    label: l10n.meterFirmwareCurrent,
                    value: data.firmware!.firmwareRevision,
                  ),
                  (
                    label: l10n.meterFirmwareLatest,
                    value: data.firmware!.version,
                  ),
                  (
                    label: l10n.meterFirmware,
                    value: data.firmware!.needUpgrade
                        ? l10n.meterFirmwareNeedUpgrade
                        : l10n.meterFirmwareUpToDate,
                  ),
                ],
        ),
      ],
    );
  }

  Future<void> _totalUsage(
    BuildContext context,
    WaterMeterEntity item,
    WaterMeterSettingsNotifier notifier,
  ) async {
    final v = await WaterMeterTotalUsageSheetRoute(
      $extra: item,
    ).push<double>(context);
    if (v == null) return;
    await notifier.setTotalUsage(v);
  }
}
