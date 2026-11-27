import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/entity/face.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/face_enroll_capability.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/face_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/face_period.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/provider/face_list_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';

class FaceListScreen extends ConsumerWidget {
  const FaceListScreen({super.key, required this.lockId, this.lock});
  final int lockId;
  final LockEntity? lock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = faceListProvider(lockId);
    final state = ref.watch(provider);
    final currentLock = lock ?? LockEntity(lockId: lockId);
    return Scaffold(
      key: const Key('face_list'),
      appBar: AppBar(title: Text(l10n.face)),
      floatingActionButton: FloatingActionButton(
        tooltip: l10n.face,
        onPressed: () => _onAdd(context, ref, currentLock, l10n),
        child: const Icon(Icons.add),
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(
          child: Text(
            getUserFriendlyMessage(
              ExceptionUtils.extractAppException(e, st),
              l10n,
            ),
          ),
        ),
        data: (data) {
          if (data.items.isEmpty) {
            return Center(child: Text(l10n.noFaces));
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(provider.notifier).refresh(),
            child: ListView.builder(
              itemCount: data.items.length,
              itemBuilder: (context, i) {
                final item = data.items[i];
                return _FaceTile(
                  face: item,
                  l10n: l10n,
                  onTap: () async {
                    await FaceDetailRoute(
                      $extra: FaceDetailArgs(lock: currentLock, item: item),
                    ).push<bool>(context);
                    await ref.read(provider.notifier).refresh();
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> _onAdd(
    BuildContext context,
    WidgetRef ref,
    LockEntity currentLock,
    AppLocalizations l10n,
  ) async {
    late final List<bool> bits;
    try {
      bits = await Future.wait([
        _supports(TTLockFunction.face, currentLock.lockData),
        _supports(TTLockFunction.yiNuoPhotoFace, currentLock.lockData),
        _supports(TTLockFunction.zhiAnPhotoFace, currentLock.lockData),
        _supports(
          TTLockFunction.zhiAnFaceFeatureSecondGeneration,
          currentLock.lockData,
        ),
        _supports(
          TTLockFunction.yiShengPhotoFace,
          currentLock.lockData,
        ),
      ]);
    } on Object catch (e, st) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            getUserFriendlyMessage(
              ExceptionUtils.extractAppException(e, st),
              l10n,
            ),
          ),
        ),
      );
      return;
    }
    final cap = resolveFaceEnrollCapability(
      supportsFace: bits[0],
      supportsYiNuoPhotoFace: bits[1],
      supportsZhiAnPhotoFace: bits[2],
      supportsZhiAnFace2ndGen: bits[3],
      supportsYiShengPhotoFace: bits[4],
    );
    if (!context.mounted) return;
    var added = false;
    switch (resolveFaceEnrollEntry(cap)) {
      case FaceEnrollEntryAction.showMethodSheet:
        final choice = await FaceEnrollMethodRoute(
          $extra: currentLock,
        ).push<FaceEnrollEntryAction>(context);
        if (!context.mounted) return;
        if (choice == FaceEnrollEntryAction.lockOnly) {
          added =
              await FaceAddRoute($extra: currentLock).push<bool>(context) ??
              false;
        } else if (choice == FaceEnrollEntryAction.photoOnly) {
          added =
              await FacePhotoAddRoute(
                $extra: currentLock,
              ).push<bool>(context) ??
              false;
        }
      case FaceEnrollEntryAction.photoOnly:
        added =
            await FacePhotoAddRoute($extra: currentLock).push<bool>(context) ??
            false;
      case FaceEnrollEntryAction.lockOnly:
        added =
            await FaceAddRoute($extra: currentLock).push<bool>(context) ??
            false;
    }
    if (added) {
      await ref.read(faceListProvider(lockId).notifier).refresh();
    }
  }

  Future<bool> _supports(
    TTLockFunction function,
    String lockData,
  ) async {
    try {
      return await runBle(
        () => TTLock.lock.supportFunction(function, lockData),
      );
    } on Object {
      return false;
    }
  }
}

class _FaceTile extends StatelessWidget {
  const _FaceTile({
    required this.face,
    required this.l10n,
    required this.onTap,
  });
  final FaceEntity face;
  final AppLocalizations l10n;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final title = face.name.isNotEmpty
        ? face.name
        : (face.faceNumber.isNotEmpty ? face.faceNumber : l10n.face);
    return ListTile(
      leading: const Icon(Icons.face),
      title: Text(title),
      subtitle: Text(formatFacePeriod(face, l10n)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
