import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/widget/meter_labeled_value_tile.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/meter_quantity.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_detail_state.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_recharge_sheet.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

/// 水表详情。
///
/// 只收 `meterId` —— **不复用列表的 entity**，每次进入都由 Notifier 重新请求
/// `detail`。内联记录列表已迁到独立记录页；「抄表」语义上移到设备设置页。
class WaterMeterDetailScreen extends ConsumerWidget {
  const WaterMeterDetailScreen({super.key, required this.meterId});

  final int meterId;

  String _title(WaterMeterEntity? item, AppLocalizations l10n) {
    if (item == null) return l10n.waterMeterTitle;
    if (item.name.isNotEmpty) return item.name;
    if (item.number.isNotEmpty) return item.number;
    return l10n.waterMeterTitle;
  }

  Future<void> _recharge(
    BuildContext context,
    WidgetRef ref,
    WaterMeterEntity item,
  ) async {
    final result = await WaterMeterRechargeSheetRoute(
      $extra: item,
    ).push<WaterMeterRechargeResult>(context);
    if (result == null || !context.mounted) return;
    await ref
        .read(waterMeterDetailProvider(meterId).notifier)
        .recharge(amount: result.amount, m3: result.m3);
  }

  Future<void> _rename(
    BuildContext context,
    WidgetRef ref,
    WaterMeterEntity item,
  ) async {
    final name = await WaterMeterRenameSheetRoute($extra: item).push<String>(
      context,
    );
    if (name == null || name.isEmpty || !context.mounted) return;
    await ref.read(waterMeterDetailProvider(meterId).notifier).rename(name);
  }

  Future<void> _delete(BuildContext context, WidgetRef ref) async {
    final item = ref.read(waterMeterDetailProvider(meterId)).value?.item;
    if (item == null) return;
    final confirmed = await WaterMeterDeleteConfirmSheetRoute(
      $extra: item,
    ).push<bool>(context);
    if (confirmed != true || !context.mounted) return;
    final ok = await ref
        .read(waterMeterDetailProvider(meterId).notifier)
        .delete();
    if (ok && context.mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = waterMeterDetailProvider(meterId);
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

    // 用旧值兜底渲染：写操作刚成功时的重拉不该把界面退化成 spinner。
    final data = state.value;

    return Scaffold(
      key: const Key('water_meter_detail'),
      appBar: AppBar(title: Text(_title(data?.item, l10n))),
      body: data == null
          ? _placeholder(state, l10n)
          : RefreshIndicator(
              onRefresh: () => ref.refresh(provider.future),
              child: _content(context, ref, data, l10n),
            ),
    );
  }

  Widget _placeholder(
    AsyncValue<WaterMeterDetailState> state,
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
    WaterMeterDetailState data,
    AppLocalizations l10n,
  ) {
    final item = data.item;
    final notifier = ref.read(waterMeterDetailProvider(meterId).notifier);
    return ListView(
      children: [
        MeterLabeledValueTile(
          label: l10n.waterMeterTotal,
          // 云端 detail 的 totalM3 是裸数字，单位由客户端补。
          value: meterQuantity(item.totalM3, l10n.meterUnitTon),
        ),
        MeterLabeledValueTile(
          label: l10n.waterMeterRemainder,
          value: meterQuantity(item.remainderM3, l10n.meterUnitTon),
        ),
        MeterLabeledValueTile(
          label: l10n.waterMeterPrice,
          value: meterQuantity(item.price, l10n.waterMeterPriceUnit),
        ),
        const Divider(),
        SwitchListTile(
          key: const Key('water_meter_power_switch'),
          title: Text(l10n.waterMeterPowerSwitch),
          value: item.onOff == MeterOnOff.on,
          onChanged: data.operating
              ? null
              : (v) => notifier.controlOnOff(on: v),
        ),
        if (data.canRecharge)
          ListTile(
            key: const Key('water_meter_recharge'),
            leading: const Icon(Icons.currency_yuan),
            title: Text(l10n.waterMeterRecharge),
            onTap: data.operating ? null : () => _recharge(context, ref, item),
          ),
        const Divider(),
        // ---- 入口区（spec §6.1）----
        ListTile(
          key: const Key('water_meter_settings_entry'),
          leading: const Icon(Icons.settings_outlined),
          title: Text(l10n.meterSettings),
          onTap: data.operating
              ? null
              : () => WaterMeterSettingsRoute(meterId: meterId).push(context),
        ),
        ListTile(
          key: const Key('water_meter_operation_records_entry'),
          leading: const Icon(Icons.receipt_long_outlined),
          title: Text(l10n.meterOperationRecords),
          onTap: data.operating
              ? null
              : () => WaterMeterOperationRecordsRoute(
                  meterId: meterId,
                ).push(context),
        ),
        ListTile(
          key: const Key('water_meter_usage_records_entry'),
          leading: const Icon(Icons.bar_chart_outlined),
          title: Text(l10n.meterUsageRecordsWater),
          onTap: data.operating
              ? null
              : () => WaterMeterUsageRecordsRoute(
                  meterId: meterId,
                ).push(context),
        ),
        ListTile(
          key: const Key('water_meter_rename'),
          leading: const Icon(Icons.drive_file_rename_outline),
          title: Text(l10n.waterMeterRename),
          onTap: data.operating ? null : () => _rename(context, ref, item),
        ),
        // 删除走**纯 BLE**（SDK 删除后自行通知服务器），不调云端接口。
        ListTile(
          key: const Key('water_meter_delete'),
          leading: const Icon(Icons.delete_outline),
          title: Text(l10n.waterMeterDeleteConfirm),
          onTap: data.operating ? null : () => _delete(context, ref),
        ),
      ],
    );
  }
}
