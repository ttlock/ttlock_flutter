import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_keypad.freezed.dart';
part 'saved_keypad.g.dart';

@freezed
abstract class SavedKeypad with _$SavedKeypad {
  const factory SavedKeypad({
    required String name,
    required String mac,
    required String boundLockMac,
    @Default(false) bool isMultiFunction,
    required DateTime initializedAt,
  }) = _SavedKeypad;

  factory SavedKeypad.fromJson(Map<String, dynamic> json) =>
      _$SavedKeypadFromJson(json);
}
