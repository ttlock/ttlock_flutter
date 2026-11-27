import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/provider/wireless_keypad_domain.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/provider/wireless_keypad_list_notifier.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/wireless_keypad_args.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';

class WirelessKeypadAddScreen extends ConsumerStatefulWidget {
  const WirelessKeypadAddScreen({super.key, required this.args});
  final WirelessKeypadAddArgs args;

  @override
  ConsumerState<WirelessKeypadAddScreen> createState() =>
      _WirelessKeypadAddScreenState();
}

class _WirelessKeypadAddScreenState
    extends ConsumerState<WirelessKeypadAddScreen> {
  final _scanned = <String, TTRemoteAccessoryScanModel>{};
  StreamSubscription<TTRemoteAccessoryScanModel>? _sub;
  var _scanning = false;
  var _submitting = false;
  String? _selectedMac;

  bool get _isMulti => widget.args.type == WirelessKeypadType.multifunctional;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startScan());
  }

  @override
  void dispose() {
    unawaited(_sub?.cancel());
    super.dispose();
  }

  Future<void> _startScan() async {
    await _sub?.cancel();
    setState(() {
      _scanning = true;
      _scanned.clear();
    });
    _sub =
        gateBleStream(
          () => TTLock.remoteKeypad.accessoryStartScanRemoteKeypad(),
        ).listen(
          (s) {
            if (!mounted) return;
            final match = _isMulti
                ? s.isMultifunctionalKeypad
                : !s.isMultifunctionalKeypad;
            if (!match) return;
            setState(() => _scanned[s.mac] = s);
          },
          onError: (Object e, StackTrace st) {
            if (!mounted) return;
            setState(() => _scanning = false);
            final l10n = ref.read(l10nProvider);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  getUserFriendlyMessage(
                    ExceptionUtils.extractAppException(e, st),
                    l10n,
                  ),
                ),
              ),
            );
          },
          onDone: () {
            if (mounted) setState(() => _scanning = false);
          },
        );
  }

  Future<void> _bind(TTRemoteAccessoryScanModel scan) async {
    if (_submitting) return;
    setState(() {
      _submitting = true;
      _selectedMac = scan.mac;
    });
    await _sub?.cancel();
    final l10n = ref.read(l10nProvider);
    final domain = ref.read(wirelessKeypadDomainProvider.notifier);
    final number = scan.name.isEmpty ? scan.mac : scan.name;
    final task = _isMulti
        ? domain.addMulti(lock: widget.args.lock, mac: scan.mac, number: number)
        : domain.addNormal(
            lock: widget.args.lock,
            mac: scan.mac,
            number: number,
          );
    final r = await task.run();
    if (!mounted) return;
    r.fold((err) {
      setState(() => _submitting = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
      );
    }, (_) {
      ref.invalidate(wirelessKeypadListProvider);
      Navigator.of(context).pop(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final items = _scanned.values.toList()
      ..sort((a, b) => b.rssi.compareTo(a.rssi));
    return Scaffold(
      key: const Key('wireless_keypad_add'),
      appBar: AppBar(
        title: Text(_isMulti ? l10n.keypadTypeMulti : l10n.keypadTypeNormal),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              _isMulti ? l10n.keypadGuideMulti : l10n.keypadGuideNormal,
            ),
          ),
          ListTile(
            title: Text(_scanning ? l10n.scanningKeypads : l10n.wirelessKeypad),
            trailing: TextButton(
              onPressed: _submitting
                  ? null
                  : () {
                      if (_scanning) {
                        unawaited(_sub?.cancel());
                        setState(() => _scanning = false);
                      } else {
                        _startScan();
                      }
                    },
              child: Text(_scanning ? l10n.commonCancel : l10n.startScan),
            ),
          ),
          if (items.isEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(l10n.noKeypadsScanned),
            )
          else
            ...items.map(
              (s) => ListTile(
                key: Key('keypad_scan_${s.mac}'),
                leading: const Icon(Icons.keyboard_alt_outlined),
                title: Text(s.name.isEmpty ? s.mac : s.name),
                subtitle: Text('${s.mac}  RSSI ${s.rssi}'),
                selected: _selectedMac == s.mac,
                trailing: _submitting && _selectedMac == s.mac
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : null,
                onTap: _submitting ? null : () => _bind(s),
              ),
            ),
        ],
      ),
    );
  }
}
