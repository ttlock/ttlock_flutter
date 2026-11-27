import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/meter_connection_confirm_args.dart';

/// 连接的二次确认弹窗：让用户核对设备指示灯后手动确认再加网。
///
/// 返回 `true` = 已确认；`false` / `null`（取消、系统返回）= 取消，调用方
/// 应回到扫描步骤。
class MeterConnectionConfirmDialog extends ConsumerWidget {
  const MeterConnectionConfirmDialog({super.key, required this.args});

  final MeterConnectionConfirmArgs args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    return AlertDialog(
      key: const Key('meter_connection_confirm'),
      content: Text(
        args.isWaterMeter
            ? l10n.waterMeterConnectionConfirm
            : l10n.electricMeterConnectionConfirm,
      ),
      actions: [
        TextButton(
          key: const Key('meter_connection_confirm_cancel'),
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(l10n.commonCancel),
        ),
        FilledButton(
          key: const Key('meter_connection_confirm_ok'),
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(l10n.commonConfirm),
        ),
      ],
    );
  }
}
