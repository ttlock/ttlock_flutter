import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/passcode_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/passcode_period.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/provider/passcode_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/screen/passcode_change_period_sheet.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class PasscodeDetailScreen extends ConsumerStatefulWidget {
  const PasscodeDetailScreen({super.key, required this.args});
  final PasscodeDetailArgs args;

  @override
  ConsumerState<PasscodeDetailScreen> createState() =>
      _PasscodeDetailScreenState();
}

class _PasscodeDetailScreenState extends ConsumerState<PasscodeDetailScreen> {
  late final TextEditingController _name;
  late final TextEditingController _pwd;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.args.pwd.keyboardPwdName);
    _pwd = TextEditingController(text: widget.args.pwd.keyboardPwd);
  }

  @override
  void dispose() {
    _name.dispose();
    _pwd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final provider = passcodeDetailProvider(widget.args);
    final state = ref.watch(provider);
    ref.listen(provider, (prev, next) {
      final err = next.error;
      if (err != null && err != prev?.error) {
        final msg = err.message == 'invalid_passcode'
            ? l10n.passcodeHint
            : getUserFriendlyMessage(err, l10n);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(msg)));
        ref.read(provider.notifier).clearError();
      }
    });
    final pwd = state.pwd;
    final operating = state.operating;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pwd.keyboardPwdName.isNotEmpty ? pwd.keyboardPwdName : l10n.passcode,
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(l10n.passcode),
            subtitle: Text(pwd.keyboardPwd.isEmpty ? '—' : pwd.keyboardPwd),
          ),
          ListTile(
            title: Text(l10n.passcodeName),
            subtitle: TextField(
              controller: _name,
              enabled: !operating,
              decoration: InputDecoration(hintText: l10n.nameHint),
            ),
          ),
          ListTile(
            title: Text(l10n.rename),
            leading: const Icon(Icons.drive_file_rename_outline),
            onTap: operating
                ? null
                : () => ref.read(provider.notifier).rename(_name.text),
          ),
          if (pwd.isCustom) ...[
            ListTile(
              title: Text(l10n.changePasscode),
              subtitle: TextField(
                controller: _pwd,
                enabled: !operating,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: l10n.passcodeHint),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.pin_outlined),
              title: Text(l10n.commonSave),
              onTap: operating
                  ? null
                  : () => ref.read(provider.notifier).changePassword(_pwd.text),
            ),
            ListTile(
              title: Text(l10n.validityPeriod),
              subtitle: Text(formatPasscodePeriod(pwd, l10n)),
              trailing: const Icon(Icons.edit_outlined),
              onTap: operating ? null : () => _changePeriod(context, ref, pwd),
            ),
          ] else
            ListTile(
              title: Text(l10n.validityPeriod),
              subtitle: Text(formatPasscodePeriod(pwd, l10n)),
            ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.delete_outline,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text(l10n.deleteConfirm),
            onTap: operating ? null : () => _confirmDelete(context, ref),
          ),
        ],
      ),
    );
  }

  Future<void> _changePeriod(
    BuildContext context,
    WidgetRef ref,
    KeyboardPwdEntity pwd,
  ) async {
    final result = await PasscodeChangePeriodSheetRoute(
      $extra: pwd,
    ).push<PasscodeChangePeriodResult>(context);
    if (result == null) return;
    await ref
        .read(passcodeDetailProvider(widget.args).notifier)
        .changePeriod(result.start, result.end);
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await const PasscodeDeleteConfirmSheetRoute().push<bool>(
      context,
    );
    if (confirmed != true) return;
    final ok = await ref
        .read(passcodeDetailProvider(widget.args).notifier)
        .delete();
    if (ok && context.mounted) {
      Navigator.of(context).pop(true);
    }
  }
}
