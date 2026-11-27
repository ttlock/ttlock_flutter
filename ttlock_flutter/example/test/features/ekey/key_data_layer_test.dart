import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/features/ekey/data/data_source/key_api.dart';
import 'package:ttlock_flutter_demo/features/ekey/data/data_source/key_data_source.dart';
import 'package:ttlock_flutter_demo/features/ekey/data/model/key_dto.dart';
import 'package:ttlock_flutter_demo/features/ekey/data/repository/key_repository.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/entity/key.dart';

class _MockKeyApi extends Mock implements KeyApi {}

void main() {
  test('KeyDto fromJson + userType/keyStatus 枚举', () {
    final dto = KeyDto.fromJson({
      'keyId': 1,
      'lockId': 2,
      'lockData': 'ld',
      'userType': '110301',
      'keyStatus': '110401',
      'lockAlias': 'A',
    });
    final e = dto.toEntity();
    expect(e.keyId, 1);
    expect(e.userType, KeyUserType.admin);
    expect(e.keyStatus, KeyStatus.normal);
  });

  test('KeyDto fromJson 含时间戳与 Int 型 bool 字段', () {
    final dto = KeyDto.fromJson({
      'keyId': '1',
      'lockId': 2,
      'startDate': 1528878944000,
      'endDate': 1628878944000,
      'keyRight': 1,
      'remoteEnable': 1,
      'passageMode': 2,
      'keyStatus': '110405',
      'userType': '110302',
    });
    final e = dto.toEntity();
    expect(e.startDate, DateTime.fromMillisecondsSinceEpoch(1528878944000));
    expect(e.endDate, DateTime.fromMillisecondsSinceEpoch(1628878944000));
    expect(e.keyRight, isTrue);
    expect(e.remoteEnable, isTrue);
    expect(e.passageMode, isFalse);
    expect(e.keyStatus, KeyStatus.frozen);
    expect(e.userType, KeyUserType.normal);
  });

  test('KeyRepository.list 走 /v3/lock/listKey 并带 username', () async {
    final api = _MockKeyApi();
    when(
      () => api.listByLock(
        lockId: 532323,
        pageNo: 1,
        pageSize: 20,
        searchStr: null,
        orderBy: 1,
      ),
    ).thenAnswer(
      (_) async => {
        'list': [
          {
            'keyId': 3234293,
            'lockId': 532323,
            'username': 'a@b.com',
            'keyName': '陈文亮',
            'keyStatus': '110401',
            'keyRight': 1,
            'senderUsername': 'admin@b.com',
            'uid': 9,
            'date': 1528878944000,
          },
        ],
        'pageNo': 1,
        'pageSize': 20,
        'pages': 1,
        'total': 1,
      },
    );
    final container = ProviderContainer(
      overrides: [keyApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final page =
        (await container
                .read(keyRepositoryProvider.notifier)
                .list(532323)
                .run())
            .getOrElse((_) => throw TestFailure('left'));
    expect(page.data.single.username, 'a@b.com');
    expect(page.data.single.keyName, '陈文亮');
    expect(page.total, 1);
    verifyNever(
      () => api.list(
        pageNo: any(named: 'pageNo'),
        pageSize: any(named: 'pageSize'),
        lockAlias: any(named: 'lockAlias'),
        groupId: any(named: 'groupId'),
      ),
    );
  });

  test('KeyRepository.send 返回 keyId', () async {
    final api = _MockKeyApi();
    when(
      () => api.send(
        lockId: 163377,
        receiverUsername: '18876191905',
        keyName: '陈文亮',
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        remarks: any(named: 'remarks'),
        remoteEnable: any(named: 'remoteEnable'),
        keyRight: any(named: 'keyRight'),
        createUser: any(named: 'createUser'),
      ),
    ).thenAnswer((_) async => {'keyId': 56323});
    final container = ProviderContainer(
      overrides: [keyApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(keyRepositoryProvider.notifier);
    final r = await repo
        .send(
          163377,
          '18876191905',
          keyName: '陈文亮',
          startDate: DateTime.fromMillisecondsSinceEpoch(1625025703000),
          endDate: DateTime.fromMillisecondsSinceEpoch(1635025703000),
        )
        .run();
    expect(r.getOrElse((_) => 0), 56323);
  });

  test('写接口 OpenApiEnvelope errcode!=0 映射为 AppException', () async {
    final api = _MockKeyApi();
    when(() => api.freeze(keyId: 1)).thenAnswer(
      (_) async => const OpenApiEnvelope(errcode: 1, errmsg: 'fail'),
    );
    when(
      () => api.delete(keyId: 1),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [keyApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(keyDataSourceProvider.notifier);

    final failed = await ds.freeze(keyId: 1).run();
    expect(failed.isLeft(), isTrue);
    failed.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 1);
    }, (_) => fail('expected Left'));

    final deleted = await ds.delete(keyId: 1).run();
    expect(deleted.getOrElse((_) => throw TestFailure('left')).isOk, isTrue);
  });

  test(
    'KeyRepository.changePeriod / freeze / unfreeze / delete 映射 Unit',
    () async {
      final api = _MockKeyApi();
      when(
        () => api.changePeriod(
          keyId: 27619,
          startDate: 1625025703000,
          endDate: 1635025703000,
        ),
      ).thenAnswer((_) async => const OpenApiEnvelope());
      when(
        () => api.freeze(keyId: 27619),
      ).thenAnswer((_) async => const OpenApiEnvelope());
      when(
        () => api.unfreeze(keyId: 27619),
      ).thenAnswer((_) async => const OpenApiEnvelope());
      when(
        () => api.delete(keyId: 27619),
      ).thenAnswer((_) async => const OpenApiEnvelope());
      final container = ProviderContainer(
        overrides: [keyApiProvider.overrideWithValue(api)],
      );
      addTearDown(container.dispose);
      final repo = container.read(keyRepositoryProvider.notifier);

      final changed = await repo
          .changePeriod(
            27619,
            DateTime.fromMillisecondsSinceEpoch(1625025703000),
            DateTime.fromMillisecondsSinceEpoch(1635025703000),
          )
          .run();
      expect(changed, isA<Right<AppException, Unit>>());

      final frozen = await repo.freeze(27619).run();
      expect(frozen, isA<Right<AppException, Unit>>());

      final unfrozen = await repo.unfreeze(27619).run();
      expect(unfrozen, isA<Right<AppException, Unit>>());

      final deleted = await repo.delete(27619).run();
      expect(deleted, isA<Right<AppException, Unit>>());
    },
  );

  test('KeyRepository.authorize 与 getUnlockLink', () async {
    final api = _MockKeyApi();
    when(
      () => api.authorize(lockId: 163377, keyId: 27619),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(
      () => api.getUnlockLink(keyId: 27619),
    ).thenAnswer((_) async => {'link': 'https://c.ttekey.com/h?k=0qFsTwJF'});
    final container = ProviderContainer(
      overrides: [keyApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(keyRepositoryProvider.notifier);

    final authorized = await repo.authorize(163377, 27619).run();
    expect(authorized, isA<Right<AppException, Unit>>());

    final link = await repo.getUnlockLink(27619).run();
    expect(link.getOrElse((_) => ''), 'https://c.ttekey.com/h?k=0qFsTwJF');
  });

  test('changePeriod 路径为 /v3/key/changePeriod', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/key/changePeriod', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await KeyApi(dio).changePeriod(
      keyId: 27619,
      startDate: 1625025703000,
      endDate: 1635025703000,
    );
    expect(sent?['keyId'], 27619);
    expect(sent?['startDate'], 1625025703000);
    expect(sent?['endDate'], 1635025703000);
  });
}
