import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/data/data_source/qr_code_api.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/data/data_source/qr_code_data_source.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/data/model/qr_code_dto.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/data/repository/qr_code_repository.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/entity/qr_code.dart';

class _MockQrCodeApi extends Mock implements QrCodeApi {}

void main() {
  test('QrCodeDto fromJson：name 字段与 qrCodeName 别名', () {
    final fromName = QrCodeDto.fromJson({'qrCodeId': 1, 'name': '门禁码'});
    expect(fromName.toEntity().name, '门禁码');

    final fromAlias = QrCodeDto.fromJson({'qrCodeId': 1, 'qrCodeName': '门禁码'});
    expect(fromAlias.toEntity().name, '门禁码');
  });

  test('QrCodeDto 完整字段与 QrCodeType 枚举', () {
    final dto = QrCodeDto.fromJson({
      'qrCodeId': 34242,
      'lockId': 163377,
      'type': 2,
      'qrCodeNumber': '2',
      'name': '给小明的二维码',
      'startDate': 1625025703000,
      'endDate': 1665025703000,
      'refreshTime': 10,
      'cyclicConfig': [
        {'weekDay': 1, 'startTime': 480, 'endTime': 1080},
      ],
      'createDate': 1625025703000,
      'status': 1,
      'creator': '二房东',
      'link': 'https://ttekey.com/q?k=Gc5Wg6Hh',
      'qrCodeVersion': 1,
    });
    final e = dto.toEntity();
    expect(e.qrCodeId, 34242);
    expect(e.lockId, 163377);
    expect(e.type, QrCodeType.permanent);
    expect(e.qrCodeNumber, '2');
    expect(e.name, '给小明的二维码');
    expect(e.startDate, DateTime.fromMillisecondsSinceEpoch(1625025703000));
    expect(e.cyclicConfig.single.weekDay, 1);
    expect(e.status, 1);
    expect(e.link, 'https://ttekey.com/q?k=Gc5Wg6Hh');
    expect(e.qrCodeVersion, 1);
  });

  test('QrCodeRepository.list 经 mock Api 返回 PageState', () async {
    final api = _MockQrCodeApi();
    when(
      () => api.list(lockId: 163377, pageNo: 1, pageSize: 20, name: null),
    ).thenAnswer(
      (_) async => {
        'list': [
          {'qrCodeId': 34242, 'lockId': 163377, 'type': 1, 'name': '给小明的二维码'},
        ],
        'pageNo': 1,
        'pageSize': 20,
        'pages': 1,
        'total': 1,
      },
    );
    final container = ProviderContainer(
      overrides: [qrCodeApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(qrCodeRepositoryProvider.notifier);
    final r = await repo.list(163377).run();
    expect(r, isA<Right<AppException, dynamic>>());
    final page = r.getOrElse((_) => throw TestFailure('left'));
    expect(page.data.single.qrCodeId, 34242);
    expect(page.total, 1);
  });

  test('QrCodeRepository.add 返回 QrCodeEntity', () async {
    final api = _MockQrCodeApi();
    when(
      () => api.add(
        lockId: 163377,
        name: '给小明的二维码',
        type: 1,
        addType: 0,
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        refreshTime: any(named: 'refreshTime'),
        cyclicConfig: any(named: 'cyclicConfig'),
        qrCodeNumber: any(named: 'qrCodeNumber'),
      ),
    ).thenAnswer(
      (_) async => {
        'qrCodeId': 34242,
        'qrCodeNumber': 1,
        'link': 'https://ttekey.com/q?k=Gc5Wg6Hh',
      },
    );
    final container = ProviderContainer(
      overrides: [qrCodeApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(qrCodeRepositoryProvider.notifier);
    final e =
        (await repo
                .add(
                  163377,
                  qrCodeName: '给小明的二维码',
                  channel: ChannelType.cloudOnly,
                )
                .run())
            .getOrElse((_) => throw TestFailure('left'));
    expect(e.qrCodeId, 34242);
    expect(e.qrCodeNumber, '1');
    expect(e.link, 'https://ttekey.com/q?k=Gc5Wg6Hh');
  });

  test('QrCodeRepository.getData 返回 qrCodeContent', () async {
    final api = _MockQrCodeApi();
    when(() => api.getData(qrCodeId: 34242)).thenAnswer(
      (_) async => {
        'qrCodeId': 34242,
        'qrCodeContent': 'QR_CONTENT_XYZ',
        'link': 'https://ttekey.com/q?k=Gc5Wg6Hh',
      },
    );
    final container = ProviderContainer(
      overrides: [qrCodeApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final e =
        (await container
                .read(qrCodeRepositoryProvider.notifier)
                .getData(34242)
                .run())
            .getOrElse((_) => throw TestFailure('left'));
    expect(e.qrCodeContent, 'QR_CONTENT_XYZ');
    expect(e.qrCodeId, 34242);
  });

  test('qrCode/delete 默认 deleteType=0（ChannelType.cloudOnly）', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/qrCode/delete', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await QrCodeApi(dio).delete(
      lockId: 163377,
      qrCodeId: 34242,
      deleteType: ChannelType.cloudOnly.value,
    );
    expect(sent?['lockId'], 163377);
    expect(sent?['qrCodeId'], 34242);
    expect(sent?['deleteType'], 0);
  });

  test('QrCodeRepository.delete cloudOnly 映射 deleteType=0', () async {
    final api = _MockQrCodeApi();
    when(
      () => api.delete(lockId: 163377, qrCodeId: 34242, deleteType: 0),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [qrCodeApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(qrCodeRepositoryProvider.notifier);
    final r = await repo
        .delete(163377, 34242, channel: ChannelType.cloudOnly)
        .run();
    expect(r, isA<Right<AppException, Unit>>());
    verify(
      () => api.delete(lockId: 163377, qrCodeId: 34242, deleteType: 0),
    ).called(1);
  });

  test('QrCodeRepository.clear 映射 Unit', () async {
    final api = _MockQrCodeApi();
    when(
      () => api.clear(lockId: 163377, type: 0),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [qrCodeApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(qrCodeRepositoryProvider.notifier);
    final r = await repo.clear(163377).run();
    expect(r, isA<Right<AppException, Unit>>());
  });

  test('写接口 errcode!=0 映射为 AppException', () async {
    final api = _MockQrCodeApi();
    when(
      () => api.delete(lockId: 163377, qrCodeId: 1, deleteType: 0),
    ).thenAnswer(
      (_) async => const OpenApiEnvelope(errcode: 10007, errmsg: '不存在'),
    );
    final container = ProviderContainer(
      overrides: [qrCodeApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(qrCodeDataSourceProvider.notifier);
    final result = await ds
        .delete(lockId: 163377, qrCodeId: 1, channel: ChannelType.cloudOnly)
        .run();
    expect(result.isLeft(), isTrue);
    result.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 10007);
    }, (_) => fail('expected Left'));
  });
}
