import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class UserSession with _$UserSession {
  const UserSession._();
  const factory UserSession({
    required String accessToken,
    required String refreshToken,
    @Default(0) int uid,
    @Default(0) int expiresIn,
    @Default('') String loginName,
    @Default(0) int obtainedAt,
  }) = _UserSession;

  bool get isExpired {
    if (expiresIn <= 0) return false;
    final expiredAtMs = obtainedAt + expiresIn * 1000;
    return DateTime.now().millisecondsSinceEpoch >= expiredAtMs;
  }
}

@freezed
abstract class CloudUser with _$CloudUser {
  const factory CloudUser({
    @Default('') String username,
    @Default(0) int registeredAt,
  }) = _CloudUser;
}

@freezed
abstract class CloudUserPage with _$CloudUserPage {
  const factory CloudUserPage({
    @Default([]) List<CloudUser> list,
    @Default(1) int pageNo,
    @Default(20) int pageSize,
    @Default(0) int pages,
    @Default(0) int total,
  }) = _CloudUserPage;
}
