import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/passcode_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/passcode_period.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/provider/passcode_list_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';

class PasscodeListScreen extends ConsumerStatefulWidget {
  const PasscodeListScreen({super.key, required this.lockId, this.lock});
  final int lockId;
  final LockEntity? lock;

  @override
  ConsumerState<PasscodeListScreen> createState() => _PasscodeListScreenState();
}

class _PasscodeListScreenState extends ConsumerState<PasscodeListScreen> {
  bool _showCustomAdd = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(_probeManage);
  }

  Future<void> _probeManage() async {
    final lock = widget.lock;
    if (lock == null || lock.lockData.isEmpty) return;
    try {
      final ok = await runBle(
        () => TTLock.lock.supportFunction(
          TTLockFunction.managePasscode,
          lock.lockData,
        ),
      );
      if (mounted) setState(() => _showCustomAdd = ok);
    } on Object {
      if (mounted) setState(() => _showCustomAdd = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final provider = passcodeListProvider(widget.lockId);
    final state = ref.watch(provider);
    final currentLock = widget.lock ?? LockEntity(lockId: widget.lockId);
    return Scaffold(
      key: const Key('passcode_list'),
      appBar: AppBar(
        title: Text(l10n.passcode),
        actions: [
          IconButton(
            tooltip: l10n.getPasscode,
            onPressed: () => _openGet(context, currentLock, provider),
            icon: const Icon(Icons.vpn_key_outlined),
          ),
          if (_showCustomAdd)
            IconButton(
              tooltip: l10n.customPasscode,
              onPressed: () => _openAdd(context, currentLock, provider),
              icon: const Icon(Icons.add),
            ),
        ],
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(
          child: Text(
            getUserFriendlyMessage(
              ExceptionUtils.extractAppException(e, st),
              l10n,
            ),
          ),
        ),
        data: (data) {
          if (data.items.isEmpty) {
            return Center(child: Text(l10n.noPasscodes));
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(provider.notifier).refresh(),
            child: NotificationListener<ScrollNotification>(
              onNotification: (n) {
                if (n.metrics.pixels >= n.metrics.maxScrollExtent - 64 &&
                    data.hasMore) {
                  ref.read(provider.notifier).loadMore();
                }
                return false;
              },
              child: ListView.builder(
                itemCount: data.items.length + (data.hasMore ? 1 : 0),
                itemBuilder: (context, i) {
                  if (i >= data.items.length) {
                    return const Padding(
                      padding: EdgeInsets.all(12),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  final item = data.items[i];
                  return _PasscodeTile(
                    pwd: item,
                    l10n: l10n,
                    onTap: () async {
                      await PasscodeDetailRoute(
                        $extra: PasscodeDetailArgs(
                          lock: currentLock,
                          pwd: item,
                        ),
                      ).push<bool>(context);
                      await ref.read(provider.notifier).refresh();
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _openGet(
    BuildContext context,
    LockEntity lock,
    PasscodeListNotifierProvider provider,
  ) async {
    final got = await PasscodeGetRoute($extra: lock).push<bool>(context);
    if (got == true) {
      await ref.read(provider.notifier).refresh();
    }
  }

  Future<void> _openAdd(
    BuildContext context,
    LockEntity lock,
    PasscodeListNotifierProvider provider,
  ) async {
    final added = await PasscodeAddRoute($extra: lock).push<bool>(context);
    if (added == true) {
      await ref.read(provider.notifier).refresh();
    }
  }
}

class _PasscodeTile extends StatelessWidget {
  const _PasscodeTile({
    required this.pwd,
    required this.l10n,
    required this.onTap,
  });
  final KeyboardPwdEntity pwd;
  final AppLocalizations l10n;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final title = pwd.keyboardPwdName.isNotEmpty
        ? pwd.keyboardPwdName
        : (pwd.keyboardPwd.isNotEmpty ? pwd.keyboardPwd : l10n.passcode);
    return ListTile(
      leading: const Icon(Icons.pin_outlined),
      title: Text(title),
      subtitle: Text(
        [
          formatPasscodeType(pwd.keyboardPwdType, l10n),
          formatPasscodePeriod(pwd, l10n),
        ].join('  '),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
