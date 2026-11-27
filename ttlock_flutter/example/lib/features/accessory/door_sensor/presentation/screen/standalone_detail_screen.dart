import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/provider/standalone_door_sensor_domain.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/provider/standalone_list_notifier.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/standalone_door_sensor_args.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class StandaloneDoorSensorDetailScreen extends ConsumerStatefulWidget {
  const StandaloneDoorSensorDetailScreen({super.key, required this.args});

  final StandaloneDoorSensorDetailArgs args;

  @override
  ConsumerState<StandaloneDoorSensorDetailScreen> createState() =>
      _StandaloneDoorSensorDetailScreenState();
}

class _StandaloneDoorSensorDetailScreenState
    extends ConsumerState<StandaloneDoorSensorDetailScreen> {
  late StandaloneDoorSensorEntity _item;

  @override
  void initState() {
    super.initState();
    _item = widget.args.item;
  }

  void _showError(Object error) {
    final l10n = ref.read(l10nProvider);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          getUserFriendlyMessage(
            ExceptionUtils.extractAppException(error, StackTrace.current),
            l10n,
          ),
        ),
      ),
    );
  }

  Future<void> _rename() async {
    final name = await StandaloneDoorSensorRenameSheetRoute(
      $extra: _item,
    ).push<String>(context);
    if (name == null || name.isEmpty || !mounted) return;
    final r = await ref
        .read(standaloneDoorSensorDomainProvider.notifier)
        .rename(_item.doorSensorId, name)
        .runWithLoading(status: ref.read(l10nProvider).loading);
    if (!mounted) return;
    r.fold(_showError, (_) {
      ref.invalidate(standaloneDoorSensorListProvider);
      setState(() => _item = _item.copyWith(name: name));
    });
  }

  Future<void> _delete() async {
    final confirmed = await StandaloneDoorSensorDeleteConfirmSheetRoute(
      $extra: _item,
    ).push<bool>(context);
    if (confirmed != true || !mounted) return;
    final r = await ref
        .read(standaloneDoorSensorDomainProvider.notifier)
        .delete(_item.doorSensorId)
        .runWithLoading(status: ref.read(l10nProvider).loading);
    if (!mounted) return;
    r.fold(_showError, (_) {
      ref.invalidate(standaloneDoorSensorListProvider);
      Navigator.of(context).pop(true);
    });
  }

  Future<void> _alertConfig() async {
    await StandaloneDoorSensorAlertConfigSheetRoute(
      $extra: _item,
    ).push(context);
  }

  Future<void> _wifiConfig() async {
    final l10n = ref.read(l10nProvider);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        key: const Key('standalone_wifi_repower_confirm'),
        content: Text(l10n.standaloneDoorWifiRepowerHint),
        actions: [
          TextButton(
            key: const Key('standalone_wifi_repower_cancel'),
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            key: const Key('standalone_wifi_repower_continue'),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(l10n.commonConfirm),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    final wifiName = await StandaloneDoorSensorWifiConfigSheetRoute(
      $extra: _item,
    ).push<String>(context);
    if (wifiName == null || wifiName.isEmpty || !mounted) return;
    ref.invalidate(standaloneDoorSensorListProvider);
    setState(() => _item = _item.copyWith(wifiName: wifiName));
  }

  Future<void> _users() async {
    await StandaloneDoorSensorUserSheetRoute($extra: _item).push(context);
  }

  String _stateLabel(String state) {
    final l10n = ref.read(l10nProvider);
    return switch (state) {
      'closed' => l10n.standaloneDoorClosed,
      'open' => l10n.standaloneDoorOpen,
      _ => l10n.standaloneDoorUnknown,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final theme = Theme.of(context);
    return Scaffold(
      key: const Key('standalone_detail'),
      appBar: AppBar(title: Text(_item.name.isEmpty ? _item.mac : _item.name)),
      body: ListView(
        children: [
          ListTile(
            title: Text(l10n.standaloneDoorDeviceName),
            subtitle: Text(_item.name.isEmpty ? '—' : _item.name),
          ),
          ListTile(
            title: Text(l10n.macLabel),
            subtitle: Text(_item.mac.isEmpty ? '—' : _item.mac),
          ),
          ListTile(
            title: Text(l10n.battery),
            subtitle: Text('${_item.electricQuantity}%'),
          ),
          ListTile(
            title: Text(l10n.standaloneDoorState),
            subtitle: Text(_stateLabel(_item.doorSensorState.name)),
          ),
          ListTile(
            title: Text(l10n.standaloneDoorWifiName),
            subtitle: Text(_item.wifiName.isEmpty ? '—' : _item.wifiName),
          ),
          ListTile(
            title: Text(l10n.standaloneDoorWifiMac),
            subtitle: Text(_item.wifiMac.isEmpty ? '—' : _item.wifiMac),
          ),
          ListTile(
            title: Text(l10n.standaloneDoorFeatureValue),
            subtitle: Text(
              _item.featureValue.isEmpty ? '—' : _item.featureValue,
            ),
          ),
          ListTile(
            title: Text(l10n.standaloneDoorFirmware),
            subtitle: Text(
              _item.firmwareRevision.isEmpty ? '—' : _item.firmwareRevision,
            ),
          ),
          ListTile(
            title: Text(l10n.standaloneDoorNumber),
            subtitle: Text(
              _item.doorSensorNumber.isEmpty ? '—' : _item.doorSensorNumber,
            ),
          ),
          const Divider(),
          ListTile(
            key: const Key('standalone_door_sensor_records_entry'),
            leading: const Icon(Icons.receipt_long_outlined),
            title: Text(l10n.records),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => StandaloneDoorSensorRecordsRoute(
              doorSensorId: _item.doorSensorId,
            ).push(context),
          ),
          ListTile(
            key: const Key('standalone_rename'),
            leading: const Icon(Icons.drive_file_rename_outline),
            title: Text(l10n.standaloneDoorRename),
            onTap: _rename,
          ),
          ListTile(
            key: const Key('standalone_alert'),
            leading: const Icon(Icons.notifications_outlined),
            title: Text(l10n.standaloneDoorAlertConfig),
            onTap: _alertConfig,
          ),
          ListTile(
            key: const Key('standalone_wifi'),
            leading: const Icon(Icons.wifi_outlined),
            title: Text(l10n.standaloneDoorWifiConfig),
            onTap: _wifiConfig,
          ),
          ListTile(
            key: const Key('standalone_users'),
            leading: const Icon(Icons.people_outline),
            title: Text(l10n.standaloneDoorUserManage),
            onTap: _users,
          ),
          ListTile(
            key: const Key('standalone_delete'),
            leading: Icon(Icons.delete_outline, color: theme.colorScheme.error),
            title: Text(
              l10n.standaloneDoorDeleteConfirm,
              style: TextStyle(color: theme.colorScheme.error),
            ),
            onTap: _delete,
          ),
        ],
      ),
    );
  }
}
