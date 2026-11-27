import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';

/// Open API：flag 1=开 0=关；count 失败次数（0=关，范围 0–50）；
/// lockTime 锁定秒数（0–900）；pwd/card/fingerprint 1/0。
const _countMin = 0;
const _countMax = 50;
const _lockTimeMin = 0;
const _lockTimeMax = 900;

class LockUnauthorizedAlertScreen extends ConsumerStatefulWidget {
  const LockUnauthorizedAlertScreen({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<LockUnauthorizedAlertScreen> createState() =>
      _LockUnauthorizedAlertScreenState();
}

class _LockUnauthorizedAlertScreenState
    extends ConsumerState<LockUnauthorizedAlertScreen> {
  bool _on = false;
  bool _pwd = false;
  bool _card = false;
  bool _fingerprint = false;
  bool _loading = true;
  bool _unknown = false;
  late final TextEditingController _countController;
  late final TextEditingController _lockTimeController;

  bool get _canWrite => widget.lock.hasGateway;

  @override
  void initState() {
    super.initState();
    _countController = TextEditingController(text: '5');
    _lockTimeController = TextEditingController(text: '60');
    _load();
  }

  @override
  void dispose() {
    _countController.dispose();
    _lockTimeController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final r = await ref
        .read(lockDomainProvider.notifier)
        .getUnauthorizedAttempt(widget.lock.lockId)
        .run();
    if (!mounted) return;

    r.fold(
      (_) => setState(() {
        _unknown = true;
        _loading = false;
      }),
      (e) => setState(() {
        _on = e.flag == 1;
        _pwd = e.pwd == 1;
        _card = e.card == 1;
        _fingerprint = e.fingerprint == 1;
        _countController.text = '${e.count}';
        _lockTimeController.text = '${e.lockTime}';
        _loading = false;
      }),
    );
  }

  void _save(AppLocalizations l10n) {
    if (!_canWrite) return;
    final count = int.tryParse(_countController.text.trim());
    if (count == null || count < _countMin || count > _countMax) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.unauthorizedAttemptInvalidCount)),
      );
      return;
    }
    final lockTime = int.tryParse(_lockTimeController.text.trim());
    if (lockTime == null ||
        lockTime < _lockTimeMin ||
        lockTime > _lockTimeMax) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.unauthorizedAttemptInvalidLockTime)),
      );
      return;
    }
    Navigator.of(context).pop(
      ExtraSettingEntity(
        flag: _on ? 1 : 0,
        count: count,
        lockTime: lockTime,
        pwd: _pwd ? 1 : 0,
        card: _card ? 1 : 0,
        fingerprint: _fingerprint ? 1 : 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final writable = _canWrite && !_unknown;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.unauthorizedAttempt)),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (_unknown)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(l10n.soundUnknown),
                  ),
                if (!_canWrite)
                  Padding(
                    key: const Key('unauthorized_attempt_needs_gateway'),
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(l10n.unauthorizedAttemptNeedsGateway),
                  ),
                SwitchListTile(
                  key: const Key('unauthorized_attempt_switch'),
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.unauthorizedAttempt),
                  value: _on,
                  onChanged: writable ? (v) => setState(() => _on = v) : null,
                ),
                TextField(
                  key: const Key('unauthorized_attempt_count'),
                  controller: _countController,
                  enabled: writable,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: l10n.unauthorizedAttemptCount,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  key: const Key('unauthorized_attempt_lock_time'),
                  controller: _lockTimeController,
                  enabled: writable,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: l10n.unauthorizedAttemptLockTime,
                    suffixText: l10n.secondsUnit,
                  ),
                ),
                SwitchListTile(
                  key: const Key('unauthorized_attempt_pwd'),
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.recordPasscode),
                  value: _pwd,
                  onChanged: writable ? (v) => setState(() => _pwd = v) : null,
                ),
                SwitchListTile(
                  key: const Key('unauthorized_attempt_card'),
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.recordCard),
                  value: _card,
                  onChanged: writable ? (v) => setState(() => _card = v) : null,
                ),
                SwitchListTile(
                  key: const Key('unauthorized_attempt_fingerprint'),
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.recordFingerprint),
                  value: _fingerprint,
                  onChanged: writable
                      ? (v) => setState(() => _fingerprint = v)
                      : null,
                ),
                if (_canWrite) ...[
                  const SizedBox(height: 16),
                  FilledButton(
                    key: const Key('unauthorized_attempt_save'),
                    onPressed: _unknown ? null : () => _save(l10n),
                    child: Text(l10n.commonSave),
                  ),
                ],
              ],
            ),
    );
  }
}
