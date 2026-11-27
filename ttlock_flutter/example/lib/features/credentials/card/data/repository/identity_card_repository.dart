import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/data/data_source/identity_card_data_source.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/entity/identity_card.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/repository/identity_card_repository_interface.dart';

part 'identity_card_repository.g.dart';

@Riverpod(keepAlive: true)
class IdentityCardRepository extends _$IdentityCardRepository
    implements IdentityCardRepositoryInterface {
  late final IdentityCardDataSource _dataSource;

  @override
  void build() {
    _dataSource = ref.watch(identityCardDataSourceProvider.notifier);
  }

  @override
  TaskEither<AppException, List<IdentityCardEntity>> list(int lockId) => _map(
    _dataSource.list(lockId: lockId),
    (page) => page.list.map((e) => e.toEntity()).toList(),
  );

  @override
  TaskEither<AppException, int> add(
    int lockId,
    String cardNumber, {
    String? cardName,
    DateTime? startDate,
    DateTime? endDate,
    CredentialType cardType = CredentialType.normal,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) => _dataSource.add(
    lockId: lockId,
    cardNumber: cardNumber,
    cardName: cardName,
    startDate: startDate?.millisecondsSinceEpoch ?? 0,
    endDate: endDate?.millisecondsSinceEpoch ?? 0,
    cardType: cardType,
    cyclicConfig: cyclicConfig,
    channel: channel,
  );

  @override
  TaskEither<AppException, Unit> changePeriod(
    int lockId,
    int cardId, {
    required DateTime startDate,
    required DateTime endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) => _dataSource
      .changePeriod(
        lockId: lockId,
        cardId: cardId,
        startDate: startDate.millisecondsSinceEpoch,
        endDate: endDate.millisecondsSinceEpoch,
        cyclicConfig: cyclicConfig,
        channel: channel,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> delete(
    int lockId,
    int cardId, {
    ChannelType channel = ChannelType.bleSynced,
  }) => _dataSource
      .delete(lockId: lockId, cardId: cardId, channel: channel)
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> clear(int lockId) =>
      _dataSource.clear(lockId: lockId).map((_) => unit);

  @override
  TaskEither<AppException, Unit> rename(int lockId, int cardId, String name) =>
      _dataSource
          .rename(lockId: lockId, cardId: cardId, cardName: name)
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
            message: 'IC卡数据转换失败: $error',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    });
  });
}
