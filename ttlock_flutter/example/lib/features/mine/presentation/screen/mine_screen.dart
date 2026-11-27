import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/config/app_site.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/mine/presentation/provider/mine_notifier.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/app_config_service.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

class MineScreen extends ConsumerWidget {
  const MineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final state = ref.watch(mineProvider);
    final user = ref.watch(userProvider);
    final config = ref.watch(appConfigServiceProvider);
    final notifier = ref.read(mineProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.mine)),
      body: ListView(
        children: [
          Card(
            margin: const EdgeInsets.all(16),
            child: ListTile(
              leading: const Icon(Icons.person_outline),
              title: Text(state.userName),
              subtitle: Text('${l10n.uidLabel} ${user?.uid ?? ''}'),
            ),
          ),
          ListTile(
            key: const Key('mine_hotel_entry'),
            leading: const Icon(Icons.hotel_outlined),
            title: Text(l10n.hotelTitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => const HotelLocksRoute().push(context),
          ),
          ListTile(
            title: Text(l10n.site),
            trailing: DropdownButton<AppSite>(
              value: config.site,
              items: [
                DropdownMenuItem(value: AppSite.cn, child: Text(l10n.siteCn)),
                DropdownMenuItem(
                  value: AppSite.overseas,
                  child: Text(l10n.siteOverseas),
                ),
              ],
              onChanged: (site) {
                if (site != null) notifier.changeSite(site);
              },
            ),
          ),
          ListTile(
            title: Text(l10n.config),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => const ConfigRoute().push(context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: FilledButton(
              onPressed: () async {
                await notifier.logout();
                if (context.mounted) const LoginRoute().go(context);
              },
              child: Text(l10n.logout),
            ),
          ),
          ListTile(title: Text(l10n.about), subtitle: Text(state.version)),
        ],
      ),
    );
  }
}
