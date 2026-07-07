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
import 'face_provider.dart';

class FaceAddPage extends HookConsumerWidget {
  const FaceAddPage({super.key, required this.lockMac});

  final String lockMac;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subRef = useRef<StreamSubscription<AddFaceEvent>?>(null);
    final validity = useState<CredentialValidity?>(null);
    final adding = useState(false);
    final message = useState('Look at the lock camera');

    useEffect(() {
      return () {
        subRef.value?.cancel();
      };
    }, const []);

    Future<void> start() async {
      final v = validity.value ?? await CredentialValiditySheet.show(context);
      if (v == null || !context.mounted) return;
      final range = validityToDateRange(v);

      validity.value = v;
      adding.value = true;
      message.value = 'Enrolling face…';

      subRef.value?.cancel();
      subRef.value = ref
          .read(faceListProvider(lockMac).notifier)
          .addFaceStream(lockMac, v)
          .listen(
        (event) {
          if (!context.mounted) return;
          switch (event.phase) {
            case TTAddFacePhase.canStartAdd:
              message.value = 'Follow lock instructions…';
            case TTAddFacePhase.collecting:
            case TTAddFacePhase.error:
              message.value = faceErrorMessage(event.errorCode);
            case TTAddFacePhase.success:
              final faceNumber = event.credentialNumber!;
              ref.read(faceListProvider(lockMac).notifier).addFace(
                    lockMac,
                    faceNumber: faceNumber,
                    startDate: range.startDate,
                    endDate: range.endDate,
                  );
              toastification.show(
                title: Text('Face added: $faceNumber'),
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
      appBar: AppBar(title: const Text('Add Face')),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text('Position your face as instructed by the lock.'),
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
          if (adding.value) AddProgressOverlay(message: message.value),
        ],
      ),
    );
  }
}
