import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../widgets/add_progress_overlay.dart';
import 'palm_vein_provider.dart';

class PalmVeinAddPage extends ConsumerStatefulWidget {
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
  ConsumerState<PalmVeinAddPage> createState() => _PalmVeinAddPageState();
}

class _PalmVeinAddPageState extends ConsumerState<PalmVeinAddPage> {
  StreamSubscription<AddPalmVeinEvent>? _sub;
  bool _adding = false;
  String _message = 'Place your palm near the lock…';

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  Future<void> _start() async {
    setState(() {
      _adding = true;
      _message = 'Enrolling palm vein…';
    });

    _sub?.cancel();
    _sub = ref
        .read(palmVeinListProvider(widget.lockMac).notifier)
        .addPalmVeinStream(widget.lockMac)
        .listen(
      (event) {
        if (!mounted) return;
        switch (event.phase) {
          case TTAddPalmVeinPhase.canStartAdd:
            setState(() => _message = 'Follow lock instructions…');
          case TTAddPalmVeinPhase.error:
            final msg = _palmVeinErrorMessage(event.errorCode);
            toastification.show(
              title: Text(msg),
              type: ToastificationType.error,
            );
            setState(() => _adding = false);
          case TTAddPalmVeinPhase.success:
            final palmVeinNumber = event.palmVeinNumber!;
            ref
                .read(palmVeinListProvider(widget.lockMac).notifier)
                .onPalmVeinAdded(
                  widget.lockMac,
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
        if (!mounted) return;
        setState(() => _adding = false);
        toastification.show(
          title: Text('$e'),
          type: ToastificationType.error,
        );
      },
    );
  }

  String _palmVeinErrorMessage(TTPalmVeinErrorCode? code) {
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

  @override
  Widget build(BuildContext context) {
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
                onPressed: _adding ? null : _start,
                child: Text(_adding ? 'Enrolling…' : 'Start'),
              ),
            ],
          ),
          if (_adding) AddProgressOverlay(message: _message),
        ],
      ),
    );
  }
}
