import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../widgets/add_progress_overlay.dart';
import 'palm_vein_provider.dart';

class PalmVeinAddPage extends HookConsumerWidget {
  const PalmVeinAddPage({super.key, required this.lockMac});

  final String lockMac;

  Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PalmVeinAddPage(lockMac: lockMac),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subRef = useRef<StreamSubscription<AddPalmVeinEvent>?>(null);
    final adding = useState(false);
    final message = useState('Place your palm near the lock…');

    useEffect(() {
      return () {
        subRef.value?.cancel();
      };
    }, const []);

    Future<void> start() async {
      adding.value = true;
      message.value = 'Enrolling palm vein…';

      subRef.value?.cancel();
      subRef.value = ref
          .read(palmVeinListProvider(lockMac).notifier)
          .addPalmVeinStream(lockMac)
          .listen(
        (event) {
          if (!context.mounted) return;
          switch (event.phase) {
            case TTAddPalmVeinPhase.canStartAdd:
              message.value = 'Follow lock instructions…';
            case TTAddPalmVeinPhase.error:
              final msg = palmVeinErrorMessage(event.errorCode);
              toastification.show(
                title: Text(msg),
                type: ToastificationType.error,
              );
              adding.value = false;
            case TTAddPalmVeinPhase.success:
              final palmVeinNumber = event.palmVeinNumber!;
              ref
                  .read(palmVeinListProvider(lockMac).notifier)
                  .onPalmVeinAdded(
                    lockMac,
                    palmVeinNumber,
                    0,
                    0,
                  );
              toastification.show(
                title: Text('Palm vein added: $palmVeinNumber'),
                type: ToastificationType.success,
              );
              Navigator.pop(context);
          }
        },
        onError: (e) {
          if (!context.mounted) return;
          adding.value = false;
          toastification.show(
            title: Text('$e'),
            type: ToastificationType.error,
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Add Palm Vein')),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'Position your palm as instructed by the lock.',
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

String palmVeinErrorMessage(TTPalmVeinErrorCode? code) {
  if (code == null) return 'Unknown error';
  return switch (code) {
    TTPalmVeinErrorCode.unknownStatus => 'Unknown error',
    TTPalmVeinErrorCode.noPalmVeinDetected =>
      'No palm detected. Adjust position.',
    TTPalmVeinErrorCode.palmRectConfLow ||
    TTPalmVeinErrorCode.palmLandmarkConfLow =>
      'Position unclear. Reposition your palm.',
    TTPalmVeinErrorCode.palmAngleRollError ||
    TTPalmVeinErrorCode.palmAngleLeanError =>
      'Adjust palm angle.',
    TTPalmVeinErrorCode.palmBlock => 'Palm partially blocked.',
    TTPalmVeinErrorCode.palmBlur => 'Keep palm steady.',
    TTPalmVeinErrorCode.palmBack => 'Face your palm toward the lock.',
  };
}
