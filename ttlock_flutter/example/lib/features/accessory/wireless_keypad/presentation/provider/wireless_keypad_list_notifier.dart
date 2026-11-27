import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/wireless_keypad.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/provider/wireless_keypad_domain.dart';

part 'wireless_keypad_list_notifier.g.dart';

@Riverpod()
class WirelessKeypadListNotifier extends _$WirelessKeypadListNotifier {
  @override
  Future<List<WirelessKeypadEntity>> build(int lockId) async {
    final r = await ref
        .read(wirelessKeypadDomainProvider.notifier)
        .listByLock(lockId)
        .run();
    return r.fold((l) => throw l, (list) => list);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final r = await ref
          .read(wirelessKeypadDomainProvider.notifier)
          .listByLock(lockId)
          .run();
      return r.fold((l) => throw l, (list) => list);
    });
  }
}
