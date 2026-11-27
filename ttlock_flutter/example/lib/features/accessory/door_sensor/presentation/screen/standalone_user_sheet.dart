import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/provider/standalone_door_sensor_domain.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// 独立门磁用户管理：列表 + 添加（账号 + 姓名）+ 逐项删除。
class StandaloneDoorSensorUserSheet extends ConsumerStatefulWidget {
  const StandaloneDoorSensorUserSheet({super.key, required this.item});

  final StandaloneDoorSensorEntity item;

  @override
  ConsumerState<StandaloneDoorSensorUserSheet> createState() =>
      _StandaloneDoorSensorUserSheetState();
}

class _StandaloneDoorSensorUserSheetState
    extends ConsumerState<StandaloneDoorSensorUserSheet> {
  final _accountController = TextEditingController();
  final _usernameController = TextEditingController();
  List<StandaloneDoorSensorUserEntity> _users = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _accountController.dispose();
    _usernameController.dispose();
    super.dispose();
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

  Future<void> _load() async {
    final r = await ref
        .read(standaloneDoorSensorDomainProvider.notifier)
        .listDoorSensorUser(widget.item.doorSensorId)
        .run();
    if (!mounted) return;
    r.fold(
      (err) {
        setState(() => _loading = false);
        _showError(err);
      },
      (users) => setState(() {
        _loading = false;
        _users = users;
      }),
    );
  }

  Future<void> _add() async {
    final account = _accountController.text.trim();
    final username = _usernameController.text.trim();
    if (account.isEmpty || username.isEmpty) return;
    final r = await ref
        .read(standaloneDoorSensorDomainProvider.notifier)
        .addDoorSensorUser(
          widget.item.doorSensorId,
          account: account,
          username: username,
        )
        .runWithLoading(status: ref.read(l10nProvider).loading);
    if (!mounted) return;
    r.fold(_showError, (_) {
      _accountController.clear();
      _usernameController.clear();
      _load();
    });
  }

  Future<void> _delete(StandaloneDoorSensorUserEntity user) async {
    final r = await ref
        .read(standaloneDoorSensorDomainProvider.notifier)
        .deleteDoorSensorUser(widget.item.doorSensorId, user.id)
        .runWithLoading(status: ref.read(l10nProvider).loading);
    if (!mounted) return;
    r.fold(_showError, (_) => _load());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return BaseBottomSheet(
      title: l10n.standaloneDoorUserManage,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            key: const Key('standalone_add_user_account_field'),
            controller: _accountController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: l10n.standaloneDoorAddUserAccountHint,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  key: const Key('standalone_add_user_field'),
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: l10n.standaloneDoorAddUserHint,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              FilledButton(
                key: const Key('standalone_add_user'),
                onPressed: _add,
                child: Text(l10n.standaloneDoorAddUser),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (_loading)
            const SizedBox(
              height: 80,
              child: Center(child: CircularProgressIndicator()),
            )
          else if (_users.isEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                l10n.standaloneDoorUserListEmpty,
                textAlign: TextAlign.center,
              ),
            )
          else
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _users.length,
                itemBuilder: (context, i) {
                  final user = _users[i];
                  return ListTile(
                    key: Key('standalone_user_${user.id}'),
                    leading: const Icon(Icons.person_outline),
                    title: Text(user.username),
                    trailing: IconButton(
                      key: Key('standalone_user_delete_${user.id}'),
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () => _delete(user),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
