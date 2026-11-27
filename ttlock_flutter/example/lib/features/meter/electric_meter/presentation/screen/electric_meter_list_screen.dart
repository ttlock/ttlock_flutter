import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/widget/electric_meter_list_content.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class ElectricMeterListScreen extends ConsumerWidget {
  const ElectricMeterListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.electricMeterTitle)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => const ElectricMeterAddRoute().push(context),
        child: const Icon(Icons.add),
      ),
      body: const ElectricMeterListContent(),
    );
  }
}
