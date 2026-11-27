import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/widget/water_meter_list_content.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class WaterMeterListScreen extends ConsumerWidget {
  const WaterMeterListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.waterMeterTitle)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => const WaterMeterAddRoute().push(context),
        child: const Icon(Icons.add),
      ),
      body: const WaterMeterListContent(),
    );
  }
}
