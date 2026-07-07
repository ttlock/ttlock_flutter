import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:toastification/toastification.dart';

import '../../../core/router/routes.dart';
import '../../../core/storage/lock_list_provider.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/async_value_view.dart';
import '../model/credential_params.dart';
import 'face_provider.dart';

Future<void> clearAllFaces(
  BuildContext context,
  WidgetRef ref,
  String lockMac,
) async {
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Clear all faces on lock?'),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
        FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Clear')),
      ],
    ),
  );
  if (ok != true || !context.mounted) return;
  try {
    context.loaderOverlay.show();
    await ref.read(faceListProvider(lockMac).notifier).clearOnLock(lockMac);
    if (context.mounted) {
      context.loaderOverlay.hide();
      toastification.show(title: const Text('Faces cleared'));
    }
  } catch (e) {
    if (context.mounted) {
      context.loaderOverlay.hide();
      toastification.show(title: Text('$e'), type: ToastificationType.error);
    }
  }
}

Future<void> deleteFace(
  BuildContext context,
  WidgetRef ref,
  String lockMac,
  String faceNumber,
) async {
  try {
    context.loaderOverlay.show();
    await ref.read(faceListProvider(lockMac).notifier).deleteOnLock(lockMac, faceNumber);
    if (context.mounted) {
      context.loaderOverlay.hide();
      toastification.show(title: const Text('Face deleted'));
    }
  } catch (e) {
    if (context.mounted) {
      context.loaderOverlay.hide();
      toastification.show(title: Text('$e'), type: ToastificationType.error);
    }
  }
}

class FaceManagePage extends HookConsumerWidget {
  const FaceManagePage({super.key, required this.lockMac});

  final String lockMac;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lockAsync = ref.watch(lockByMacProvider(lockMac));
    final facesAsync = ref.watch(faceListProvider(lockMac));

    return Scaffold(
      appBar: AppBar(
        title: lockAsync.when(
          data: (l) => Text(l?.name ?? 'Faces'),
          loading: () => const Text('Faces'),
          error: (_, __) => const Text('Faces'),
        ),
        actions: [
          TextButton(
            onPressed: () => clearAllFaces(context, ref, lockMac),
            child: const Text('Clear All'),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => FaceAddRoute(lockMac).push(context),
          ),
        ],
      ),
      body: AsyncValueView.when(
        value: facesAsync,
        onRetry: (_, __) => ref.invalidate(faceListProvider(lockMac)),
        data: (faces) {
          if (faces.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  'No faces saved on this device.\nThe SDK cannot list faces from the lock; only faces added in this app are shown.\nTap + to enroll.',
                  style: AppTextStyles.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: faces.length,
            itemBuilder: (_, i) {
              final f = faces[i];
              return Card(
                child: ListTile(
                  title: Text('Face #${f.faceNumber}'),
                  subtitle: Text(formatCardValidityLabel(f.startDate, f.endDate)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => deleteFace(context, ref, lockMac, f.faceNumber),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
