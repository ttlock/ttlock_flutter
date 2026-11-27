import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/data/data_source/face_api.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/data/data_source/face_data_source.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/data/model/face_dto.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/data/repository/face_repository.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/entity/face.dart';

class _MockFaceApi extends Mock implements FaceApi {}

void main() {
  setUpAll(() {
    registerFallbackValue(<MultipartFile>[
      MultipartFile.fromBytes(const [0], filename: 'fallback.jpg'),
    ]);
  });

  test('FaceDto fromJson maps faceName to entity name', () {
    final e = FaceDto.fromJson({'faceId': 1, 'faceName': '门口'}).toEntity();
    expect(e.faceId, 1);
    expect(e.name, '门口');
  });

  test('FaceDto fromJson maps cloud list fields', () {
    final e = FaceDto.fromJson({
      'faceId': 224242,
      'lockId': 163377,
      'faceNumber': '44668054142981',
      'faceType': 1,
      'faceName': '妈妈的正脸',
      'startDate': 1625025703000,
      'endDate': 1645025703000,
      'createDate': 1625025703000,
      'nick': 'alexa@google.com',
      'status': '1',
    }).toEntity();
    expect(e.faceNumber, '44668054142981');
    expect(e.type, CredentialType.normal);
    expect(e.nickname, 'alexa@google.com');
    expect(e.status, EntityStatus.normal);
    expect(e.startDate, DateTime.fromMillisecondsSinceEpoch(1625025703000));
  });

  test('FaceDto fromJson accepts canonical name/type/nickname fields', () {
    final e = FaceDto.fromJson({
      'faceId': 2,
      'name': '侧脸',
      'type': 4,
      'nickname': 'admin',
      'status': '3',
    }).toEntity();
    expect(e.name, '侧脸');
    expect(e.type, CredentialType.cycle);
    expect(e.nickname, 'admin');
    expect(e.status, EntityStatus.pending);
  });

  test('FaceDto cyclicConfig 与 faceType 循环', () {
    final dto = FaceDto.fromJson({
      'faceType': 4,
      'cyclicConfig': [
        {'weekDay': 1, 'startTime': 480, 'endTime': 1080},
      ],
    });
    final entity = dto.toEntity();
    expect(entity.type, CredentialType.cycle);
    expect(entity.cyclicConfig.single.startTime, 480);
  });

  test('FaceRepository.list returns entities via mock Api', () async {
    final api = _MockFaceApi();
    when(
      () => api.list(lockId: 163377, pageNo: 1, pageSize: 200, searchStr: null),
    ).thenAnswer(
      (_) async => {
        'list': [
          {
            'faceId': 224242,
            'lockId': 163377,
            'faceName': '妈妈的正脸',
            'faceNumber': '44668054142981',
          },
        ],
        'pageNo': 1,
        'pageSize': 200,
        'pages': 1,
        'total': 1,
      },
    );
    final container = ProviderContainer(
      overrides: [faceApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(faceRepositoryProvider.notifier);
    final r = await repo.list(163377).run();
    expect(r, isA<Right<AppException, List<FaceEntity>>>());
    final list = r.getOrElse((_) => const []);
    expect(list.single.faceId, 224242);
    expect(list.single.name, '妈妈的正脸');
  });

  test('FaceRepository.add returns faceId', () async {
    final api = _MockFaceApi();
    when(
      () => api.add(
        lockId: 163377,
        name: '新脸',
        faceNumber: '123',
        startDate: 0,
        endDate: 0,
        type: null,
        addType: ChannelType.gatewayWifi.value,
        featureData: null,
        cyclicConfig: null,
      ),
    ).thenAnswer((_) async => {'faceId': 124242});
    final container = ProviderContainer(
      overrides: [faceApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(faceRepositoryProvider.notifier);
    final r = await repo
        .add(
          163377,
          faceName: '新脸',
          faceNumber: '123',
          channel: ChannelType.gatewayWifi,
        )
        .run();
    expect(r.getOrElse((_) => 0), 124242);
  });

  test('FaceRepository.changePeriod 转发 type=channel.value', () async {
    final api = _MockFaceApi();
    when(
      () => api.changePeriod(
        lockId: 163377,
        faceId: 224242,
        startDate: 10,
        endDate: 20,
        type: ChannelType.gatewayWifi.value,
        cyclicConfig: null,
      ),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [faceApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(faceRepositoryProvider.notifier);
    final r = await repo
        .changePeriod(
          163377,
          224242,
          startDate: DateTime.fromMillisecondsSinceEpoch(10),
          endDate: DateTime.fromMillisecondsSinceEpoch(20),
          channel: ChannelType.gatewayWifi,
        )
        .run();
    expect(r, isA<Right<AppException, Unit>>());
    verify(
      () => api.changePeriod(
        lockId: 163377,
        faceId: 224242,
        startDate: 10,
        endDate: 20,
        type: ChannelType.gatewayWifi.value,
        cyclicConfig: null,
      ),
    ).called(1);
  });

  test('FaceDataSource.add 转发 featureData', () async {
    final api = _MockFaceApi();
    when(
      () => api.add(
        lockId: 1,
        name: 'n',
        faceNumber: null,
        startDate: 0,
        endDate: 0,
        type: null,
        addType: 2,
        featureData: 'AABB',
        cyclicConfig: null,
      ),
    ).thenAnswer((_) async => {'faceId': 9});
    final container = ProviderContainer(
      overrides: [faceApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(faceDataSourceProvider.notifier);
    final id =
        (await ds
                .add(
                  lockId: 1,
                  faceName: 'n',
                  startDate: DateTime.fromMillisecondsSinceEpoch(0),
                  endDate: DateTime.fromMillisecondsSinceEpoch(0),
                  channel: ChannelType.gatewayWifi,
                  featureData: 'AABB',
                )
                .run())
            .getOrElse((_) => throw TestFailure('left'));
    expect(id, 9);
  });

  test('getFeatureDataByPhoto 解析 featureData', () async {
    final api = _MockFaceApi();
    when(
      () => api.getFeatureDataByPhoto(any(), lockId: 1),
    ).thenAnswer((_) async => {'featureData': 'F0E4'});
    final container = ProviderContainer(
      overrides: [faceApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(faceDataSourceProvider.notifier);
    final data =
        (await ds.getFeatureDataByPhoto(lockId: 1, imageBytes: [1, 2, 3]).run())
            .getOrElse((_) => throw TestFailure('left'));
    expect(data, 'F0E4');
  });

  test('face/delete 使用 type 字段（非 deleteType）', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/face/delete', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await FaceApi(dio).delete(
      lockId: 163377,
      faceId: 224242,
      type: ChannelType.gatewayWifi.value,
    );
    expect(sent?['type'], ChannelType.gatewayWifi.value);
    expect(sent?.containsKey('deleteType'), isFalse);
    expect(sent?['faceId'], 224242);
    expect(sent?['lockId'], 163377);
  });

  test('face/add 使用 addType 通道字段', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/face/add', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'faceId': 99};
      });
    }, data: Matchers.any);
    await FaceApi(dio).add(
      lockId: 1,
      name: '测试',
      startDate: 0,
      endDate: 0,
      addType: ChannelType.bleSynced.value,
    );
    expect(sent?['addType'], ChannelType.bleSynced.value);
    expect(sent?['name'], '测试');
  });

  test('写接口 errcode!=0 映射为 AppException', () async {
    final api = _MockFaceApi();
    when(
      () => api.delete(lockId: 1, faceId: 2, type: ChannelType.bleSynced.value),
    ).thenAnswer(
      (_) async => const OpenApiEnvelope(errcode: 10007, errmsg: '失败'),
    );
    final container = ProviderContainer(
      overrides: [faceApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(faceDataSourceProvider.notifier);
    final result = await ds
        .delete(lockId: 1, faceId: 2, channel: ChannelType.bleSynced)
        .run();
    expect(result.isLeft(), isTrue);
    result.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 10007);
    }, (_) => fail('expected Left'));
  });

  test('FaceRepository delete / clear / rename 映射 Unit', () async {
    final api = _MockFaceApi();
    when(
      () => api.delete(
        lockId: 163377,
        faceId: 224242,
        type: ChannelType.gatewayWifi.value,
      ),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(
      () => api.clear(lockId: 163377),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(
      () => api.rename(lockId: 163377, faceId: 224242, name: '新名'),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [faceApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(faceRepositoryProvider.notifier);

    final deleted = await repo
        .delete(163377, 224242, channel: ChannelType.gatewayWifi)
        .run();
    expect(deleted, isA<Right<AppException, Unit>>());

    final cleared = await repo.clear(163377).run();
    expect(cleared, isA<Right<AppException, Unit>>());

    final renamed = await repo.rename(163377, 224242, '新名').run();
    expect(renamed, isA<Right<AppException, Unit>>());
  });
}
