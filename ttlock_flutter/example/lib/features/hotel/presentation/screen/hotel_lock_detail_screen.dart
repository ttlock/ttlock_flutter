import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/grouping/hotel_lock_grouping.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/provider/hotel_lock_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/provider/hotel_lock_detail_state.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

/// 酒店锁详情页。
///
/// `hotelLock` 为 null 时（深链进入、无 `$extra`）降级为不可用提示——
/// 本页唯一入口是列表页卡片（必带 `$extra`），深链场景不在交付范围。
/// 若将来要支持深链，可改为按 [lockId] 走一次 `listHotelLocks` 兜底查询。
class HotelLockDetailScreen extends ConsumerWidget {
  const HotelLockDetailScreen({
    super.key,
    required this.lockId,
    this.hotelLock,
    this.hotelType = 1,
  });

  final int lockId;
  final HotelLockEntity? hotelLock;

  /// 列表筛选类型：1-酒店锁、2-梯控、3-取电。
  final int hotelType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    // 先绑局部变量：`hotelLock` 是**公开** final 字段，Dart 只提升**私有** final
    // 字段，故必须在 `lock != null` 分支里用 `lock`。
    final lock = hotelLock;
    if (lock == null) {
      return Scaffold(
        key: const Key('hotel_lock_detail'),
        appBar: AppBar(title: Text(l10n.hotelTitle)),
        body: Center(child: Text(l10n.hotelLoadFailed)),
      );
    }

    final args = HotelLockDetailArgs(lock: lock);
    final state = ref.watch(hotelLockDetailNotifierProvider(args));
    final notifier = ref.read(hotelLockDetailNotifierProvider(args).notifier);
    // 展示一律走 state.lock：路由 `$extra` 不会随提交变。
    final displayLock = state.lock ?? lock;

    return Scaffold(
      key: const Key('hotel_lock_detail'),
      appBar: AppBar(title: Text(displayLock.lockAlias)),
      body: ListView(
        children: [
          if (state.cloudPending)
            _CloudPendingBanner(
              label: l10n.hotelCloudPending,
              retryLabel: l10n.hotelCloudRetry,
              onRetry: notifier.retryCloudSync,
            ),
          if (state.error != null)
            _ErrorRow(
              message: getUserFriendlyMessage(state.error!, l10n),
              onDismiss: notifier.clearError,
            ),
          _InfoSection(lock: displayLock, l10n: l10n),
          const Divider(),
          _ActionsSection(
            lock: displayLock,
            lockId: lockId,
            hotelType: hotelType,
            state: state,
            l10n: l10n,
            onLoadIcKey: notifier.loadIcKey,
          ),
        ],
      ),
    );
  }
}

/// 操作入口：扇区（双轨）、楼栋/楼层（BLE 单轨）、IC 密钥（按需拉取）；
/// `hotelType==2` 时另有梯控三入口（工作模式 / 关联楼层 / 楼层激活）；
/// `hotelType==3` 时另有取电二入口（工作模式 / 关联门锁）；
/// 打开通用锁详情（`$extra` 可空，目标页自拉 detail）。
class _ActionsSection extends StatelessWidget {
  const _ActionsSection({
    required this.lock,
    required this.lockId,
    required this.hotelType,
    required this.state,
    required this.l10n,
    required this.onLoadIcKey,
  });

  final HotelLockEntity lock;
  final int lockId;

  /// 1-酒店锁、2-梯控、3-取电。
  final int hotelType;
  final HotelLockDetailState state;
  final AppLocalizations l10n;
  final Future<void> Function() onLoadIcKey;

  @override
  Widget build(BuildContext context) {
    // 与列表分组一致：名称优先，否则回退编号（写楼栋只改 number）。
    final buildingFloor =
        '${buildingKeyOf(lock)} ${floorKeyOf(lock)}'.trim();
    return Column(
      children: [
        ListTile(
          key: const Key('hotel_action_sector'),
          leading: const Icon(Icons.grid_view_outlined),
          title: Text(l10n.hotelSector),
          subtitle: Text(lock.sector.isEmpty ? l10n.notSelected : lock.sector),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => HotelSectorRoute($extra: lock).push(context),
        ),
        ListTile(
          key: const Key('hotel_action_building'),
          leading: const Icon(Icons.apartment_outlined),
          title: Text(l10n.hotelBuildingFloor),
          subtitle: Text(
            buildingFloor.isEmpty ? l10n.notSelected : buildingFloor,
          ),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => HotelBuildingRoute($extra: lock).push(context),
        ),
        _IcKeyTile(state: state, onLoad: onLoadIcKey, l10n: l10n),
        // listByHotel type=2 为梯控：工作模式 / 关联楼层 / 楼层激活。
        if (hotelType == 2) ...[
          ListTile(
            key: const Key('hotel_action_lift_work_mode'),
            leading: const Icon(Icons.tune_outlined),
            title: Text(l10n.liftWorkMode),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => LiftWorkModeRoute(
              lockId: lockId,
              $extra: lock.toLockEntity(),
            ).push(context),
          ),
          ListTile(
            key: const Key('hotel_action_lift_controlable'),
            leading: const Icon(Icons.layers_outlined),
            title: Text(l10n.liftControlableFloors),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => LiftControlableFloorsRoute(
              lockId: lockId,
              $extra: lock.toLockEntity(),
            ).push(context),
          ),
          ListTile(
            key: const Key('hotel_action_lift_activate'),
            leading: const Icon(Icons.directions_subway),
            title: Text(l10n.liftActivateEntry),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => LiftRoute(
              lockId: lockId,
              $extra: lock.toLockEntity(),
            ).push(context),
          ),
        ],
        // listByHotel type=3 为取电：工作模式 / 关联门锁。
        if (hotelType == 3) ...[
          ListTile(
            key: const Key('hotel_action_power_switch_work_mode'),
            leading: const Icon(Icons.tune_outlined),
            title: Text(l10n.powerSwitchWorkMode),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => PowerSwitchWorkModeRoute(
              lockId: lockId,
              $extra: lock.toLockEntity(),
            ).push(context),
          ),
          ListTile(
            key: const Key('hotel_action_power_switch_controlable'),
            leading: const Icon(Icons.link_outlined),
            title: Text(l10n.powerSwitchControlableLock),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => PowerSwitchControlableLockRoute(
              lockId: lockId,
              $extra: lock.toLockEntity(),
            ).push(context),
          ),
        ],
        ListTile(
          key: const Key('hotel_action_open_lock'),
          leading: const Icon(Icons.lock_outline),
          title: Text(l10n.hotelOpenLockDetail),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => LockDetailRoute(
            lockId: lockId,
            $extra: lock.toLockEntity(),
          ).push(context),
        ),
      ],
    );
  }
}

