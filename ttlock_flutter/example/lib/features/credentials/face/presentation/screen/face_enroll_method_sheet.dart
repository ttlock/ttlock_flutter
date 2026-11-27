import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/face_enroll_capability.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

class FaceEnrollMethodSheet extends ConsumerWidget {
  const FaceEnrollMethodSheet({super.key, required this.lock});
  final LockEntity lock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    return BaseBottomSheet(
      title: l10n.face,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: const Icon(Icons.videocam_outlined),
            title: Text(l10n.faceEnrollOnLock),
            onTap: () =>
                Navigator.of(context).pop(FaceEnrollEntryAction.lockOnly),
          ),
          ListTile(
            leading: const Icon(Icons.photo_outlined),
            title: Text(l10n.faceEnrollByPhoto),
            onTap: () =>
                Navigator.of(context).pop(FaceEnrollEntryAction.photoOnly),
          ),
        ],
      ),
    );
  }
}
