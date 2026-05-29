import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../model/credential_params.dart';
import '../model/credential_validity.dart';
import '../widgets/add_progress_overlay.dart';
import '../widgets/credential_validity_sheet.dart';
import 'face_provider.dart';

class FaceAddPage extends ConsumerStatefulWidget {
  const FaceAddPage({super.key, required this.lockMac});

  final String lockMac;

  @override
  ConsumerState<FaceAddPage> createState() => _FaceAddPageState();
}

class _FaceAddPageState extends ConsumerState<FaceAddPage> {
  StreamSubscription<AddFaceEvent>? _sub;
  CredentialValidity? _validity;
  bool _adding = false;
  String _message = 'Look at the lock camera';

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  Future<void> _start() async {
    final validity = _validity ?? await CredentialValiditySheet.show(context);
    if (validity == null || !mounted) return;
    final range = validityToDateRange(validity);

    setState(() {
      _validity = validity;
      _adding = true;
      _message = 'Enrolling face…';
    });

    _sub?.cancel();
    _sub = ref
        .read(faceListProvider(widget.lockMac).notifier)
        .addFaceStream(widget.lockMac, validity)
        .listen(
      (event) {
        if (!mounted) return;
        if (event.isProgress) {
          if (event.errorCode != null) {
            toastification.show(
              title: Text(faceErrorMessage(event.errorCode)),
              type: ToastificationType.error,
            );
            setState(() => _adding = false);
            return;
          }
          setState(() {
            _message = event.state?.name ?? 'Follow lock instructions…';
          });
        }
        if (event.faceNumber != null) {
          ref.read(faceListProvider(widget.lockMac).notifier).addFace(
                widget.lockMac,
                faceNumber: event.faceNumber!,
                startDate: range.startDate,
                endDate: range.endDate,
              );
          toastification.show(
            title: Text('Face added: ${event.faceNumber}'),
            type: ToastificationType.success,
          );
          Navigator.pop(context);
        }
      },
      onError: (e) {
        if (!mounted) return;
        setState(() => _adding = false);
        toastification.show(title: Text('$e'), type: ToastificationType.error);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                subtitle: Text(_validity == null ? 'Not set' : 'Configured'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () async {
                  final v = await CredentialValiditySheet.show(context, initial: _validity);
                  if (v != null) setState(() => _validity = v);
                },
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
