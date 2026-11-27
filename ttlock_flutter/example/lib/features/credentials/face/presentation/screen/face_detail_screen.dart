import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/entity/face.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/face_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/face_period.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/provider/face_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/screen/face_change_period_sheet.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class FaceDetailScreen extends ConsumerStatefulWidget {
  const FaceDetailScreen({super.key, required this.args});
  final FaceDetailArgs args;

  @override
  ConsumerState<FaceDetailScreen> createState() => _FaceDetailScreenState();
}

class _FaceDetailScreenState extends ConsumerState<FaceDetailScreen> {
  late final TextEditingController _name;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.args.item.name);
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final provider = faceDetailProvider(widget.args);
    final state = ref.watch(provider);
    ref.listen(provider, (prev, next) {
      final err = next.error;
      if (err != null && err != prev?.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
        );
        ref.read(provider.notifier).clearError();
      }
    });
    final item = state.item;
    final operating = state.operating;
    return Scaffold(
      appBar: AppBar(title: Text(item.name.isNotEmpty ? item.name : l10n.face)),
      body: ListView(
        children: [
          ListTile(
            title: Text(l10n.face),
            subtitle: Text(item.faceNumber.isEmpty ? '—' : item.faceNumber),
          ),
          ListTile(
            title: Text(l10n.faceName),
            subtitle: TextField(
              controller: _name,
              enabled: !operating,
              decoration: InputDecoration(hintText: l10n.nameHint),
            ),
          ),
          ListTile(
            title: Text(l10n.rename),
            leading: const Icon(Icons.drive_file_rename_outline),
            onTap: operating
                ? null
                : () => ref.read(provider.notifier).rename(_name.text),
          ),
          ListTile(
            title: Text(l10n.validityPeriod),
            subtitle: Text(formatFacePeriod(item, l10n)),
            trailing: isFacePermanent(item)
                ? null
                : const Icon(Icons.edit_outlined),
            onTap: operating || isFacePermanent(item)
                ? null
                : () => _changePeriod(context, ref, item),
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.delete_outline,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text(l10n.deleteConfirm),
            onTap: operating ? null : () => _confirmDelete(context, ref),
          ),
        ],
      ),
    );
  }

  Future<void> _changePeriod(
    BuildContext context,
    WidgetRef ref,
    FaceEntity item,
  ) async {
    final result = await FaceChangePeriodSheetRoute(
      $extra: item,
    ).push<FaceChangePeriodResult>(context);
    if (result == null) return;
    await ref
        .read(faceDetailProvider(widget.args).notifier)
        .changePeriod(result.start, result.end, schedule: result.schedule);
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await const FaceDeleteConfirmSheetRoute().push<bool>(
      context,
    );
    if (confirmed != true) return;
    final ok = await ref
        .read(faceDetailProvider(widget.args).notifier)
        .delete();
    if (ok && context.mounted) {
      Navigator.of(context).pop(true);
    }
  }
}
