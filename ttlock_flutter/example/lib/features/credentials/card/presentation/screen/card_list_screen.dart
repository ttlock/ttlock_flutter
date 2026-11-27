import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/entity/identity_card.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/card_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/card_period.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/provider/card_list_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class CardListScreen extends ConsumerWidget {
  const CardListScreen({super.key, required this.lockId, this.lock});
  final int lockId;
  final LockEntity? lock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = cardListProvider(lockId);
    final state = ref.watch(provider);
    final currentLock = lock ?? LockEntity(lockId: lockId);
    return Scaffold(
      key: const Key('card_list'),
      appBar: AppBar(title: Text(l10n.icCard)),
      floatingActionButton: FloatingActionButton(
        tooltip: l10n.icCard,
        onPressed: () async {
          final added = await CardAddRoute(
            $extra: currentLock,
          ).push<bool>(context);
          if (added == true) {
            await ref.read(provider.notifier).refresh();
          }
        },
        child: const Icon(Icons.add),
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(
          child: Text(
            getUserFriendlyMessage(
              ExceptionUtils.extractAppException(e, st),
              l10n,
            ),
          ),
        ),
        data: (data) {
          if (data.items.isEmpty) {
            return Center(child: Text(l10n.noCards));
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(provider.notifier).refresh(),
            child: ListView.builder(
              itemCount: data.items.length,
              itemBuilder: (context, i) {
                final item = data.items[i];
                return _CardTile(
                  card: item,
                  l10n: l10n,
                  onTap: () async {
                    await CardDetailRoute(
                      $extra: CardDetailArgs(lock: currentLock, item: item),
                    ).push<bool>(context);
                    await ref.read(provider.notifier).refresh();
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _CardTile extends StatelessWidget {
  const _CardTile({
    required this.card,
    required this.l10n,
    required this.onTap,
  });
  final IdentityCardEntity card;
  final AppLocalizations l10n;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final title = card.cardName.isNotEmpty
        ? card.cardName
        : (card.cardNumber.isNotEmpty ? card.cardNumber : l10n.icCard);
    return ListTile(
      leading: const Icon(Icons.credit_card_outlined),
      title: Text(title),
      subtitle: Text(formatCardPeriod(card, l10n)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
