import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';

/// 锁时间页：进入读取并展示锁时间，提供「校准」用手机时间写入锁。
class LockTimeScreen extends ConsumerStatefulWidget {
  const LockTimeScreen({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<LockTimeScreen> createState() => _LockTimeScreenState();
}

class _LockTimeScreenState extends ConsumerState<LockTimeScreen> {
  DateTime? _lockTime;
  bool _loading = true;
  AppException? _error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    final r = await ref
        .read(lockDomainProvider.notifier)
        .getLockTime(widget.lock)
        .runWithLoading(status: ref.read(l10nProvider).loading);
    if (!mounted) return;
    r.fold(
      (err) => setState(() {
        _loading = false;
        _error = err;
        _lockTime = null;
      }),
      (ms) => setState(() {
        _loading = false;
        _lockTime = DateTime.fromMillisecondsSinceEpoch(ms);
      }),
    );
  }

  Future<void> _calibrate() async {
    final l10n = ref.read(l10nProvider);
    final r = await ref
        .read(lockDomainProvider.notifier)
        .syncLockDate(widget.lock)
        .runWithLoading(status: l10n.loading);
    if (!mounted) return;
    r.fold(
      (err) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
      ),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.lockTimeCalibrateSuccess)),
        );
        _load();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final fmt = DateFormat('yyyy-MM-dd HH:mm:ss');
    final timeText = _lockTime == null
        ? (_error != null
            ? getUserFriendlyMessage(_error!, l10n)
            : l10n.lockTimeUnknown)
        : fmt.format(_lockTime!);

    return Scaffold(
      key: const Key('lock_time_screen'),
      appBar: AppBar(title: Text(l10n.lockTime)),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.lockTimeCurrent),
                  subtitle: Text(timeText),
                  trailing: IconButton(
                    key: const Key('lock_time_refresh'),
                    icon: const Icon(Icons.refresh),
                    onPressed: _load,
                  ),
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  key: const Key('lock_time_calibrate'),
                  onPressed: _calibrate,
                  icon: const Icon(Icons.schedule),
                  label: Text(l10n.lockTimeCalibrate),
                ),
              ],
            ),
    );
  }
}
