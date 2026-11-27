import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/entity/qr_code.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/presentation/provider/qr_code_list_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/presentation/qr_code_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/presentation/qr_code_period.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class QrCodeListScreen extends ConsumerWidget {
  const QrCodeListScreen({super.key, required this.lockId, this.lock});
  final int lockId;
  final LockEntity? lock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = qrCodeListProvider(lockId);
    final state = ref.watch(provider);
    final currentLock = lock ?? LockEntity(lockId: lockId);
    return Scaffold(
      key: const Key('qr_code_list'),
      appBar: AppBar(title: Text(l10n.qrCode)),
      floatingActionButton: FloatingActionButton(
        tooltip: l10n.addQrCode,
        onPressed: () async {
          final added = await QrCodeAddRoute(
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
          if (data.pageState.data.isEmpty) {
            return Center(child: Text(l10n.noQrCodes));
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(provider.notifier).refresh(),
            child: NotificationListener<ScrollNotification>(
              onNotification: (n) {
                if (n.metrics.pixels >= n.metrics.maxScrollExtent - 64 &&
                    data.pageState.hasMore) {
                  ref.read(provider.notifier).loadMore();
                }
                return false;
              },
              child: ListView.builder(
                itemCount:
                    data.pageState.data.length +
                    (data.pageState.hasMore ? 1 : 0),
                itemBuilder: (context, i) {
                  if (i >= data.pageState.data.length) {
                    return const Padding(
                      padding: EdgeInsets.all(12),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  final item = data.pageState.data[i];
                  return _QrCodeTile(
                    qrCode: item,
                    l10n: l10n,
                    onTap: () async {
                      await QrCodeDetailRoute(
                        $extra: QrCodeDetailArgs(
                          lock: currentLock,
                          qrCode: item,
                        ),
                      ).push<bool>(context);
                      await ref.read(provider.notifier).refresh();
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class _QrCodeTile extends StatelessWidget {
  const _QrCodeTile({
    required this.qrCode,
    required this.l10n,
    required this.onTap,
  });
  final QrCodeEntity qrCode;
  final AppLocalizations l10n;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final title = qrCode.name.isNotEmpty ? qrCode.name : l10n.qrCode;
    return ListTile(
      leading: const Icon(Icons.qr_code_2_outlined),
      title: Text(title),
      subtitle: Text(formatQrCodePeriod(qrCode, l10n)),
      onTap: onTap,
    );
  }
}
