import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:toastification/toastification.dart';

import '../model/credential_validity.dart';
import '../widgets/credential_validity_sheet.dart';
import 'passcode_provider.dart';

class PasscodeAddPage extends HookConsumerWidget {
  const PasscodeAddPage({super.key, required this.lockMac});

  final String lockMac;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passcodeCtrl = useTextEditingController(text: '123456');
    final validity = useState<CredentialValidity?>(null);

    Future<void> submit() async {
      final passcode = passcodeCtrl.text.trim();
      if (passcode.length < 4 || passcode.length > 9) {
        toastification.show(
          title: const Text('Passcode must be 4–9 digits'),
          type: ToastificationType.warning,
        );
        return;
      }
      final v = validity.value ?? await CredentialValiditySheet.show(context);
      if (v == null) return;

      try {
        context.loaderOverlay.show();
        await ref.read(passcodeListProvider(lockMac).notifier).createCustom(
              lockMac,
              passcode,
              v,
            );
        if (context.mounted) {
          context.loaderOverlay.hide();
          toastification.show(
            title: const Text('Passcode created'),
            type: ToastificationType.success,
          );
          Navigator.pop(context);
        }
      } catch (e) {
        if (context.mounted) {
          context.loaderOverlay.hide();
          toastification.show(title: Text('$e'), type: ToastificationType.error);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Add Passcode')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: passcodeCtrl,
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
              validity.value == null ? 'Tap to configure' : 'Configured',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              final v = await CredentialValiditySheet.show(
                context,
                initial: validity.value,
              );
              if (v != null) validity.value = v;
            },
          ),
          const SizedBox(height: 24),
          FilledButton(onPressed: submit, child: const Text('Create')),
        ],
      ),
    );
  }
}
