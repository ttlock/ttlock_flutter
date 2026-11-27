import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/provider/face_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/provider/face_photo_add_state.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';

part 'face_photo_add_notifier.g.dart';

const _maxPhotoBytes = 2 * 1024 * 1024;

@Riverpod()
class FacePhotoAddNotifier extends _$FacePhotoAddNotifier {
  late LockEntity _lock;
  late FaceDomain _domain;

  @override
  FacePhotoAddState build(LockEntity lock) {
    _lock = lock;
    _domain = ref.read(faceDomainProvider.notifier);
    return const FacePhotoAddState();
  }

  void setKind(CredentialValidityKind kind) {
    if (kind == CredentialValidityKind.permanent) {
      state = state.copyWith(kind: kind);
      return;
    }
    final now = DateTime.now();
    state = state.copyWith(
      kind: kind,
      startDate: state.startDate ?? now,
      endDate: state.endDate ?? now.add(const Duration(days: 7)),
    );
  }

  void setStartDate(DateTime value) => state = state.copyWith(startDate: value);

  void setEndDate(DateTime value) => state = state.copyWith(endDate: value);

  void setSchedule(CyclicSchedule? value) =>
      state = state.copyWith(schedule: value);

  void clearError() =>
      state = state.copyWith(error: null, photoTooLarge: false);

  void clearPhoto() =>
      state = state.copyWith(imageBytes: null, photoTooLarge: false);

  void setPhoto(List<int> bytes) {
    if (bytes.length > _maxPhotoBytes) {
      state = state.copyWith(
        imageBytes: null,
        photoTooLarge: true,
        error: null,
      );
      return;
    }
    state = state.copyWith(
      imageBytes: bytes,
      photoTooLarge: false,
      error: null,
    );
  }

  Future<bool> submit({String? name}) async {
    final bytes = state.imageBytes;
    if (bytes == null) return false;
    try {
      resolveValidity(
        kind: state.kind,
        start: state.startDate,
        end: state.endDate,
        schedule: state.schedule,
      );
    } on ArgumentError {
      state = state.copyWith(
        error: AppException.business(
          code: -24,
          message: 'invalid_cyclic_schedule',
        ),
      );
      return false;
    }
    state = state.copyWith(submitting: true, error: null);
    final featureR = await _domain.extractFeature(_lock.lockId, bytes).run();
    final featureData = featureR.fold<String?>((err) {
      state = state.copyWith(submitting: false, error: err);
      return null;
    }, (data) => data);
    if (featureData == null) return false;

    var isYiNuo = false;
    try {
      isYiNuo = await runBle(
        () => TTLock.lock.supportFunction(
          TTLockFunction.yiNuoPhotoFace,
          _lock.lockData,
        ),
      );
    } on Object {
      isYiNuo = false;
    }

    final r = await _domain
        .addByPhoto(
          lockId: _lock.lockId,
          lockData: _lock.lockData,
          hasGateway: _lock.hasGateway,
          isYiNuo: isYiNuo,
          featureData: featureData,
          name: name,
          kind: state.kind,
          start: state.startDate,
          end: state.endDate,
          schedule: state.schedule,
        )
        .run();
    return r.fold(
      (err) {
        state = state.copyWith(submitting: false, error: err);
        return false;
      },
      (_) {
        state = state.copyWith(submitting: false);
        return true;
      },
    );
  }
}
