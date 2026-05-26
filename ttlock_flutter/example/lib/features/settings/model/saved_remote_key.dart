import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_remote_key.freezed.dart';
part 'saved_remote_key.g.dart';

@freezed
abstract class SavedRemoteKey with _$SavedRemoteKey {
  const factory SavedRemoteKey({
    required String name,
    required String mac,
    required String boundLockMac,
    required DateTime initializedAt,
  }) = _SavedRemoteKey;

  factory SavedRemoteKey.fromJson(Map<String, dynamic> json) =>
      _$SavedRemoteKeyFromJson(json);
}
