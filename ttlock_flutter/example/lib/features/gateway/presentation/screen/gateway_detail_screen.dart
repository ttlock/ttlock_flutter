import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/entity/gateway.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/provider/gateway_domain.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/gateway_args.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/provider/gateway_list_notifier.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class GatewayDetailScreen extends ConsumerStatefulWidget {
  const GatewayDetailScreen({super.key, required this.args});

  final GatewayDetailArgs args;

  @override
  ConsumerState<GatewayDetailScreen> createState() =>
      _GatewayDetailScreenState();
}

class _GatewayDetailScreenState extends ConsumerState<GatewayDetailScreen> {
  late GatewayEntity _gateway;

  @override
  void initState() {
    super.initState();
    _gateway = widget.args.gateway;
  }

  void _showError(Object error) {
    final l10n = ref.read(l10nProvider);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          getUserFriendlyMessage(
            ExceptionUtils.extractAppException(error, StackTrace.current),
            l10n,
          ),
        ),
      ),
    );
  }

  Future<void> _rename() async {
    final name = await GatewayRenameSheetRoute(
      $extra: _gateway,
    ).push<String>(context);
    if (name == null || name.isEmpty || !mounted) return;
    final r = await ref
        .read(gatewayDomainProvider.notifier)
        .rename(_gateway.gatewayId, name)
        .runWithLoading(status: ref.read(l10nProvider).loading);
    if (!mounted) return;
    r.fold(_showError, (_) {
      ref.invalidate(gatewayListProvider);
      setState(() => _gateway = _gateway.copyWith(gatewayName: name));
    });
  }

  Future<void> _delete() async {
    final confirmed = await GatewayDeleteConfirmSheetRoute(
      $extra: _gateway,
    ).push<bool>(context);
    if (confirmed != true || !mounted) return;
    final r = await ref
        .read(gatewayDomainProvider.notifier)
        .delete(_gateway.gatewayId)
        .runWithLoading(status: ref.read(l10nProvider).loading);
    if (!mounted) return;
    r.fold(_showError, (_) {
      ref.invalidate(gatewayListProvider);
      Navigator.of(context).pop(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final theme = Theme.of(context);
    return Scaffold(
      key: const Key('gateway_detail'),
      appBar: AppBar(
        title: Text(
          _gateway.gatewayName.isEmpty
              ? _gateway.gatewayMac
              : _gateway.gatewayName,
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(l10n.gatewayNameLabel),
            subtitle: Text(
              _gateway.gatewayName.isEmpty ? '—' : _gateway.gatewayName,
            ),
          ),
          ListTile(
            title: Text(l10n.macLabel),
            subtitle: Text(
              _gateway.gatewayMac.isEmpty ? '—' : _gateway.gatewayMac,
            ),
          ),
          ListTile(
            title: Text(l10n.gatewayVersion),
            subtitle: Text(_gateway.gatewayVersion.label),
          ),
          ListTile(
            title: Text(l10n.gatewayNetworkName),
            subtitle: Text(
              _gateway.networkName.isEmpty ? '—' : _gateway.networkName,
            ),
          ),
          ListTile(
            title: Text(l10n.gatewayNetworkMac),
            subtitle: Text(
              _gateway.networkMac.isEmpty ? '—' : _gateway.networkMac,
            ),
          ),
          ListTile(
            title: Text(l10n.gatewayLockCount),
            subtitle: Text('${_gateway.lockNum}'),
          ),
          ListTile(
            title: Text(l10n.online),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.circle,
                  size: 10,
                  color: _gateway.isOnline ? Colors.green : theme.disabledColor,
                ),
                const SizedBox(width: 4),
                Text(_gateway.isOnline ? l10n.online : l10n.offline),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            key: const Key('gateway_rename'),
            leading: const Icon(Icons.drive_file_rename_outline),
            title: Text(l10n.gatewayRename),
            onTap: _rename,
          ),
          ListTile(
            key: const Key('gateway_delete'),
            leading: Icon(Icons.delete_outline, color: theme.colorScheme.error),
            title: Text(
              l10n.gatewayDeleteConfirm,
              style: TextStyle(color: theme.colorScheme.error),
            ),
            onTap: _delete,
          ),
        ],
      ),
    );
  }
}
