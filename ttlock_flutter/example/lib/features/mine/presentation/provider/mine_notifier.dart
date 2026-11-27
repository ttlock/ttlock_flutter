import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/config/app_site.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/mine/presentation/provider/mine_state.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/app_config_service.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_service.dart';

part 'mine_notifier.g.dart';

const kAppVersion = '1.0.0';

String siteLabelOf(AppSite site, AppLocalizations l10n) => switch (site) {
  AppSite.cn => l10n.siteCn,
  AppSite.overseas => l10n.siteOverseas,
};

@Riverpod()
class MineNotifier extends _$MineNotifier {
  @override
  MineState build() {
    final user = ref.watch(userProvider);
    final config = ref.watch(appConfigServiceProvider);
    final l10n = ref.watch(l10nProvider);
    return MineState(
      userName: user?.loginName ?? '',
      siteLabel: siteLabelOf(config.site, l10n),
      version: kAppVersion,
    );
  }

  Future<void> load() async {
    final user = ref.read(userProvider);
    final config = ref.read(appConfigServiceProvider.notifier).current;
    final l10n = ref.read(l10nProvider);
    state = MineState(
      userName: user?.loginName ?? '',
      siteLabel: siteLabelOf(config.site, l10n),
      version: kAppVersion,
    );
  }

  Future<void> changeSite(AppSite site) async {
    final current = ref.read(appConfigServiceProvider.notifier).current;
    await ref
        .read(appConfigServiceProvider.notifier)
        .update(current.copyWith(site: site));
    await load();
  }

  Future<void> logout() async {
    await ref.read(userServiceProvider.notifier).logout();
  }
}
