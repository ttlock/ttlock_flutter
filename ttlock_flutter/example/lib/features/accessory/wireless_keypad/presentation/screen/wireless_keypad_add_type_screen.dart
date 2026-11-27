import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/provider/wireless_keypad_domain.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/wireless_keypad_args.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';

class WirelessKeypadAddTypeScreen extends ConsumerStatefulWidget {
  const WirelessKeypadAddTypeScreen({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<WirelessKeypadAddTypeScreen> createState() =>
      _WirelessKeypadAddTypeScreenState();
}

class _WirelessKeypadAddTypeScreenState
    extends ConsumerState<WirelessKeypadAddTypeScreen> {
  var _normal = false;
  var _multi = false;
  var _loading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _probe());
  }

  Future<void> _probe() async {
    final ld = widget.lock.lockData;
    final normal = ld.isEmpty
        ? false
        : await runBle(
            () =>
                TTLock.lock.supportFunction(TTLockFunction.wirelessKeypad, ld),
          );
    final multi = ld.isEmpty
        ? false
        : await runBle(
            () => TTLock.lock.supportFunction(
              TTLockFunction.multiFunctionKeypad,
              ld,
            ),
          );
    if (!mounted) return;
    setState(() {
      _normal = normal;
      _multi = multi;
      _loading = false;
    });
  }

  Future<void> _open(WirelessKeypadType type) async {
    final ok = await WirelessKeypadAddRoute(
      $extra: WirelessKeypadAddArgs(lock: widget.lock, type: type),
    ).push<bool>(context);
    if (ok == true && mounted) Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return Scaffold(
      key: const Key('wireless_keypad_add_type'),
      appBar: AppBar(title: Text(l10n.addWirelessKeypad)),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                if (_normal)
                  ListTile(
                    key: const Key('keypad_type_normal'),
                    leading: const Icon(Icons.dialpad),
                    title: Text(l10n.keypadTypeNormal),
                    subtitle: Text(l10n.keypadTypeNormalHint),
                    onTap: () => _open(WirelessKeypadType.normal),
                  ),
                if (_multi)
                  ListTile(
                    key: const Key('keypad_type_multi'),
                    leading: const Icon(Icons.keyboard_alt_outlined),
                    title: Text(l10n.keypadTypeMulti),
                    subtitle: Text(l10n.keypadTypeMultiHint),
                    onTap: () => _open(WirelessKeypadType.multifunctional),
                  ),
              ],
            ),
    );
  }
}
