import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

/// 蓝牙广播间隔页：进入时读取当前值，点击后弹出列表选择并写入。
class LockBluetoothAdvertisingIntervalScreen extends ConsumerStatefulWidget {
  const LockBluetoothAdvertisingIntervalScreen({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<LockBluetoothAdvertisingIntervalScreen> createState() =>
      _LockBluetoothAdvertisingIntervalScreenState();
}

class _LockBluetoothAdvertisingIntervalScreenState
    extends ConsumerState<LockBluetoothAdvertisingIntervalScreen> {
  static const _presets = [
    0.1,
    0.2,
    0.3,
    0.4,
    0.5,
    0.6,
    0.7,
    0.8,
    0.9,
    1.0,
  ];

  double? _interval;
  bool _loading = true;
  AppException? _error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  String _format(double seconds) => '${seconds.toStringAsFixed(1)}s';

  double _nearestPreset(double value) => _presets.reduce(
        (a, b) => (a - value).abs() <= (b - value).abs() ? a : b,
      );

  Future<void> _load() async {
    if (widget.lock.lockData.isEmpty) {
      if (mounted) {
        setState(() {
          _loading = false;
          _interval = null;
          _error = null;
        });
      }
      return;
    }
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final v = await withGlobalLoading(
        () => runBle(
          () => TTLock.lock.getBluetoothAdvertisingInterval(
            widget.lock.lockData,
          ),
        ),
        status: ref.read(l10nProvider).loading,
      );
      if (!mounted) return;
      setState(() {
        _loading = false;
        _interval = _nearestPreset(v);
      });
    } on AppException catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = e;
        _interval = null;
      });
    }
  }

  Future<void> _pickAndSet() async {
    final l10n = ref.read(l10nProvider);
    final selected = await showModalBottomSheet<double>(
      context: context,
      builder: (ctx) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                l10n.bluetoothAdvertisingIntervalPick,
                style: Theme.of(ctx).textTheme.titleMedium,
              ),
            ),
            for (final s in _presets)
              ListTile(
                key: Key('ble_adv_interval_$s'),
                title: Text(_format(s)),
                trailing: _interval == s ? const Icon(Icons.check) : null,
                onTap: () => Navigator.of(ctx).pop(s),
              ),
          ],
        ),
      ),
    );
    if (selected == null || !mounted) return;
    if (widget.lock.lockData.isEmpty) return;

    try {
      await withGlobalLoading(
        () => runBle(
          () => TTLock.lock.setBluetoothAdvertisingInterval(
            selected,
            widget.lock.lockData,
          ),
        ),
        status: l10n.loading,
      );
      if (!mounted) return;
      setState(() => _interval = selected);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.bluetoothAdvertisingIntervalSetSuccess)),
      );
    } on AppException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(getUserFriendlyMessage(e, l10n))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final valueText = _interval == null
        ? (_error != null
            ? getUserFriendlyMessage(_error!, l10n)
            : l10n.bluetoothAdvertisingIntervalUnknown)
        : _format(_interval!);

    return Scaffold(
      key: const Key('ble_adv_interval_screen'),
      appBar: AppBar(title: Text(l10n.bluetoothAdvertisingInterval)),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                ListTile(
                  key: const Key('ble_adv_interval_current'),
                  leading: const Icon(Icons.bluetooth_searching_outlined),
                  title: Text(l10n.bluetoothAdvertisingIntervalCurrent),
                  subtitle: Text(valueText),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: widget.lock.lockData.isEmpty ? null : _pickAndSet,
                ),
                if (widget.lock.lockData.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(l10n.incompleteLockData),
                  ),
              ],
            ),
    );
  }
}
