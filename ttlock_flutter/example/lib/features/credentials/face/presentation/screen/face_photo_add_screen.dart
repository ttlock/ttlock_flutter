import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/provider/face_photo_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/credential_date_range_fields.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/credential_validity_picker.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/recurring_schedule_field.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class FacePhotoAddScreen extends ConsumerStatefulWidget {
  const FacePhotoAddScreen({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<FacePhotoAddScreen> createState() => _FacePhotoAddScreenState();
}

class _FacePhotoAddScreenState extends ConsumerState<FacePhotoAddScreen> {
  final _name = TextEditingController();
  final _picker = ImagePicker();

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  Future<void> _pick(ImageSource source) async {
    final file = await _picker.pickImage(
      source: source,
      maxWidth: 720,
      imageQuality: 50,
    );
    if (file == null || !mounted) return;
    final bytes = await file.readAsBytes();
    if (!mounted) return;
    ref.read(facePhotoAddProvider(widget.lock).notifier).setPhoto(bytes);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final provider = facePhotoAddProvider(widget.lock);
    final state = ref.watch(provider);
    ref.listen(provider, (prev, next) {
      if (next.photoTooLarge && next.photoTooLarge != prev?.photoTooLarge) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.facePhotoTooLarge)));
        ref.read(provider.notifier).clearError();
      }
      final err = next.error;
      if (err != null && err != prev?.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
        );
        ref.read(provider.notifier).clearError();
      }
    });
    final busy = state.submitting;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.facePhotoPickTitle)),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          16 + MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.facePhotoHint),
            const SizedBox(height: 12),
            TextField(
              controller: _name,
              decoration: InputDecoration(labelText: l10n.faceName),
              enabled: !busy,
            ),
            CredentialValidityPicker(
              value: state.kind,
              showCyclic: state.showCyclic,
              enabled: !busy,
              onChanged: (v) => ref.read(provider.notifier).setKind(v),
            ),
            CredentialDateRangeFields(
              kind: state.kind,
              start: state.startDate,
              end: state.endDate,
              enabled: !busy,
              onStart: (v) => ref.read(provider.notifier).setStartDate(v),
              onEnd: (v) => ref.read(provider.notifier).setEndDate(v),
            ),
            if (state.kind == CredentialValidityKind.cyclic)
              RecurringScheduleField(
                value: state.schedule,
                enabled: !busy,
                onChanged: (v) => ref.read(provider.notifier).setSchedule(v),
              ),
            if (state.imageBytes != null) ...[
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.memory(
                  Uint8List.fromList(state.imageBytes!),
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
            ],
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: busy ? null : () => _pick(ImageSource.gallery),
              child: Text(l10n.facePhotoFromGallery),
            ),
            OutlinedButton(
              onPressed: busy ? null : () => _pick(ImageSource.camera),
              child: Text(l10n.facePhotoFromCamera),
            ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: busy || state.imageBytes == null
                  ? null
                  : () async {
                      final ok = await ref
                          .read(provider.notifier)
                          .submit(name: _name.text);
                      if (ok && context.mounted) {
                        Navigator.of(context).pop(true);
                      }
                    },
              child: Text(busy ? l10n.facePhotoExtracting : l10n.commonSave),
            ),
            if (busy)
              const Padding(
                padding: EdgeInsets.only(top: 12),
                child: Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
