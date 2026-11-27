import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/provider/standalone_door_sensor_domain.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// 独立门磁 WiFi 重配：输入 WiFi → `domain.reconfigWifiViaBle`（BLE init + 云上传）→ pop 新 wifiName。
class StandaloneDoorSensorWifiConfigSheet extends ConsumerStatefulWidget {
  const StandaloneDoorSensorWifiConfigSheet({super.key, required this.item});

  final StandaloneDoorSensorEntity item;

  @override
  ConsumerState<StandaloneDoorSensorWifiConfigSheet> createState() =>
      _StandaloneDoorSensorWifiConfigSheetState();
}

class _StandaloneDoorSensorWifiConfigSheetState
    extends ConsumerState<StandaloneDoorSensorWifiConfigSheet> {
  late final TextEditingController _wifiNameController;
  final _wifiPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _wifiNameController = TextEditingController(text: widget.item.wifiName);
  }

  @override
  void dispose() {
    _wifiNameController.dispose();
    _wifiPasswordController.dispose();
    super.dispose();
  }

  void _showError(Object error) {
    final l10n = ref.read(l10nProvider);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          getUserFriendlyMessage(
            ExceptionUtils.extractAppException(error, StackTrace.current),
            l10n,
          ),
        ),
      ),
    );
  }

  Future<void> _save() async {
    final wifiName = _wifiNameController.text.trim();
    if (wifiName.isEmpty) return;
    final r = await ref
        .read(standaloneDoorSensorDomainProvider.notifier)
        .reconfigWifiViaBle(
          item: widget.item,
          wifiName: wifiName,
          wifiPassword: _wifiPasswordController.text,
        )
        .runWithLoading(status: ref.read(l10nProvider).loading);
    if (!mounted) return;
    r.fold(_showError, (_) => Navigator.of(context).pop(wifiName));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return BaseBottomSheet(
      title: l10n.standaloneDoorWifiConfig,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            key: const Key('standalone_wifi_name_field'),
            controller: _wifiNameController,
            autofocus: true,
            decoration: InputDecoration(labelText: l10n.standaloneDoorWifiName),
          ),
          const SizedBox(height: 12),
          TextField(
            key: const Key('standalone_wifi_password_field'),
            controller: _wifiPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: l10n.standaloneDoorWifiPassword,
            ),
          ),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('standalone_wifi_save'),
            onPressed: _save,
            child: Text(l10n.commonSave),
          ),
        ],
      ),
    );
  }
}
