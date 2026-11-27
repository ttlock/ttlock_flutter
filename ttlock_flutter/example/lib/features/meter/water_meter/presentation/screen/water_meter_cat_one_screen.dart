import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/widget/meter_cat_one_view.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_cat_one_notifier.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_cat_one_state.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

/// 4G 网络页（spec §6.3）：未配置 / 已配置 / 网络失败重试 三态。
///
/// 同时是添加流程的兜底 —— 添加时 `configureCatOne` 失败后用户来这里重试，
/// 无需重新添加表。
class WaterMeterCatOneScreen extends ConsumerWidget {
  const WaterMeterCatOneScreen({super.key, required this.meterId});

  final int meterId;

  /// 字段 key → 本地化标签（key 与 l10n getter 同名）。
  String _label(AppLocalizations l10n, String key) => switch (key) {
    'meterCatOneRssiGrade' => l10n.meterCatOneRssiGrade,
    'meterCatOneNodeId' => l10n.meterCatOneNodeId,
    'meterCatOneCardNumber' => l10n.meterCatOneCardNumber,
    'meterCatOneOperator' => l10n.meterCatOneOperator,
    'meterCatOneImsi' => l10n.meterCatOneImsi,
    'meterCatOneApn' => l10n.meterCatOneApn,
    'meterCatOneOverseaCard' => l10n.meterCatOneOverseaCard,
    'meterCatOneUnconfigured' => l10n.meterCatOneUnconfigured,
    _ => key,
  };

  /// `rssiGrade`：3-强 / 2-中 / 1-差 / 0-未知（`catOneDetail.md:31`）。
  String _rssiGrade(AppLocalizations l10n, int grade) => switch (grade) {
    3 => l10n.meterCatOneRssiStrong,
    2 => l10n.meterCatOneRssiMedium,
    1 => l10n.meterCatOneRssiPoor,
    _ => l10n.meterCatOneRssiUnknown,
  };

  Future<void> _configure(
    BuildContext context,
    WidgetRef ref,
    WaterMeterCatOneState data,
  ) async {
    String? apn;
    if (data.needsApn) {
      apn = await const WaterMeterCatOneApnSheetRoute().push<String>(context);
      // 用户取消 → 不发车。
      if (apn == null) return;
    }
    if (!context.mounted) return;
    await ref
        .read(waterMeterCatOneProvider(meterId).notifier)
        .configure(apn: apn);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = waterMeterCatOneProvider(meterId);
    final state = ref.watch(provider);
    ref.listen(provider, (prev, next) {
      final err = next.value?.error;
      if (err != null && err != prev?.value?.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
        );
        ref.read(provider.notifier).clearError();
      }
    });

    final data = state.value;
    return Scaffold(
      key: const Key('water_meter_cat_one'),
      appBar: AppBar(title: Text(l10n.meterCatOne)),
      body: data == null
          ? _placeholder(state, l10n)
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    l10n.meterCatOneNeedNearby,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                if (data.configuring)
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                switch (data.step) {
                  WaterMeterCatOneStepUnavailable(:final error) => Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          getUserFriendlyMessage(error, l10n),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        FilledButton(
                          key: const Key('meter_cat_one_retry'),
                          onPressed: data.configuring
                              ? null
                              : () => ref.read(provider.notifier).refresh(),
                          child: Text(l10n.commonRetry),
                        ),
                      ],
                    ),
                  ),
                  WaterMeterCatOneStepUnconfigured() => _view(
                    l10n,
                    data,
                    onConfigure: () => _configure(context, ref, data),
                  ),
                  WaterMeterCatOneStepConfigured() => _view(
                    l10n,
                    data,
                    onConfigure: () => _configure(context, ref, data),
                  ),
                },
              ],
            ),
    );
  }

  Widget _view(
    AppLocalizations l10n,
    WaterMeterCatOneState data, {
    required VoidCallback onConfigure,
  }) {
    final info = switch (data.step) {
      WaterMeterCatOneStepUnconfigured() => null,
      WaterMeterCatOneStepConfigured(:final info) => info,
      WaterMeterCatOneStepUnavailable() => null,
    };
    return MeterCatOneView(
      info: info,
      // 配置进行中禁用按钮（回调给空实现，避免重复发车）。
      onConfigure: data.configuring ? () {} : onConfigure,
      label: (key) => _label(l10n, key),
      rssiGradeLabel: (grade) => _rssiGrade(l10n, grade),
      overseaYesLabel: l10n.meterCatOneYes,
      overseaNoLabel: l10n.meterCatOneNo,
      configureLabel: l10n.meterCatOneConfigureServer,
      reconfigureLabel: l10n.meterCatOneReconfigure,
    );
  }

  Widget _placeholder(
    AsyncValue<WaterMeterCatOneState> state,
    AppLocalizations l10n,
  ) {
    if (state.hasError) {
      final err = state.error;
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            getUserFriendlyMessage(
              err is AppException ? err : AppException.unknown(message: '$err'),
              l10n,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return const Center(child: CircularProgressIndicator());
  }
}
