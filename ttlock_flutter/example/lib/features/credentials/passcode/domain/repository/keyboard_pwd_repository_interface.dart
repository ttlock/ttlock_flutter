import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';

abstract class KeyboardPwdRepositoryInterface {
  TaskEither<AppException, List<KeyboardPwdEntity>> list(
    int lockId, {
    String? searchStr,
    int pageNo = 1,
    int pageSize = 20,
    int orderBy = 1,
  });

  TaskEither<AppException, int> add(
    int lockId, {
    required String keyboardPwd,
    String? keyboardPwdName,
    KeyboardPwdType keyboardPwdType = KeyboardPwdType.limited,
    DateTime? startDate,
    DateTime? endDate,
    ChannelType channel = ChannelType.bleSynced,
  });

  TaskEither<AppException, Unit> change(
    int lockId,
    int keyboardPwdId, {
    String? keyboardPwdName,
    String? newKeyboardPwd,
    DateTime? startDate,
    DateTime? endDate,
    ChannelType channel = ChannelType.bleSynced,
  });

  TaskEither<AppException, Unit> delete(
    int lockId,
    int keyboardPwdId, {
    ChannelType channel = ChannelType.bleSynced,
  });

  TaskEither<AppException, KeyboardPwdEntity> getRandom(
    int lockId, {
    required KeyboardPwdType keyboardPwdType,
    String? keyboardPwdName,
    required DateTime startDate,
    DateTime? endDate,
  });
}