/// `cloudPending` 横幅：锁的扇区**已改**、仅云端未同步，故文案与「设置失败」
/// 区分，并提供只重发云端那一步的重试入口。
class _CloudPendingBanner extends StatelessWidget {
  const _CloudPendingBanner({
    required this.label,
    required this.retryLabel,
    required this.onRetry,
  });

  final String label;
  final String retryLabel;
  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      key: const Key('hotel_cloud_pending_banner'),
      color: scheme.tertiaryContainer,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(Icons.cloud_off_outlined, color: scheme.onTertiaryContainer),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: TextStyle(color: scheme.onTertiaryContainer),
            ),
          ),
          TextButton(
            key: const Key('hotel_cloud_retry'),
            onPressed: onRetry,
            child: Text(retryLabel),
          ),
        ],
      ),
    );
  }
}

class _ErrorRow extends StatelessWidget {
  const _ErrorRow({required this.message, required this.onDismiss});

  final String message;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      color: scheme.errorContainer,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: scheme.onErrorContainer),
            ),
          ),
          IconButton(
            key: const Key('hotel_error_dismiss'),
            icon: const Icon(Icons.close),
            onPressed: onDismiss,
          ),
        ],
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  const _InfoSection({required this.lock, required this.l10n});

  final HotelLockEntity lock;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final initDate = lock.initDate;
    return Column(
      children: [
        // 别名带前缀渲染，避免与 AppBar 标题重复成两个同文案节点。
        _infoTile('${l10n.hotelAlias}: ${lock.lockAlias}'),
        if (lock.lockMac.isNotEmpty)
          _infoTile('${l10n.hotelMac}: ${lock.lockMac}'),
        _infoTile('${l10n.hotelElectricQuantity}: ${lock.electricQuantity}%'),
        if (initDate != null)
          _infoTile('${l10n.hotelInitDate}: ${_formatDateTime(initDate)}'),
        if (lock.groupName.isNotEmpty)
          _infoTile('${l10n.hotelGroupName}: ${lock.groupName}'),
      ],
    );
  }

  Widget _infoTile(String text) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
    child: Align(alignment: Alignment.centerLeft, child: Text(text)),
  );
}

/// IC 密钥按需拉取（不在 initState 预取）：失败只影响该区块。
class _IcKeyTile extends StatelessWidget {
  const _IcKeyTile({
    required this.state,
    required this.onLoad,
    required this.l10n,
  });

  final HotelLockDetailState state;
  final Future<void> Function() onLoad;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final icKey = state.icKey;
    return ListTile(
      key: const Key('hotel_action_ic_key'),
      leading: const Icon(Icons.vpn_key_outlined),
      title: Text(l10n.hotelIcKey),
      subtitle: _subtitle(icKey, l10n),
      trailing: state.icKeyLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : icKey == null
          ? TextButton(onPressed: onLoad, child: Text(l10n.hotelGetIcKey))
          : IconButton(
              icon: const Icon(Icons.copy_outlined),
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: icKey));
                if (!context.mounted) return;
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(l10n.hotelCopySuccess)));
              },
            ),
    );
  }

  Widget? _subtitle(String? icKey, AppLocalizations l10n) {
    if (state.icKeyLoading) return null;
    if (state.icKeyError != null) return Text(l10n.cardEncoderUnavailable);
    if (icKey == null) return null;
    return Text(icKey, style: const TextStyle(fontFamily: 'monospace'));
  }
}

String _formatDateTime(DateTime d) {
  String two(int v) => v.toString().padLeft(2, '0');
  return '${d.year}-${two(d.month)}-${two(d.day)} '
      '${two(d.hour)}:${two(d.minute)}';
}
