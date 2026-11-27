import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/entity/face.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/provider/face_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/face_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/provider/face_detail_state.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';

part 'face_detail_notifier.g.dart';

@Riverpod()
class FaceDetailNotifier extends _$FaceDetailNotifier {
  late FaceDetailArgs _args;

  FaceDomain get _domain => ref.read(faceDomainProvider.notifier);

  @override
  FaceDetailState build(FaceDetailArgs args) {
    _args = args;
    return FaceDetailState(item: args.item);
  }

  void clearError() => state = state.copyWith(error: null);

  Future<void> rename(String name) => _runUnit(
    _domain.rename(lock: _args.lock, face: state.item, name: name.trim()),
    (item) => item.copyWith(name: name.trim()),
  );

  Future<void> changePeriod(
    DateTime start,
    DateTime end, {
    CyclicSchedule? schedule,
  }) => _runUnit(
    _domain.changePeriod(
      lock: _args.lock,
      face: state.item,
      start: start,
      end: end,
      schedule: schedule,
    ),
    (item) {
      if (item.type == CredentialType.cycle && schedule != null) {
        return item.copyWith(
          startDate: cyclicDayStart(start),
          endDate: cyclicDayEnd(end),
          cyclicConfig: schedule.toCyclicConfig(),
        );
      }
      return item.copyWith(startDate: start, endDate: end);
    },
  );

  Future<bool> delete() async {
    state = state.copyWith(operating: true, error: null);
    final r = await _domain
        .delete(lock: _args.lock, face: state.item)
        .runWithLoading(status: ref.read(l10nProvider).loading);
    return r.fold(
      (err) {
        state = state.copyWith(operating: false, error: err);
        return false;
      },
      (_) {
        state = state.copyWith(operating: false);
        return true;
      },
    );
  }

  Future<void> _runUnit(
    TaskEither<AppException, Unit> task,
    FaceEntity Function(FaceEntity) update,
  ) async {
    state = state.copyWith(operating: true, error: null);
    final r = await task.runWithLoading(status: ref.read(l10nProvider).loading);
    r.fold(
      (err) => state = state.copyWith(operating: false, error: err),
      (_) => state = state.copyWith(operating: false, item: update(state.item)),
    );
  }
}
