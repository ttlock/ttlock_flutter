import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../model/credential_params.dart';
import '../model/credential_validity.dart';
import '../widgets/add_progress_overlay.dart';
import '../widgets/credential_validity_sheet.dart';
import 'card_provider.dart';

class CardAddPage extends ConsumerStatefulWidget {
  const CardAddPage({super.key, required this.lockMac});

  final String lockMac;

  @override
  ConsumerState<CardAddPage> createState() => _CardAddPageState();
}

class _CardAddPageState extends ConsumerState<CardAddPage> {
  StreamSubscription<AddCardEvent>? _sub;
  CredentialValidity? _validity;
  bool _adding = false;
  String _message = 'Place card near the lock';

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
      _message = 'Place card near the lock…';
    });

    final range = validityToDateRange(validity);
    _sub?.cancel();
    _sub = ref
        .read(cardListProvider(widget.lockMac).notifier)
        .addCardStream(widget.lockMac, validity)
        .listen(
      (event) async {
        if (!mounted) return;
        if (event.isProgress) {
          setState(() => _message = 'Reading card…');
        }
        if (event.cardNumber != null) {
          await ref.read(cardListProvider(widget.lockMac).notifier).onCardAdded(
                widget.lockMac,
                event.cardNumber!,
                range.startDate,
                range.endDate,
              );
          toastification.show(
            title: Text('Card added: ${event.cardNumber}'),
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
                subtitle: Text(_validity == null ? 'Not set' : 'Configured'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () async {
                  final v = await CredentialValiditySheet.show(
                    context,
                    initial: _validity,
                  );
                  if (v != null) setState(() => _validity = v);
                },
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: _adding ? null : _start,
                child: Text(_adding ? 'Adding…' : 'Start'),
              ),
            ],
          ),
          if (_adding)
            AddProgressOverlay(message: _message),
        ],
      ),
    );
  }
}
