import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';

/// 锁信息页：展示 [LockEntity] 全部字段；「从锁刷新」拉取系统信息（型号/固件/NB 等）并保鲜。
///
/// Callers: LockInfoRoute（设置页 settings_lock_info 入口）。
/// 返回时 pop 当前 Entity，供 LockSettingsNotifier.applyLock 写回。
/// Schema: LockEntity + LockSystemInfoResult（modelNum/hardware/firmware/nb*）。
/// User: 移除设置页刷新项与详情 InfoCard，新增锁信息入口与从锁刷新。
class LockInfoScreen extends ConsumerStatefulWidget {
  const LockInfoScreen({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<LockInfoScreen> createState() => _LockInfoScreenState();
}

class _LockInfoScreenState extends ConsumerState<LockInfoScreen> {
  late LockEntity _lock;
  LockSystemInfoResult? _system;
  var _allowPop = false;

  @override
  void initState() {
    super.initState();
    _lock = widget.lock;
  }

  void _popWithLock() {
    if (_allowPop) {
      Navigator.of(context).pop(_lock);
      return;
    }
    setState(() => _allowPop = true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) Navigator.of(context).pop(_lock);
    });
  }

  Future<void> _refreshFromLock() async {
    if (_lock.lockData.isEmpty) return;
    final l10n = ref.read(l10nProvider);
    final r = await ref
        .read(lockDomainProvider.notifier)
        .refreshSystemInfo(_lock)
        .runWithLoading(status: l10n.loading);
    if (!mounted) return;
    r.fold(
      (err) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
      ),
      (info) => setState(() {
        _lock = info.lock;
        _system = info;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final canBle = _lock.lockData.isNotEmpty;
    final initText = _lock.initDate == null
        ? '—'
        : DateFormat('yyyy-MM-dd HH:mm:ss').format(_lock.initDate!.toLocal());

    return PopScope(
      canPop: _allowPop,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        _popWithLock();
      },
      child: Scaffold(
        key: const Key('lock_info_screen'),
        appBar: AppBar(title: Text(l10n.lockInfo)),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            FilledButton.icon(
              key: const Key('lock_info_refresh'),
              onPressed: canBle ? _refreshFromLock : null,
              icon: const Icon(Icons.sync),
              label: Text(l10n.refreshFromLock),
            ),
            if (!canBle) ...[
              const SizedBox(height: 12),
              Text(
                l10n.incompleteLockData,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ],
            const SizedBox(height: 16),
            _InfoTile(label: l10n.lockAliasLabel, value: _lock.lockAlias),
            _InfoTile(label: l10n.lockNameLabel, value: _lock.lockName),
            _InfoTile(label: l10n.lockIdLabel, value: '${_lock.lockId}'),
            _InfoTile(label: l10n.macLabel, value: _lock.lockMac),
            _InfoTile(
              label: l10n.battery,
              value: '${_lock.electricQuantity}%',
            ),
            _InfoTile(label: l10n.featureValueLabel, value: _lock.featureValue),
            _InfoTile(
              label: l10n.hasGatewayLabel,
              value: _lock.hasGateway ? l10n.gatewayOnline : l10n.offline,
            ),
            _InfoTile(label: l10n.groups, value: _lock.groupName),
            _InfoTile(label: l10n.initDateLabel, value: initText),
            if (_system != null) ...[
              const Divider(height: 32),
              Text(
                l10n.systemInfoSection,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              _InfoTile(label: l10n.modelNum, value: _system!.modelNum),
              _InfoTile(
                label: l10n.hardwareRevision,
                value: _system!.hardwareRevision,
              ),
              _InfoTile(
                label: l10n.firmwareRevision,
                value: _system!.firmwareRevision,
              ),
              if (_system!.nbOperator.isNotEmpty ||
                  _system!.nbNodeId.isNotEmpty ||
                  _system!.nbCardNumber.isNotEmpty ||
                  _system!.nbRssi.isNotEmpty) ...[
                _InfoTile(label: l10n.nbOperator, value: _system!.nbOperator),
                _InfoTile(label: l10n.nbNodeId, value: _system!.nbNodeId),
                _InfoTile(
                  label: l10n.nbCardNumber,
                  value: _system!.nbCardNumber,
                ),
                _InfoTile(label: l10n.nbRssi, value: _system!.nbRssi),
              ],
            ],
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(label),
      subtitle: Text(value.isEmpty ? '—' : value),
    );
  }
}
