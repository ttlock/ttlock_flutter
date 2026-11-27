import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/entity/identity_card.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/card_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/card_period.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/provider/card_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/screen/card_change_period_sheet.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class CardDetailScreen extends ConsumerStatefulWidget {
  const CardDetailScreen({super.key, required this.args});
  final CardDetailArgs args;

  @override
  ConsumerState<CardDetailScreen> createState() => _CardDetailScreenState();
}

class _CardDetailScreenState extends ConsumerState<CardDetailScreen> {
  late final TextEditingController _name;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.args.item.cardName);
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final provider = cardDetailProvider(widget.args);
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
      appBar: AppBar(
        title: Text(item.cardName.isNotEmpty ? item.cardName : l10n.icCard),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(l10n.icCard),
            subtitle: Text(item.cardNumber.isEmpty ? '—' : item.cardNumber),
          ),
          ListTile(
            title: Text(l10n.cardName),
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
            subtitle: Text(formatCardPeriod(item, l10n)),
            trailing: isCardPermanent(item)
                ? null
                : const Icon(Icons.edit_outlined),
            onTap: operating || isCardPermanent(item)
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
    IdentityCardEntity item,
  ) async {
    final result = await CardChangePeriodSheetRoute(
      $extra: item,
    ).push<CardChangePeriodResult>(context);
    if (result == null) return;
    await ref
        .read(cardDetailProvider(widget.args).notifier)
        .changePeriod(result.start, result.end, schedule: result.schedule);
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await const CardDeleteConfirmSheetRoute().push<bool>(
      context,
    );
    if (confirmed != true) return;
    final ok = await ref
        .read(cardDetailProvider(widget.args).notifier)
        .delete();
    if (ok && context.mounted) {
      Navigator.of(context).pop(true);
    }
  }
}
