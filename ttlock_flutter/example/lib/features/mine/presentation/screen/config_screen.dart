// Callers: ConfigRoute. Affected API: save→login when guest; no back on force setup.
// Schema: none. User: 强制完善 clientId/Secret 后再登录.
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/config/app_site.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/app_config_service.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

class ConfigScreen extends HookConsumerWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final config = ref.watch(appConfigServiceProvider);
    final loggedIn = ref.watch(userProvider)?.accessToken.isNotEmpty == true;
    final forceSetup = !config.hasCredentials && !loggedIn;
    final clientIdController = useTextEditingController(text: config.clientId);
    final clientSecretController = useTextEditingController(
      text: config.clientSecret,
    );
    final site = useState(config.site);

    Future<void> onSave() async {
      final id = clientIdController.text.trim();
      final secret = clientSecretController.text.trim();
      if (id.isEmpty || secret.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.configCredentialsRequired)));
        return;
      }
      await ref
          .read(appConfigServiceProvider.notifier)
          .update(
            AppConfig(clientId: id, clientSecret: secret, site: site.value),
          );
      if (!context.mounted) return;
      if (!loggedIn) {
        const LoginRoute().go(context);
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.saveSuccess)));
      }
    }

    return PopScope(
      canPop: !forceSetup,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.config),
          automaticallyImplyLeading: !forceSetup,
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            if (forceSetup) ...[
              Text(
                l10n.configSetupHint,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
            ],
            TextField(
              controller: clientIdController,
              decoration: InputDecoration(labelText: l10n.clientId),
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: clientSecretController,
              obscureText: true,
              decoration: InputDecoration(labelText: l10n.clientSecret),
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(l10n.site),
                const Spacer(),
                DropdownButton<AppSite>(
                  value: site.value,
                  items: [
                    DropdownMenuItem(
                      value: AppSite.cn,
                      child: Text(l10n.siteCn),
                    ),
                    DropdownMenuItem(
                      value: AppSite.overseas,
                      child: Text(l10n.siteOverseas),
                    ),
                  ],
                  onChanged: (v) {
                    if (v != null) site.value = v;
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 48,
              child: FilledButton(onPressed: onSave, child: Text(l10n.save)),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.configLocalHint,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
