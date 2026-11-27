import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/provider/hotel_lock_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/provider/hotel_lock_detail_state.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// 扇区可选数量：1–10（SDK 与云端均按 1 计数）。
const int kHotelSectorCount = 10;

/// 解析锁上的扇区串（`'1,2,3'`，从 1 计数）为集合。
///
/// 容错：非法片段与越界值直接丢弃，不抛异常——服务端历史数据可能不规范，
/// 而这里解析失败不该阻塞用户改扇区。
Set<int> decodeSector(String sector) => sector
    .split(',')
    .map((part) => int.tryParse(part.trim()))
    .whereType<int>()
    .where((s) => s >= 1 && s <= kHotelSectorCount)
    .toSet();

/// 组装扇区串：**升序、逗号分隔、从 1 计数**（SDK 与云端均要求该格式）。
String encodeSector(Set<int> selected) {
  final sorted = selected.toList()..sort();
  return sorted.join(',');
}

/// 卡扇区多选 sheet。
///
/// 草稿由本 sheet 自己持有（`setState` 局部状态），不进详情页 state——
/// 用户取消（返回）时详情页不该留下半成品。
class HotelSectorSheet extends ConsumerStatefulWidget {
  const HotelSectorSheet({super.key, required this.hotelLock});

  final HotelLockEntity hotelLock;

  @override
  ConsumerState<HotelSectorSheet> createState() => _HotelSectorSheetState();
}

class _HotelSectorSheetState extends ConsumerState<HotelSectorSheet> {
  late Set<int> _selected = decodeSector(widget.hotelLock.sector);

  Future<void> _save() async {
    final args = HotelLockDetailArgs(lock: widget.hotelLock);
    await ref
        .read(hotelLockDetailNotifierProvider(args).notifier)
        .applySector(encodeSector(_selected));
    if (!mounted) return;
    final state = ref.read(hotelLockDetailNotifierProvider(args));
    // `cloudPending` 也 pop：此时锁的扇区**已改**，只是云端没同步，
    // 详情页的「待同步」横幅才是它该出现的地方（sheet 内无处展示该语义）。
    if (state.error == null) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    // watch 保持 autoDispose provider 存活，并据此驱动提交态。
    final state = ref.watch(
      hotelLockDetailNotifierProvider(
        HotelLockDetailArgs(lock: widget.hotelLock),
      ),
    );

    return BaseBottomSheet(
      title: l10n.hotelSector,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.hotelSectorHint),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (var i = 1; i <= kHotelSectorCount; i++)
                FilterChip(
                  key: Key('hotel_sector_chip_$i'),
                  label: Text('$i'),
                  selected: _selected.contains(i),
                  onSelected: state.submitting
                      ? null
                      : (on) => setState(() {
                          if (on) {
                            _selected = {..._selected, i};
                          } else {
                            _selected = {..._selected}..remove(i);
                          }
                        }),
                ),
            ],
          ),
          if (state.error != null) ...[
            const SizedBox(height: 12),
            Text(
              getUserFriendlyMessage(state.error!, l10n),
              key: const Key('hotel_sector_error'),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ],
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('hotel_sector_save'),
            onPressed: state.submitting ? null : _save,
            child: state.submitting
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(l10n.hotelSectorSave),
          ),
        ],
      ),
    );
  }
}
