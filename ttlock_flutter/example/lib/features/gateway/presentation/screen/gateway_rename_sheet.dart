import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/entity/gateway.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

class GatewayRenameSheet extends ConsumerStatefulWidget {
  const GatewayRenameSheet({super.key, required this.gateway});

  final GatewayEntity gateway;

  @override
  ConsumerState<GatewayRenameSheet> createState() => _GatewayRenameSheetState();
}

class _GatewayRenameSheetState extends ConsumerState<GatewayRenameSheet> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.gateway.gatewayName);
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
      title: l10n.gatewayRename,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            key: const Key('gateway_rename_field'),
            controller: _controller,
            autofocus: true,
            decoration: InputDecoration(hintText: l10n.nameHint),
          ),
          const SizedBox(height: 16),
          FilledButton(
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
