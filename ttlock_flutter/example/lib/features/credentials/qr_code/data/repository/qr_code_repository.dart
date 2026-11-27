import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/data/data_source/qr_code_data_source.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/entity/qr_code.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/repository/qr_code_repository_interface.dart';

part 'qr_code_repository.g.dart';

@Riverpod(keepAlive: true)
class QrCodeRepository extends _$QrCodeRepository
    implements QrCodeRepositoryInterface {
  late final QrCodeDataSource _dataSource;

  @override
  void build() {
    _dataSource = ref.watch(qrCodeDataSourceProvider.notifier);
  }

  @override
  TaskEither<AppException, PageState<QrCodeEntity>> list(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
    String? name,
  }) => _map(
    _dataSource.list(
      lockId: lockId,
      pageNo: pageNo,
      pageSize: pageSize,
      name: name,
    ),
    (page) => PageState(
      data: page.list.map((e) => e.toEntity()).toList(),
      currentPage: page.pageNo,
      pageSize: page.pageSize,
      total: page.total,
    ),
  );

  @override
  TaskEither<AppException, QrCodeEntity> add(
    int lockId, {
    String? qrCodeName,
    String? qrCodeNumber,
    DateTime? startDate,
    DateTime? endDate,
    QrCodeType type = QrCodeType.limited,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.cloudOnly,
  }) => _dataSource.add(
    lockId: lockId,
    qrCodeName: qrCodeName,
    qrCodeNumber: qrCodeNumber,
    startDate: startDate,
    endDate: endDate,
    type: type,
    cyclicConfig: cyclicConfig,
    channel: channel,
  );

  @override
  TaskEither<AppException, Unit> update(
    int qrCodeId, {
    required QrCodeType type,
    String? name,
    DateTime? startDate,
    DateTime? endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.cloudOnly,
  }) => _dataSource
      .update(
        qrCodeId: qrCodeId,
        type: type,
        name: name,
        startDate: startDate,
        endDate: endDate,
        cyclicConfig: cyclicConfig,
        channel: channel,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, QrCodeEntity> getData(int qrCodeId) =>
      _dataSource.getData(qrCodeId: qrCodeId);

  @override
  TaskEither<AppException, Unit> delete(
    int lockId,
    int qrCodeId, {
    ChannelType channel = ChannelType.cloudOnly,
  }) => _dataSource
      .delete(lockId: lockId, qrCodeId: qrCodeId, channel: channel)
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> clear(int lockId) =>
      _dataSource.clear(lockId: lockId).map((_) => unit);

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
            message: '二维码数据转换失败: $error',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    });
  });
}
