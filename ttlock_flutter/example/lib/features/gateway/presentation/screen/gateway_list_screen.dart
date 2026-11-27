import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/widget/gateway_list_content.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class GatewayListScreen extends ConsumerWidget {
  const GatewayListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.gatewayTitle)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => const GatewayAddRoute().push(context),
        child: const Icon(Icons.add),
      ),
      body: const GatewayListContent(),
    );
  }
}
