import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/widget/standalone_list_content.dart';

class StandaloneDoorSensorListScreen extends ConsumerWidget {
  const StandaloneDoorSensorListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    return Scaffold(
      key: const Key('standalone_door_sensor_list'),
      appBar: AppBar(title: Text(l10n.standaloneDoorSensorTitle)),
      body: const StandaloneDoorSensorListContent(),
    );
  }
}
