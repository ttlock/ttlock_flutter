import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:toastification/toastification.dart';

import '../model/credential_validity.dart';
import '../widgets/credential_validity_sheet.dart';
import 'passcode_provider.dart';

class PasscodeAddPage extends ConsumerStatefulWidget {
  const PasscodeAddPage({super.key, required this.lockMac});

  final String lockMac;

  @override
  ConsumerState<PasscodeAddPage> createState() => _PasscodeAddPageState();
}

class _PasscodeAddPageState extends ConsumerState<PasscodeAddPage> {
  final _passcodeCtrl = TextEditingController(text: '123456');
  CredentialValidity? _validity;

  @override
  void dispose() {
    _passcodeCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final passcode = _passcodeCtrl.text.trim();
    if (passcode.length < 4 || passcode.length > 9) {
      toastification.show(
        title: const Text('Passcode must be 4–9 digits'),
        type: ToastificationType.warning,
      );
      return;
    }
    final validity = _validity ?? await CredentialValiditySheet.show(context);
    if (validity == null) return;

    try {
      context.loaderOverlay.show();
      await ref.read(passcodeListProvider(widget.lockMac).notifier).createCustom(
            widget.lockMac,
            passcode,
            validity,
          );
      if (mounted) {
        context.loaderOverlay.hide();
        toastification.show(
          title: const Text('Passcode created'),
          type: ToastificationType.success,
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        context.loaderOverlay.hide();
        toastification.show(title: Text('$e'), type: ToastificationType.error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Passcode')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _passcodeCtrl,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Custom passcode',
              hintText: '4–9 digits',
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Validity'),
            subtitle: Text(
              _validity == null ? 'Tap to configure' : 'Configured',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              final v = await CredentialValiditySheet.show(
                context,
                initial: _validity,
              );
              if (v != null) setState(() => _validity = v);
            },
          ),
          const SizedBox(height: 24),
          FilledButton(onPressed: _submit, child: const Text('Create')),
        ],
      ),
    );
  }
}
