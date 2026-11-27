import 'package:freezed_annotation/freezed_annotation.dart';

part 'lift.freezed.dart';

/// lift 域占位实体（当前仅写接口，无读模型）。
@freezed
abstract class LiftEntity with _$LiftEntity {
  const LiftEntity._();
  const factory LiftEntity() = _LiftEntity;
}
