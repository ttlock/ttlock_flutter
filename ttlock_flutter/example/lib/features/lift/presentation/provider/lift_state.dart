import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';

part 'lift_state.freezed.dart';

/// 梯控激活结果，供 UI 选择提示文案。
enum LiftActivateOutcome { succeeded, bleFallback, bleActivatedSyncFailed }

/// 梯控配置写成功类型（工作模式 / 关联楼层），供 UI 选文案。
enum LiftConfigOutcome { workModeSaved, controlableFloorsSaved }

@freezed
abstract class LiftState with _$LiftState {
  const LiftState._();
  const factory LiftState({
    @Default(<int>{}) Set<int> selectedFloors,
    @Default(false) bool operating,
    AppException? error,
    LiftActivateOutcome? outcome,
    LiftConfigOutcome? configOutcome,
  }) = _LiftState;
}
