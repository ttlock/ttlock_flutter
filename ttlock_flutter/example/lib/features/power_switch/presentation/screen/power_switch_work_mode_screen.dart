import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/power_switch/presentation/provider/power_switch_notifier.dart';
import 'package:ttlock_flutter_demo/features/power_switch/presentation/provider/power_switch_state.dart';

/// 取电工作模式：全部卡 / 酒店卡 / 房卡（BLE 写，无读回）。
class PowerSwitchWorkModeScreen extends ConsumerStatefulWidget {
  const PowerSwitchWorkModeScreen({
    super.key,
    required this.lockId,
    this.lock,
  });

  final int lockId;
  final LockEntity? lock;

  @override
  ConsumerState<PowerSwitchWorkModeScreen> createState() =>
      _PowerSwitchWorkModeScreenState();
}

class _PowerSwitchWorkModeScreenState
    extends ConsumerState<PowerSwitchWorkModeScreen> {
  TTPowerSaverWorkType _type = TTPowerSaverWorkType.allCards;

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final state = ref.watch(powerSwitchProvider);
    ref.listen(powerSwitchProvider, (prev, next) {
      final err = next.error;
      if (err != null && err != prev?.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
        );
        ref.read(powerSwitchProvider.notifier).clearError();
      }
      final cfg = next.configOutcome;
      if (cfg == PowerSwitchConfigOutcome.workModeSaved &&
          cfg != prev?.configOutcome) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.powerSwitchWorkModeSuccess)),
        );
        ref.read(powerSwitchProvider.notifier).clearConfigOutcome();
        if (context.mounted) context.pop();
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text(l10n.powerSwitchWorkMode)),
      body: ListView(
        children: [
          RadioListTile<TTPowerSaverWorkType>(
            key: const Key('power_switch_work_mode_all'),
            title: Text(l10n.powerSwitchWorkModeAllCards),
            subtitle: Text(l10n.powerSwitchWorkModeAllCardsHint),
            value: TTPowerSaverWorkType.allCards,
            groupValue: _type,
            onChanged: state.operating
                ? null
                : (v) {
                    if (v != null) setState(() => _type = v);
                  },
          ),
          RadioListTile<TTPowerSaverWorkType>(
            key: const Key('power_switch_work_mode_hotel'),
            title: Text(l10n.powerSwitchWorkModeHotelCard),
            subtitle: Text(l10n.powerSwitchWorkModeHotelCardHint),
            value: TTPowerSaverWorkType.hotelCard,
            groupValue: _type,
            onChanged: state.operating
                ? null
                : (v) {
                    if (v != null) setState(() => _type = v);
                  },
          ),
          RadioListTile<TTPowerSaverWorkType>(
            key: const Key('power_switch_work_mode_room'),
            title: Text(l10n.powerSwitchWorkModeRoomCard),
            subtitle: Text(l10n.powerSwitchWorkModeRoomCardHint),
            value: TTPowerSaverWorkType.roomCard,
            groupValue: _type,
            onChanged: state.operating
                ? null
                : (v) {
                    if (v != null) setState(() => _type = v);
                  },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: FilledButton(
              key: const Key('power_switch_work_mode_save'),
              onPressed: state.operating
                  ? null
                  : () => ref
                        .read(powerSwitchProvider.notifier)
                        .setWorkMode(
                          type: _type,
                          lockData: widget.lock?.lockData ?? '',
                        ),
              child: state.operating
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(l10n.commonSave),
            ),
          ),
        ],
      ),
    );
  }
}
