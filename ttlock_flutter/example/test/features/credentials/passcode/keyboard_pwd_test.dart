import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_page_dto.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/data/data_source/keyboard_pwd_api.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/data/data_source/keyboard_pwd_data_source.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/data/model/keyboard_pwd_dto.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/data/repository/keyboard_pwd_repository.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';

class _MockKeyboardPwdApi extends Mock implements KeyboardPwdApi {}

void main() {
  test('KeyboardPwdDto fromJson + keyboardPwdType 枚举', () {
    final dto = KeyboardPwdDto.fromJson({
      'keyboardPwdId': 1,
      'lockId': 2,
      'keyboardPwd': '123456',
      'keyboardPwdType': 2,
      'isCustom': 1,
      'senderUsername': 'u',
    });
    final e = dto.toEntity();
    expect(e.keyboardPwdType, KeyboardPwdType.permanent);
    expect(e.isCustom, isTrue);
    expect(e.senderUsername, 'u');
  });

  test('KeyboardPwdType 1–14 与 get.md 对齐', () {
    expect(KeyboardPwdType.once.value, 1);
    expect(KeyboardPwdType.permanent.value, 2);
    expect(KeyboardPwdType.limited.value, 3);
    expect(KeyboardPwdType.delete.value, 4);
    expect(KeyboardPwdType.cyclicWeekend.value, 5);
    expect(KeyboardPwdType.cyclicDaily.value, 6);
    expect(KeyboardPwdType.cyclicWorkday.value, 7);
    expect(KeyboardPwdType.cyclicMonday.value, 8);
    expect(KeyboardPwdType.cyclicTuesday.value, 9);
    expect(KeyboardPwdType.cyclicWednesday.value, 10);
    expect(KeyboardPwdType.cyclicThursday.value, 11);
    expect(KeyboardPwdType.cyclicFriday.value, 12);
    expect(KeyboardPwdType.cyclicSaturday.value, 13);
    expect(KeyboardPwdType.cyclicSunday.value, 14);
    for (final t in KeyboardPwdType.values) {
      expect(KeyboardPwdType.fromValue(t.value), t);
    }
    expect(KeyboardPwdType.fromValue(null), KeyboardPwdType.limited);
    expect(KeyboardPwdType.fromValue(99), KeyboardPwdType.limited);
  });

  test('KeyboardPwdDto 容错：keyboardPwdType 为 String', () {
    final dto = KeyboardPwdDto.fromJson({
      'keyboardPwdId': '9',
      'lockId': '3',
      'keyboardPwdType': '3',
      'isCustom': '0',
    });
    final e = dto.toEntity();
    expect(e.keyboardPwdId, 9);
    expect(e.keyboardPwdType, KeyboardPwdType.limited);
    expect(e.isCustom, isFalse);
  });

  test('add 携带 addType=2（gatewayWifi）', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/keyboardPwd/add', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'keyboardPwdId': 24242};
      });
    }, data: Matchers.any);
    await KeyboardPwdApi(dio).add(
      lockId: 24451,
      keyboardPwd: '123456',
      keyboardPwdName: '测试',
      keyboardPwdType: 3,
      startDate: 1626945087000,
      endDate: 1746945087000,
      addType: ChannelType.gatewayWifi.value,
    );
    expect(sent?['lockId'], 24451);
    expect(sent?['keyboardPwd'], '123456');
    expect(sent?['addType'], 2);
    expect(sent?['keyboardPwdType'], 3);
  });

  test('change 携带 changeType=2（gatewayWifi）', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/keyboardPwd/change', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await KeyboardPwdApi(dio).change(
      lockId: 24451,
      keyboardPwdId: 123456,
      keyboardPwdName: '小明',
      newKeyboardPwd: '689768',
      startDate: 1626945087000,
      endDate: 1846945087000,
      changeType: ChannelType.gatewayWifi.value,
    );
    expect(sent?['lockId'], 24451);
    expect(sent?['keyboardPwdId'], 123456);
    expect(sent?['changeType'], 2);
    expect(sent?['newKeyboardPwd'], '689768');
  });

  test('delete 携带 deleteType=2（gatewayWifi）', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/keyboardPwd/delete', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await KeyboardPwdApi(dio).delete(
      lockId: 24451,
      keyboardPwdId: 10237,
      deleteType: ChannelType.gatewayWifi.value,
    );
    expect(sent?['lockId'], 24451);
    expect(sent?['keyboardPwdId'], 10237);
    expect(sent?['deleteType'], 2);
  });

  test('list 路径为 /v3/lock/listKeyboardPwd', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    var hit = false;
    adapter.onGet(
      '/v3/lock/listKeyboardPwd',
      (server) {
        server.reply(200, {
          'list': [
            {
              'keyboardPwdId': 3234293,
              'lockId': 532323,
              'keyboardPwd': '034234',
              'keyboardPwdName': '陈文亮',
              'keyboardPwdType': '3',
            },
          ],
          'pageNo': 1,
          'pageSize': 20,
          'pages': 1,
          'total': 1,
        });
        hit = true;
      },
      queryParameters: {
        'lockId': 1719,
        'pageNo': 1,
        'pageSize': 20,
        'orderBy': 1,
      },
    );
    final raw = await KeyboardPwdApi(dio).list(lockId: 1719);
    expect(hit, isTrue);
    expect(raw['list'], isA<List>());
  });

  test('KeyboardPwdRepository.list 经 mock Api 返回 List', () async {
    final api = _MockKeyboardPwdApi();
    when(
      () => api.list(
        lockId: 532323,
        searchStr: null,
        pageNo: 1,
        pageSize: 20,
        orderBy: 1,
      ),
    ).thenAnswer(
      (_) async => {
        'list': [
          {
            'keyboardPwdId': 3234293,
            'lockId': 532323,
            'keyboardPwd': '034234',
            'keyboardPwdName': '陈文亮',
            'keyboardPwdType': 3,
          },
        ],
        'pageNo': 1,
        'pageSize': 20,
        'pages': 1,
        'total': 1,
      },
    );
    final container = ProviderContainer(
      overrides: [keyboardPwdApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(keyboardPwdRepositoryProvider.notifier);
    final r = await repo.list(532323).run();
    expect(r, isA<Right<AppException, List<KeyboardPwdEntity>>>());
    final list = r.getOrElse((_) => const []);
    expect(list.single.keyboardPwdId, 3234293);
    expect(list.single.keyboardPwd, '034234');
  });

  test('KeyboardPwdDataSource.list 将裸 Map 解析为 OpenApiPageDto', () async {
    final api = _MockKeyboardPwdApi();
    when(
      () => api.list(
        lockId: 1,
        searchStr: '034',
        pageNo: 2,
        pageSize: 50,
        orderBy: 0,
      ),
    ).thenAnswer(
      (_) async => {
        'list': [
          {'keyboardPwdId': 9, 'lockId': 1, 'keyboardPwd': '034234'},
        ],
        'pageNo': 2,
        'pageSize': 50,
        'pages': 1,
        'total': 1,
      },
    );
    final container = ProviderContainer(
      overrides: [keyboardPwdApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(keyboardPwdDataSourceProvider.notifier);
    final r = await ds
        .list(lockId: 1, searchStr: '034', pageNo: 2, pageSize: 50, orderBy: 0)
        .run();
    final page = r.getOrElse((_) => throw TestFailure('expected Right'));
    expect(page, isA<OpenApiPageDto<KeyboardPwdDto>>());
    expect(page.list.single.keyboardPwdId, 9);
  });

  test('KeyboardPwdRepository.add 返回 keyboardPwdId', () async {
    final api = _MockKeyboardPwdApi();
    when(
      () => api.add(
        lockId: 24451,
        keyboardPwd: '123456',
        keyboardPwdName: '测试',
        keyboardPwdType: 3,
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        addType: ChannelType.gatewayWifi.value,
      ),
    ).thenAnswer((_) async => {'keyboardPwdId': 24242});
    final container = ProviderContainer(
      overrides: [keyboardPwdApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(keyboardPwdRepositoryProvider.notifier);
    final r = await repo
        .add(
          24451,
          keyboardPwd: '123456',
          keyboardPwdName: '测试',
          channel: ChannelType.gatewayWifi,
        )
        .run();
    expect(r.getOrElse((_) => 0), 24242);
  });

  test('add HTTP 200 errcode!=0 映射为 AppException', () async {
    final api = _MockKeyboardPwdApi();
    when(
      () => api.add(
        lockId: 1,
        keyboardPwd: 'dup',
        keyboardPwdName: any(named: 'keyboardPwdName'),
        keyboardPwdType: any(named: 'keyboardPwdType'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        addType: any(named: 'addType'),
      ),
    ).thenAnswer(
      (_) async => {'errcode': -3009, 'errmsg': '空间已满', 'description': ''},
    );
    final container = ProviderContainer(
      overrides: [keyboardPwdApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(keyboardPwdDataSourceProvider.notifier);
    final result = await ds
        .add(lockId: 1, keyboardPwd: 'dup', addType: ChannelType.bleSynced)
        .run();
    expect(result.isLeft(), isTrue);
    result.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, -3009);
    }, (_) => fail('expected Left'));
  });

  test('写接口 OpenApiEnvelope：errcode!=0 映射为 AppException', () async {
    final api = _MockKeyboardPwdApi();
    when(
      () => api.change(
        lockId: 1,
        keyboardPwdId: 2,
        keyboardPwdName: any(named: 'keyboardPwdName'),
        newKeyboardPwd: any(named: 'newKeyboardPwd'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        changeType: 2,
      ),
    ).thenAnswer(
      (_) async => const OpenApiEnvelope(errcode: 1, errmsg: 'fail'),
    );
    when(
      () => api.delete(lockId: 1, keyboardPwdId: 2, deleteType: 2),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [keyboardPwdApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(keyboardPwdDataSourceProvider.notifier);

    final failed = await ds
        .change(
          lockId: 1,
          keyboardPwdId: 2,
          changeType: ChannelType.gatewayWifi,
        )
        .run();
    expect(failed.isLeft(), isTrue);
    failed.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 1);
    }, (_) => fail('expected Left'));

    final deleted = await ds
        .delete(
          lockId: 1,
          keyboardPwdId: 2,
          deleteType: ChannelType.gatewayWifi,
        )
        .run();
    expect(deleted.getOrElse((_) => throw TestFailure('left')).isOk, isTrue);
  });

  test(
    'KeyboardPwdRepository.getRandom 映射 keyboardPwd/keyboardPwdId',
    () async {
      final api = _MockKeyboardPwdApi();
      when(
        () => api.getRandom(
          lockId: 1,
          keyboardPwdType: 3,
          keyboardPwdName: 't',
          startDate: 10,
          endDate: 20,
        ),
      ).thenAnswer(
        (_) async => {'keyboardPwd': '0563456', 'keyboardPwdId': 10236},
      );
      final container = ProviderContainer(
        overrides: [keyboardPwdApiProvider.overrideWithValue(api)],
      );
      addTearDown(container.dispose);
      final e =
          (await container
                  .read(keyboardPwdRepositoryProvider.notifier)
                  .getRandom(
                    1,
                    keyboardPwdType: KeyboardPwdType.limited,
                    keyboardPwdName: 't',
                    startDate: DateTime.fromMillisecondsSinceEpoch(10),
                    endDate: DateTime.fromMillisecondsSinceEpoch(20),
                  )
                  .run())
              .getOrElse((_) => throw TestFailure('left'));
      expect(e.keyboardPwd, '0563456');
      expect(e.keyboardPwdId, 10236);
    },
  );

  test('KeyboardPwdRepository.change / delete 映射 Unit', () async {
    final api = _MockKeyboardPwdApi();
    when(
      () => api.change(
        lockId: 24451,
        keyboardPwdId: 123456,
        keyboardPwdName: '新名',
        newKeyboardPwd: any(named: 'newKeyboardPwd'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        changeType: ChannelType.bleSynced.value,
      ),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(
      () => api.delete(
        lockId: 24451,
        keyboardPwdId: 10237,
        deleteType: ChannelType.gatewayWifi.value,
      ),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [keyboardPwdApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(keyboardPwdRepositoryProvider.notifier);

    final changed = await repo
        .change(24451, 123456, keyboardPwdName: '新名')
        .run();
    expect(changed, isA<Right<AppException, Unit>>());

    final deleted = await repo
        .delete(24451, 10237, channel: ChannelType.gatewayWifi)
        .run();
    expect(deleted, isA<Right<AppException, Unit>>());
  });
}
