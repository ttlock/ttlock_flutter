import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/provider/hotel_lock_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/provider/hotel_lock_detail_state.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// 楼栋/楼层写入 sheet（BLE 单轨）。
///
/// 入口**不禁用**：`hotelInfo` 在提交时实时获取（10 分钟时效，不可缓存），
/// 取不到时由 notifier 置 `error`，本 sheet 显示原因且不 pop。
class HotelBuildingSheet extends ConsumerStatefulWidget {
  const HotelBuildingSheet({super.key, required this.hotelLock});

  final HotelLockEntity hotelLock;

  @override
  ConsumerState<HotelBuildingSheet> createState() => _HotelBuildingSheetState();
}

class _HotelBuildingSheetState extends ConsumerState<HotelBuildingSheet> {
  late final _buildingController = TextEditingController(
    text: widget.hotelLock.buildingNumber > 0
        ? '${widget.hotelLock.buildingNumber}'
        : '',
  );
  late final _floorController = TextEditingController(
    text: widget.hotelLock.floorNumber > 0
        ? '${widget.hotelLock.floorNumber}'
        : '',
  );

  @override
  void dispose() {
    _buildingController.dispose();
    _floorController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final args = HotelLockDetailArgs(lock: widget.hotelLock);
    // 空输入按 0（未设置）处理：仅数字键盘 + digitsOnly 过滤，解析不会失败。
    final buildingNumber = int.tryParse(_buildingController.text.trim()) ?? 0;
    final floorNumber = int.tryParse(_floorController.text.trim()) ?? 0;
    await ref
        .read(hotelLockDetailNotifierProvider(args).notifier)
        .writeBuildingFloor(
          buildingNumber: buildingNumber,
          floorNumber: floorNumber,
        );
    if (!mounted) return;
    if (ref.read(hotelLockDetailNotifierProvider(args)).error == null) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final state = ref.watch(
      hotelLockDetailNotifierProvider(
        HotelLockDetailArgs(lock: widget.hotelLock),
      ),
    );

    return BaseBottomSheet(
      title: l10n.hotelBuildingFloor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            key: const Key('hotel_building_number'),
            controller: _buildingController,
            enabled: !state.submitting,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              labelText: l10n.hotelBuildingNumber,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            key: const Key('hotel_floor_number'),
            controller: _floorController,
            enabled: !state.submitting,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              labelText: l10n.hotelFloorNumber,
              border: const OutlineInputBorder(),
            ),
          ),
          if (state.error != null) ...[
            const SizedBox(height: 12),
            Text(
              getUserFriendlyMessage(state.error!, l10n),
              key: const Key('hotel_building_error'),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ],
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('hotel_building_save'),
            onPressed: state.submitting ? null : _save,
            child: state.submitting
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(l10n.hotelWriteBuildingFloor),
          ),
        ],
      ),
    );
  }
}
