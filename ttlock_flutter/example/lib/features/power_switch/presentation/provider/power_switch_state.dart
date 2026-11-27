import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';

part 'power_switch_state.freezed.dart';

/// 取电配置写成功类型（工作模式 / 关联门锁），供 UI 选文案。
enum PowerSwitchConfigOutcome { workModeSaved, controlableLockSaved }

@freezed
abstract class PowerSwitchState with _$PowerSwitchState {
  const PowerSwitchState._();
  const factory PowerSwitchState({
    @Default(false) bool operating,
    AppException? error,
    PowerSwitchConfigOutcome? configOutcome,
  }) = _PowerSwitchState;
}
