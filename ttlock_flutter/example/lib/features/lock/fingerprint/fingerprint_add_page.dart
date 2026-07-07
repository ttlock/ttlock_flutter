import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../model/credential_params.dart';
import '../model/credential_validity.dart';
import '../widgets/add_progress_overlay.dart';
import '../widgets/credential_validity_sheet.dart';
import 'fingerprint_provider.dart';

class FingerprintAddPage extends HookConsumerWidget {
  const FingerprintAddPage({super.key, required this.lockMac});

  final String lockMac;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subRef = useRef<StreamSubscription<AddFingerprintEvent>?>(null);
    final validity = useState<CredentialValidity?>(null);
    final adding = useState(false);
    final message = useState('Place finger on sensor');
    final progress = useState<double?>(null);

    useEffect(() {
      return () {
        subRef.value?.cancel();
      };
    }, const []);

    Future<void> start() async {
      final v = validity.value ?? await CredentialValiditySheet.show(context);
      if (v == null || !context.mounted) return;
      validity.value = v;
      adding.value = true;
      message.value = 'Enrolling fingerprint…';

      final range = validityToDateRange(v);
      subRef.value?.cancel();
      subRef.value = ref
          .read(fingerprintListProvider(lockMac).notifier)
          .addFingerprintStream(lockMac, v)
          .listen(
        (event) async {
          if (!context.mounted) return;
          switch (event.phase) {
            case TTAddFingerprintPhase.waiting:
            case TTAddFingerprintPhase.collecting:
              final total = event.totalCount ?? 1;
              final current = event.currentCount ?? 0;
              message.value = 'Scan $current / $total';
              progress.value = event.collectionProgress;
            case TTAddFingerprintPhase.success:
              final fingerprintNumber = event.credentialNumber!;
              await ref
                  .read(fingerprintListProvider(lockMac).notifier)
                  .onFingerprintAdded(
                    lockMac,
                    fingerprintNumber,
                    range.startDate,
                    range.endDate,
                  );
              toastification.show(
                title: Text('Fingerprint added: $fingerprintNumber'),
                type: ToastificationType.success,
              );
              Navigator.pop(context);
          }
        },
        onError: (e) {
          if (!context.mounted) return;
          adding.value = false;
          toastification.show(title: Text('$e'), type: ToastificationType.error);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Add Fingerprint')),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text('Follow lock prompts and lift/place finger as requested.'),
              const SizedBox(height: 16),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Validity'),
                subtitle: Text(validity.value == null ? 'Not set' : 'Configured'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () async {
                  final v = await CredentialValiditySheet.show(
                    context,
                    initial: validity.value,
                  );
                  if (v != null) validity.value = v;
                },
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: adding.value ? null : start,
                child: Text(adding.value ? 'Enrolling…' : 'Start'),
              ),
            ],
          ),
          if (adding.value)
            AddProgressOverlay(message: message.value, progress: progress.value),
        ],
      ),
    );
  }
}
