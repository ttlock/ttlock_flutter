import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/provider/electric_meter_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/provider/electric_meter_detail_state.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_recharge_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/widget/meter_labeled_value_tile.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/meter_quantity.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

/// 电表详情。
///
/// 只收 `meterId` —— **不复用列表的 entity**，每次进入都由 Notifier 重新请求
/// `detail`。内联记录列表已迁到独立记录页；「抄表」语义上移到设备设置页。
class ElectricMeterDetailScreen extends ConsumerWidget {
  const ElectricMeterDetailScreen({super.key, required this.meterId});

  final int meterId;

  String _title(ElectricMeterEntity? item, AppLocalizations l10n) {
    if (item == null) return l10n.electricMeterTitle;
    if (item.name.isNotEmpty) return item.name;
    if (item.number.isNotEmpty) return item.number;
    return l10n.electricMeterTitle;
  }

  Future<void> _recharge(
    BuildContext context,
    WidgetRef ref,
    ElectricMeterEntity item,
  ) async {
    final result = await ElectricMeterRechargeSheetRoute(
      $extra: item,
    ).push<ElectricMeterRechargeResult>(context);
    if (result == null || !context.mounted) return;
    await ref
        .read(electricMeterDetailProvider(meterId).notifier)
        .recharge(amount: result.amount, kwh: result.kwh);
  }

  Future<void> _rename(
    BuildContext context,
    WidgetRef ref,
    ElectricMeterEntity item,
  ) async {
    final name = await ElectricMeterRenameSheetRoute($extra: item).push<String>(
      context,
    );
    if (name == null || name.isEmpty || !context.mounted) return;
    await ref.read(electricMeterDetailProvider(meterId).notifier).rename(name);
  }

  Future<void> _delete(BuildContext context, WidgetRef ref) async {
    final item = ref.read(electricMeterDetailProvider(meterId)).value?.item;
    if (item == null) return;
    final confirmed = await ElectricMeterDeleteConfirmSheetRoute(
      $extra: item,
    ).push<bool>(context);
    if (confirmed != true || !context.mounted) return;
    final ok = await ref
        .read(electricMeterDetailProvider(meterId).notifier)
        .delete();
    if (ok && context.mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = electricMeterDetailProvider(meterId);
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
      key: const Key('electric_meter_detail'),
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
    AsyncValue<ElectricMeterDetailState> state,
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
    ElectricMeterDetailState data,
    AppLocalizations l10n,
  ) {
    final item = data.item;
    final notifier = ref.read(electricMeterDetailProvider(meterId).notifier);
    return ListView(
      children: [
        MeterLabeledValueTile(
          label: l10n.electricMeterTotal,
          // 云端 detail 的 totalKwh 是裸数字，单位由客户端补。
          value: meterQuantity(item.totalKwh, l10n.meterUnitKwh),
        ),
        MeterLabeledValueTile(
          label: l10n.electricMeterRemainder,
          value: meterQuantity(item.remainderKwh, l10n.meterUnitKwh),
        ),
        MeterLabeledValueTile(
          label: l10n.electricMeterPrice,
          value: meterQuantity(item.price, l10n.electricMeterPriceUnit),
        ),
        MeterLabeledValueTile(
          label: l10n.electricMeterMaxPower,
          value: meterQuantity(item.maxPower, l10n.meterUnitKw),
        ),
        const Divider(),
        SwitchListTile(
          key: const Key('electric_meter_power_switch'),
          title: Text(l10n.electricMeterPowerSwitch),
          value: item.onOff == MeterOnOff.on,
          onChanged: data.operating
              ? null
              : (v) => notifier.controlOnOff(on: v),
        ),
        if (data.canRecharge)
          ListTile(
            key: const Key('electric_meter_recharge'),
            leading: const Icon(Icons.currency_yuan),
            title: Text(l10n.electricMeterRecharge),
            onTap: data.operating ? null : () => _recharge(context, ref, item),
          ),
        const Divider(),
        // ---- 入口区（spec §6.1）----
        ListTile(
          key: const Key('electric_meter_settings_entry'),
          leading: const Icon(Icons.settings_outlined),
          title: Text(l10n.meterSettings),
          onTap: data.operating
              ? null
              : () => ElectricMeterSettingsRoute(meterId: meterId).push(
                  context,
                ),
        ),
        ListTile(
          key: const Key('electric_meter_operation_records_entry'),
          leading: const Icon(Icons.receipt_long_outlined),
          title: Text(l10n.meterOperationRecords),
          onTap: data.operating
              ? null
              : () => ElectricMeterOperationRecordsRoute(
                  meterId: meterId,
                ).push(context),
        ),
        ListTile(
          key: const Key('electric_meter_usage_records_entry'),
          leading: const Icon(Icons.bar_chart_outlined),
          title: Text(l10n.meterUsageRecordsElectric),
          onTap: data.operating
              ? null
              : () => ElectricMeterUsageRecordsRoute(
                  meterId: meterId,
                ).push(context),
        ),
        ListTile(
          key: const Key('electric_meter_rename'),
          leading: const Icon(Icons.drive_file_rename_outline),
          title: Text(l10n.electricMeterRename),
          onTap: data.operating ? null : () => _rename(context, ref, item),
        ),
        // 删除走**纯 BLE**（SDK 删除后自行通知服务器）—— 云端本无 delete 端点，
        // 原「电表不加删除入口」的红线只针对云端，故不适用。
        ListTile(
          key: const Key('electric_meter_delete'),
          leading: const Icon(Icons.delete_outline),
          title: Text(l10n.electricMeterDeleteConfirm),
          onTap: data.operating ? null : () => _delete(context, ref),
        ),
      ],
    );
  }
}
