import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';

/// 管理员密码页：进入读取并展示，提供修改。
class LockAdminPasscodeScreen extends ConsumerStatefulWidget {
  const LockAdminPasscodeScreen({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<LockAdminPasscodeScreen> createState() =>
      _LockAdminPasscodeScreenState();
}

class _LockAdminPasscodeScreenState
    extends ConsumerState<LockAdminPasscodeScreen> {
  final _controller = TextEditingController();
  String? _current;
  bool _loading = true;
  AppException? _error;
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    final r = await ref
        .read(lockDomainProvider.notifier)
        .getAdminPasscode(widget.lock)
        .runWithLoading(status: ref.read(l10nProvider).loading);
    if (!mounted) return;
    r.fold(
      (err) => setState(() {
        _loading = false;
        _error = err;
        _current = null;
      }),
      (pwd) => setState(() {
        _loading = false;
        _current = pwd;
        _controller.text = pwd;
      }),
    );
  }

  Future<void> _modify() async {
    final l10n = ref.read(l10nProvider);
    final next = _controller.text.trim();
    if (!RegExp(r'^\d{4,9}$').hasMatch(next)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.adminPasscodeHint)),
      );
      return;
    }
    final r = await ref
        .read(lockDomainProvider.notifier)
        .modifyAdminPasscode(widget.lock, next)
        .runWithLoading(status: l10n.loading);
    if (!mounted) return;
    r.fold(
      (err) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
      ),
      (pwd) {
        setState(() => _current = pwd);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.adminPasscodeModifySuccess)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return Scaffold(
      key: const Key('lock_admin_passcode_screen'),
      appBar: AppBar(title: Text(l10n.adminPasscode)),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (_error != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      getUserFriendlyMessage(_error!, l10n),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  )
                else
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(l10n.adminPasscodeCurrent),
                    subtitle: Text(_current ?? '—'),
                    trailing: IconButton(
                      key: const Key('admin_passcode_refresh'),
                      icon: const Icon(Icons.refresh),
                      onPressed: _load,
                    ),
                  ),
                const SizedBox(height: 16),
                TextField(
                  key: const Key('admin_passcode_field'),
                  controller: _controller,
                  obscureText: _obscure,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(9),
                  ],
                  decoration: InputDecoration(
                    labelText: l10n.adminPasscodeNew,
                    hintText: l10n.adminPasscodeHint,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                FilledButton(
                  key: const Key('admin_passcode_save'),
                  onPressed: _modify,
                  child: Text(l10n.adminPasscodeModify),
                ),
              ],
            ),
    );
  }
}
