import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/entity/qr_code.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/provider/qr_code_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/presentation/provider/qr_code_detail_state.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/presentation/qr_code_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';

part 'qr_code_detail_notifier.g.dart';

@Riverpod()
class QrCodeDetailNotifier extends _$QrCodeDetailNotifier {
  late QrCodeDetailArgs _args;

  QrCodeDomain get _domain => ref.read(qrCodeDomainProvider.notifier);

  @override
  QrCodeDetailState build(QrCodeDetailArgs args) {
    _args = args;
    return QrCodeDetailState(qrCode: args.qrCode);
  }

  void clearError() => state = state.copyWith(error: null);

  /// 刷新 `qrCodeContent`；未到有效期时可能为空，仅保留 link。
  Future<void> refreshData() async {
    state = state.copyWith(operating: true, error: null);
    final r = await _domain
        .getData(state.qrCode.qrCodeId)
        .runWithLoading(status: ref.read(l10nProvider).loading);
    r.fold(
      (err) => state = state.copyWith(operating: false, error: err),
      (entity) => state = state.copyWith(
        operating: false,
        qrCode: state.qrCode.copyWith(
          link: entity.link.isNotEmpty ? entity.link : state.qrCode.link,
          qrCodeContent: entity.qrCodeContent,
          qrCodeNumber: entity.qrCodeNumber.isNotEmpty
              ? entity.qrCodeNumber
              : state.qrCode.qrCodeNumber,
          name: entity.name.isNotEmpty ? entity.name : state.qrCode.name,
          type: entity.type,
          startDate: entity.startDate ?? state.qrCode.startDate,
          endDate: entity.endDate ?? state.qrCode.endDate,
          cyclicConfig: entity.cyclicConfig.isNotEmpty
              ? entity.cyclicConfig
              : state.qrCode.cyclicConfig,
          status: entity.status != 0 ? entity.status : state.qrCode.status,
        ),
        error: null,
      ),
    );
  }

  Future<void> changePeriod(
    DateTime start,
    DateTime end, {
    CyclicSchedule? schedule,
  }) => _runUnit(
    _domain.changePeriod(
      lock: _args.lock,
      qrCode: state.qrCode,
      start: start,
      end: end,
      schedule: schedule,
    ),
    (qr) {
      if (qr.type == QrCodeType.cycle && schedule != null) {
        return qr.copyWith(
          startDate: cyclicDayStart(start),
          endDate: cyclicDayEnd(end),
          cyclicConfig: schedule.toCyclicConfig(),
        );
      }
      return qr.copyWith(startDate: start, endDate: end);
    },
  );

  Future<bool> delete() async {
    state = state.copyWith(operating: true, error: null);
    final r = await _domain
        .delete(lock: _args.lock, qrCode: state.qrCode)
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
    QrCodeEntity Function(QrCodeEntity) update,
  ) async {
    state = state.copyWith(operating: true, error: null);
    final r = await task.runWithLoading(status: ref.read(l10nProvider).loading);
    r.fold(
      (err) => state = state.copyWith(operating: false, error: err),
      (_) => state = state.copyWith(
        operating: false,
        qrCode: update(state.qrCode),
      ),
    );
  }
}
