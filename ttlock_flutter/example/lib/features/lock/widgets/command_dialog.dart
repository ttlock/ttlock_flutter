import 'package:flutter/material.dart';

enum CommandParamType {
  passcode,
  autoLockSeconds,
  wifi,
  server,
  dateRange,
}

class CommandDialog {
  static Future<Map<String, dynamic>?> show(
    BuildContext context, {
    required String title,
    required CommandParamType type,
  }) async {
    switch (type) {
      case CommandParamType.passcode:
        return _showPasscodeDialog(context, title);
      case CommandParamType.autoLockSeconds:
        return _showAutoLockDialog(context, title);
      case CommandParamType.wifi:
        return _showWifiDialog(context, title);
      case CommandParamType.server:
        return _showServerDialog(context, title);
      case CommandParamType.dateRange:
        return _showDateRangeDialog(context, title);
    }
  }

  static Future<Map<String, dynamic>?> _showPasscodeDialog(
    BuildContext context,
    String title,
  ) async {
    final passcodeCtrl = TextEditingController(text: '123456');
    return showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: Theme.of(ctx).textTheme.titleMedium),
            const SizedBox(height: 12),
            TextField(
              controller: passcodeCtrl,
              decoration: const InputDecoration(labelText: 'Passcode'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, {
                'passcode': passcodeCtrl.text,
                'startDate': 0,
                'endDate': 0,
              }),
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }

  static Future<Map<String, dynamic>?> _showAutoLockDialog(
    BuildContext context,
    String title,
  ) async {
    var seconds = 10.0;
    return showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title),
              Slider(
                value: seconds,
                min: 1,
                max: 60,
                divisions: 59,
                label: '${seconds.toInt()}s',
                onChanged: (v) => setState(() => seconds = v),
              ),
              FilledButton(
                onPressed: () =>
                    Navigator.pop(ctx, {'seconds': seconds.toInt()}),
                child: const Text('Confirm'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Future<Map<String, dynamic>?> _showWifiDialog(
    BuildContext context,
    String title,
  ) async {
    final ssidCtrl = TextEditingController(text: 'MyWiFi');
    final pwdCtrl = TextEditingController(text: 'password');
    return showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            TextField(
              controller: ssidCtrl,
              decoration: const InputDecoration(labelText: 'SSID'),
            ),
            TextField(
              controller: pwdCtrl,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, {
                'ssid': ssidCtrl.text,
                'password': pwdCtrl.text,
              }),
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }

  static Future<Map<String, dynamic>?> _showServerDialog(
    BuildContext context,
    String title,
  ) async {
    final ipCtrl = TextEditingController(text: '192.168.1.100');
    final portCtrl = TextEditingController(text: '2229');
    return showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            TextField(
              controller: ipCtrl,
              decoration: const InputDecoration(labelText: 'IP'),
            ),
            TextField(
              controller: portCtrl,
              decoration: const InputDecoration(labelText: 'Port'),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, {
                'ip': ipCtrl.text,
                'port': portCtrl.text,
              }),
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }

  static Future<Map<String, dynamic>?> _showDateRangeDialog(
    BuildContext context,
    String title,
  ) async {
    return showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            const SizedBox(height: 8),
            const Text('Using default range (0 = permanent)'),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, {
                'startDate': 0,
                'endDate': 0,
              }),
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
