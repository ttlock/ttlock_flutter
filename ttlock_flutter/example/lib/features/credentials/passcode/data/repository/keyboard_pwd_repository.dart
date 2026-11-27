import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/data/data_source/keyboard_pwd_data_source.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/repository/keyboard_pwd_repository_interface.dart';

part 'keyboard_pwd_repository.g.dart';

@Riverpod(keepAlive: true)
class KeyboardPwdRepository extends _$KeyboardPwdRepository
    implements KeyboardPwdRepositoryInterface {
  late final KeyboardPwdDataSource _dataSource;

  @override
  void build() {
    _dataSource = ref.watch(keyboardPwdDataSourceProvider.notifier);
  }

  @override
  TaskEither<AppException, List<KeyboardPwdEntity>> list(
    int lockId, {
    String? searchStr,
    int pageNo = 1,
    int pageSize = 20,
    int orderBy = 1,
  }) => _map(
    _dataSource.list(
      lockId: lockId,
      searchStr: searchStr,
      pageNo: pageNo,
      pageSize: pageSize,
      orderBy: orderBy,
    ),
    (page) => page.list.map((e) => e.toEntity()).toList(),
  );

  @override
  TaskEither<AppException, int> add(
    int lockId, {
    required String keyboardPwd,
    String? keyboardPwdName,
    KeyboardPwdType keyboardPwdType = KeyboardPwdType.limited,
    DateTime? startDate,
    DateTime? endDate,
    ChannelType channel = ChannelType.bleSynced,
  }) => _dataSource.add(
    lockId: lockId,
    keyboardPwd: keyboardPwd,
    keyboardPwdName: keyboardPwdName,
    keyboardPwdType: keyboardPwdType,
    startDate: startDate,
    endDate: endDate,
    addType: channel,
  );

  @override
  TaskEither<AppException, KeyboardPwdEntity> getRandom(
    int lockId, {
    required KeyboardPwdType keyboardPwdType,
    String? keyboardPwdName,
    required DateTime startDate,
    DateTime? endDate,
  }) => _map(
    _dataSource.getRandom(
      lockId: lockId,
      keyboardPwdType: keyboardPwdType,
      keyboardPwdName: keyboardPwdName,
      startDate: startDate,
      endDate: endDate,
    ),
    (json) => KeyboardPwdEntity(
      keyboardPwdId: intFromDynamic(json['keyboardPwdId']),
      lockId: lockId,
      keyboardPwd: json['keyboardPwd'] as String? ?? '',
      keyboardPwdName: keyboardPwdName ?? '',
      keyboardPwdType: keyboardPwdType,
      startDate: startDate,
      endDate: endDate,
    ),
  );

  @override
  TaskEither<AppException, Unit> change(
    int lockId,
    int keyboardPwdId, {
    String? keyboardPwdName,
    String? newKeyboardPwd,
    DateTime? startDate,
    DateTime? endDate,
    ChannelType channel = ChannelType.bleSynced,
  }) => _dataSource
      .change(
        lockId: lockId,
        keyboardPwdId: keyboardPwdId,
        keyboardPwdName: keyboardPwdName,
        newKeyboardPwd: newKeyboardPwd,
        startDate: startDate,
        endDate: endDate,
        changeType: channel,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> delete(
    int lockId,
    int keyboardPwdId, {
    ChannelType channel = ChannelType.bleSynced,
  }) => _dataSource
      .delete(lockId: lockId, keyboardPwdId: keyboardPwdId, deleteType: channel)
      .map((_) => unit);

  TaskEither<AppException, R> _map<T, R>(
    TaskEither<AppException, T> call,
    R Function(T) mapper,
  ) => TaskEither(() async {
    final result = await call.run();
    return result.fold(Left.new, (dto) {
      try {
        return Right(mapper(dto));
      } catch (error, stackTrace) {
        return Left(
          AppException.parse(
            message: '密码数据转换失败: $error',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    });
  });
}
