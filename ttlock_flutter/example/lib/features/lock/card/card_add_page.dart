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
import 'card_provider.dart';

class CardAddPage extends HookConsumerWidget {
  const CardAddPage({super.key, required this.lockMac});

  final String lockMac;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subRef = useRef<StreamSubscription<AddCardEvent>?>(null);
    final validity = useState<CredentialValidity?>(null);
    final adding = useState(false);
    final message = useState('Place card near the lock');

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
      message.value = 'Place card near the lock…';

      final range = validityToDateRange(v);
      subRef.value?.cancel();
      subRef.value = ref
          .read(cardListProvider(lockMac).notifier)
          .addCardStream(lockMac, v)
          .listen(
        (event) async {
          if (!context.mounted) return;
          switch (event.phase) {
            case TTAddCardPhase.waiting:
              message.value = 'Reading card…';
            case TTAddCardPhase.success:
              final cardNumber = event.credentialNumber!;
              await ref.read(cardListProvider(lockMac).notifier).onCardAdded(
                    lockMac,
                    cardNumber,
                    range.startDate,
                    range.endDate,
                  );
              toastification.show(
                title: Text('Card added: $cardNumber'),
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
      appBar: AppBar(title: const Text('Add Card')),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'Configure validity, then start adding. Hold the card on the lock reader.',
              ),
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
                child: Text(adding.value ? 'Adding…' : 'Start'),
              ),
            ],
          ),
          if (adding.value)
            AddProgressOverlay(message: message.value),
        ],
      ),
    );
  }
}
