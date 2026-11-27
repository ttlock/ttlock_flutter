import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/provider/standalone_door_sensor_domain.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// 独立门磁告警配置。
/// initState 通过 `domain.getAlertFlag` 预填当前开关；Switch 控制
/// `notCloseAlertFlag`/`longTimeNotOpenAlertFlag`，开启时提交对应秒数/天数。
class StandaloneDoorSensorAlertConfigSheet extends ConsumerStatefulWidget {
  const StandaloneDoorSensorAlertConfigSheet({super.key, required this.item});

  final StandaloneDoorSensorEntity item;

  @override
  ConsumerState<StandaloneDoorSensorAlertConfigSheet> createState() =>
      _StandaloneDoorSensorAlertConfigSheetState();
}

class _StandaloneDoorSensorAlertConfigSheetState
    extends ConsumerState<StandaloneDoorSensorAlertConfigSheet> {
  bool _loading = true;
  bool _notClose = false;
  bool _longTimeNotOpen = false;
  late final TextEditingController _secondsController;
  late final TextEditingController _daysController;

  @override
  void initState() {
    super.initState();
    _secondsController = TextEditingController(text: '60');
    _daysController = TextEditingController(text: '7');
    _load();
  }

  @override
  void dispose() {
    _secondsController.dispose();
    _daysController.dispose();
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

  Future<void> _load() async {
    final r = await ref
        .read(standaloneDoorSensorDomainProvider.notifier)
        .getAlertFlag(widget.item.doorSensorId)
        .run();
    if (!mounted) return;
    r.fold(
      (err) {
        setState(() => _loading = false);
        _showError(err);
      },
      (flag) {
        final seconds = flag.notCloseAlertSecondNum == 0
            ? 60
            : flag.notCloseAlertSecondNum;
        final days = flag.longTimeNotOpenDayNum == 0
            ? 7
            : flag.longTimeNotOpenDayNum;
        setState(() {
          _loading = false;
          _notClose = flag.notCloseAlertFlag != 0;
          _secondsController.text = '$seconds';
          _longTimeNotOpen = flag.longTimeNotOpenAlertFlag != 0;
          _daysController.text = '$days';
        });
      },
    );
  }

  Future<void> _save() async {
    final seconds = int.tryParse(_secondsController.text.trim());
    final days = int.tryParse(_daysController.text.trim());
    if (_notClose && seconds == null) return;
    if (_longTimeNotOpen && days == null) return;
    final r = await ref
        .read(standaloneDoorSensorDomainProvider.notifier)
        .configAlertFlag(
          widget.item.doorSensorId,
          notCloseAlertFlag: _notClose ? 1 : 0,
          notCloseAlertSecondNum: _notClose ? seconds : null,
          longTimeNotOpenAlertFlag: _longTimeNotOpen ? 1 : 0,
          longTimeNotOpenDayNum: _longTimeNotOpen ? days : null,
        )
        .runWithLoading(status: ref.read(l10nProvider).loading);
    if (!mounted) return;
    r.fold(_showError, (_) => Navigator.of(context).pop(true));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return BaseBottomSheet(
      title: l10n.standaloneDoorAlertConfig,
      child: _loading
          ? const SizedBox(
              height: 120,
              child: Center(child: CircularProgressIndicator()),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SwitchListTile(
                  key: const Key('standalone_not_close_switch'),
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.standaloneDoorNotCloseAlert),
                  value: _notClose,
                  onChanged: (v) => setState(() => _notClose = v),
                ),
                if (_notClose)
                  TextField(
                    key: const Key('standalone_not_close_seconds'),
                    controller: _secondsController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: l10n.standaloneDoorNotCloseSecondLabel,
                    ),
                  ),
                const SizedBox(height: 8),
                SwitchListTile(
                  key: const Key('standalone_long_time_switch'),
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.standaloneDoorLongTimeNotOpenAlert),
                  value: _longTimeNotOpen,
                  onChanged: (v) => setState(() => _longTimeNotOpen = v),
                ),
                if (_longTimeNotOpen)
                  TextField(
                    key: const Key('standalone_long_time_days'),
                    controller: _daysController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: l10n.standaloneDoorNotOpenDayLabel,
                    ),
                  ),
                const SizedBox(height: 16),
                FilledButton(
                  key: const Key('standalone_alert_save'),
                  onPressed: _save,
                  child: Text(l10n.commonSave),
                ),
              ],
            ),
    );
  }
}
