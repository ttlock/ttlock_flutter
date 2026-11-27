import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

class StandaloneDoorSensorRenameSheet extends ConsumerStatefulWidget {
  const StandaloneDoorSensorRenameSheet({super.key, required this.item});

  final StandaloneDoorSensorEntity item;

  @override
  ConsumerState<StandaloneDoorSensorRenameSheet> createState() =>
      _StandaloneDoorSensorRenameSheetState();
}

class _StandaloneDoorSensorRenameSheetState
    extends ConsumerState<StandaloneDoorSensorRenameSheet> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.item.name);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return BaseBottomSheet(
      title: l10n.standaloneDoorRename,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            key: const Key('standalone_rename_field'),
            controller: _controller,
            autofocus: true,
            decoration: InputDecoration(hintText: l10n.nameHint),
          ),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('standalone_rename_save'),
            onPressed: () {
              final name = _controller.text.trim();
              if (name.isEmpty) return;
              Navigator.of(context).pop(name);
            },
            child: Text(l10n.commonSave),
          ),
        ],
      ),
    );
  }
}
