import 'dart:async';

import 'package:bmprogresshud/progresshud.dart';
import 'package:flutter/material.dart';
import 'package:ttlock_premise_flutter/ttlock.dart';

class ScanKeyPadPage extends StatefulWidget {
  final String lockData;
  final String lockMac;
  const ScanKeyPadPage({Key? key, required this.lockData, required this.lockMac}) : super(key: key);

  @override
  State<ScanKeyPadPage> createState() => _ScanKeyPadPageState();
}

class _ScanKeyPadPageState extends State<ScanKeyPadPage> {
  TTRemoteAccessoryScanModel? model;
  bool isInit = false;
  bool isMultifunctionalKeypad = false;
  late BuildContext _ctx;
  StreamSubscription? _scanSub;
  StreamSubscription? _progressSub;

  final _keypad = TTLock.remoteKeypad;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startScan());
  }

  @override
  void dispose() {
    _scanSub?.cancel();
    _progressSub?.cancel();
    super.dispose();
  }

  void _startScan() {
    _scanSub = _keypad.accessoryStartScanRemoteKeypad().listen((scanModel) {
      if (mounted) setState(() => model = scanModel);
    });
  }

  void _showLoading(String text) => ProgressHud.of(_ctx).showLoading(text: text);
  void _showSuccess(String text) => ProgressHud.of(_ctx).showSuccessAndDismiss(text: text);
  void _showError(String text) => ProgressHud.of(_ctx).showErrorAndDismiss(text: text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan KeyPad')),
      body: ProgressHud(
        child: Builder(builder: (ctx) {
          _ctx = ctx;
          return Column(
            children: [
              ListTile(
                title: Text(model?.name ?? ''),
                subtitle: Text('Click to Init'),
                onTap: _onInitTap,
              ),
              if (isInit && isMultifunctionalKeypad) _buildActions(),
            ],
          );
        }),
      ),
    );
  }

  void _onInitTap() async {
    if (model == null) return;
    _scanSub?.cancel();
    _showLoading('Initializing keypad...');
    isMultifunctionalKeypad = model?.isMultifunctionalKeypad ?? false;

    if (isInit) return;

    try {
      if (isMultifunctionalKeypad) {
        await _keypad.initMultifunctionalKeypad(model!.mac, widget.lockData);
        if (mounted) setState(() => isInit = true);
        _showSuccess('Init keypad success');
      } else {
        await _keypad.initRemoteKeypad(model!.mac, widget.lockMac);
        if (mounted) setState(() => isInit = true);
        _showSuccess('Init keypad success');
      }
    } on TTLockException catch (e) {
      _showError('${e.code}: ${e.message}');
    } on TTMultifunctionalKeypadException catch (e) {
      _showError('${e.code}: ${e.message}');
    } on TTRemoteAccessoryException catch (e) {
      _showError('${e.code}: ${e.message}');
    } catch (e) {
      _showError(e.toString());
    }
  }

  Widget _buildActions() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text('Delete stored lock'),
          onTap: () async {
            if (model == null) return;
            _showLoading('Deleting...');
            try {
              await _keypad.deleteStoredLock(model!.mac, 1);
              _showSuccess("Delete success");
              Navigator.pop(context);
            } on TTLockException catch (e) {
              _showError('${e.code}: ${e.message}');
            } on TTMultifunctionalKeypadException catch (e) {
              _showError('${e.code}: ${e.message}');
            } catch (e) {
              _showError(e.toString());
            }
          },
        ),
        ListTile(
          title: Text('Add fingerprint'),
          onTap: () {
            if (model == null) return;
            _showLoading('Adding fingerprint...');
            _progressSub?.cancel();
            _progressSub = _keypad.accessoryAddKeypadFingerprint(model!.mac).listen(
              (event) {
                if (event.isProgress) {
                  _showLoading("${event.currentCount} / ${event.totalCount}");
                } else {
                  _showSuccess("Fingerprint added: ${event.fingerprintNumber}");
                }
              },
              onError: (e) => _showError(e.toString()),
            );
          },
        ),
        ListTile(
          title: Text('Add Card'),
          onTap: () {
            if (model == null) return;
            _showLoading('Adding card...');
            _progressSub?.cancel();
            _progressSub = _keypad.accessoryAddKeypadCard(model!.mac).listen(
              (event) {
                if (event.isProgress) {
                  _showLoading("Waiting for card...");
                } else {
                  _showSuccess("Card added: ${event.cardNumber}");
                }
              },
              onError: (e) => _showError(e.toString()),
            );
          },
        ),
      ],
    );
  }
}
