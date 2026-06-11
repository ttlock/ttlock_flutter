import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../model/credential_params.dart';
import '../model/credential_validity.dart';
import '../widgets/add_progress_overlay.dart';
import '../widgets/credential_validity_sheet.dart';
import 'fingerprint_provider.dart';

class FingerprintAddPage extends ConsumerStatefulWidget {
  const FingerprintAddPage({super.key, required this.lockMac});

  final String lockMac;

  @override
  ConsumerState<FingerprintAddPage> createState() => _FingerprintAddPageState();
}

class _FingerprintAddPageState extends ConsumerState<FingerprintAddPage> {
  StreamSubscription<AddFingerprintEvent>? _sub;
  CredentialValidity? _validity;
  bool _adding = false;
  String _message = 'Place finger on sensor';
  double? _progress;

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  Future<void> _start() async {
    final validity = _validity ?? await CredentialValiditySheet.show(context);
    if (validity == null || !mounted) return;
    setState(() {
      _validity = validity;
      _adding = true;
      _message = 'Enrolling fingerprint…';
    });

    final range = validityToDateRange(validity);
    _sub?.cancel();
    _sub = ref
        .read(fingerprintListProvider(widget.lockMac).notifier)
        .addFingerprintStream(widget.lockMac, validity)
        .listen(
      (event) async {
        if (!mounted) return;
        switch (event.phase) {
          case TTAddFingerprintPhase.waiting:
          case TTAddFingerprintPhase.collecting:
            final total = event.totalCount ?? 1;
            final current = event.currentCount ?? 0;
            setState(() {
              _message = 'Scan $current / $total';
              _progress = event.collectionProgress;
            });
          case TTAddFingerprintPhase.success:
            final fingerprintNumber = event.credentialNumber!;
            await ref.read(fingerprintListProvider(widget.lockMac).notifier).onFingerprintAdded(
                  widget.lockMac,
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
        if (!mounted) return;
        setState(() => _adding = false);
        toastification.show(title: Text('$e'), type: ToastificationType.error);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
          if (_adding)
            AddProgressOverlay(message: _message, progress: _progress),
        ],
      ),
    );
  }
}
