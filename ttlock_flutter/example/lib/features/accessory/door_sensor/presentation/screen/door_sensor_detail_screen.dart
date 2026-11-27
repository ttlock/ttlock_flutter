import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/provider/door_sensor_domain.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/door_sensor_args.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class DoorSensorDetailScreen extends ConsumerStatefulWidget {
  const DoorSensorDetailScreen({super.key, required this.args});
  final DoorSensorDetailArgs args;

  @override
  ConsumerState<DoorSensorDetailScreen> createState() =>
      _DoorSensorDetailScreenState();
}

class _DoorSensorDetailScreenState
    extends ConsumerState<DoorSensorDetailScreen> {
  late DoorSensorEntity _item;
  var _busy = false;

  @override
  void initState() {
    super.initState();
    _item = widget.args.item;
  }

  Future<void> _rename() async {
    final l10n = ref.read(l10nProvider);
    final controller = TextEditingController(text: _item.name);
    final name = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.rename),
        content: TextField(controller: controller, autofocus: true),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.commonCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, controller.text.trim()),
            child: Text(l10n.commonConfirm),
          ),
        ],
      ),
    );
    if (name == null || name.isEmpty || !mounted) return;
    setState(() => _busy = true);
    final r = await ref
        .read(doorSensorDomainProvider.notifier)
        .rename(_item.doorSensorId, name)
        .runWithLoading(status: l10n.loading);
    if (!mounted) return;
    setState(() => _busy = false);
    r.fold(
      (err) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
      ),
      (_) => setState(() => _item = _item.copyWith(name: name)),
    );
  }

  Future<void> _delete() async {
    final l10n = ref.read(l10nProvider);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.deleteDoorSensor),
        content: Text(l10n.deleteDoorSensorConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.commonCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.commonConfirm),
          ),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    setState(() => _busy = true);
    final r = await ref
        .read(doorSensorDomainProvider.notifier)
        .delete(lock: widget.args.lock, sensor: _item)
        .runWithLoading(status: l10n.loading);
    if (!mounted) return;
    r.fold((err) {
      setState(() => _busy = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
      );
    }, (_) => Navigator.of(context).pop(true));
  }

  /// 门未关报警：sheet 选择秒数 → 写回锁（BLE/网关）→ 本地回填 `doorNotClosedWarningTime`。
  Future<void> _setDoorNotClosedAlert() async {
    final l10n = ref.read(l10nProvider);
    final r = await LockDoorNotClosedAlertSheetRoute(
      $extra: widget.args.lock,
      initialSeconds: _item.doorNotClosedWarningTime,
    ).push<int>(context);
    if (r == null || !mounted) return;
    setState(() => _busy = true);
    final res = await ref
        .read(lockDomainProvider.notifier)
        .setDoorNotClosedAlert(widget.args.lock, r)
        .runWithLoading(status: l10n.loading);
    if (!mounted) return;
    setState(() => _busy = false);
    res.fold(
      (err) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
      ),
      (_) =>
          setState(() => _item = _item.copyWith(doorNotClosedWarningTime: r)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return Scaffold(
      key: const Key('door_sensor_detail'),
      appBar: AppBar(title: Text(l10n.doorSensor)),
      body: ListView(
        children: [
          ListTile(
            title: Text(l10n.doorSensorName),
            subtitle: Text(_item.name.isEmpty ? '—' : _item.name),
            trailing: IconButton(
              key: const Key('door_sensor_rename'),
              icon: const Icon(Icons.edit_outlined),
              onPressed: _busy ? null : _rename,
            ),
          ),
          ListTile(
            title: Text(l10n.remoteMac),
            subtitle: Text(_item.mac.isEmpty ? '—' : _item.mac),
          ),
          ListTile(
            title: Text(l10n.refreshBattery),
            subtitle: Text('${_item.electricQuantity}%'),
          ),
          ListTile(
            title: Text(l10n.doorNotClosedAlert),
            subtitle: Text(
              _item.doorNotClosedWarningTime > 0
                  ? '${_item.doorNotClosedWarningTime}s'
                  : l10n.doorSensorAlertHint,
            ),
            trailing: const Icon(Icons.chevron_right),
            enabled: !_busy,
            onTap: _busy ? null : _setDoorNotClosedAlert,
          ),
          ListTile(
            key: const Key('door_sensor_records_entry'),
            title: Text(l10n.records),
            trailing: const Icon(Icons.chevron_right),
            enabled: !_busy,
            onTap: _busy
                ? null
                : () => DoorSensorRecordsRoute(
                    lockId: widget.args.lock.lockId,
                  ).push(context),
          ),
          const Divider(),
          ListTile(
            key: const Key('door_sensor_delete'),
            enabled: !_busy,
            leading: Icon(
              Icons.delete_outline,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text(
              l10n.deleteDoorSensor,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            onTap: _busy ? null : _delete,
          ),
        ],
      ),
    );
  }
}
