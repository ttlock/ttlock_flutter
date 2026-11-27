import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_page_dto.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/lock/data/data_source/lock_record_api.dart';
import 'package:ttlock_flutter_demo/features/lock/data/data_source/lock_record_data_source.dart';
import 'package:ttlock_flutter_demo/features/lock/data/model/lock_record_dto.dart';
import 'package:ttlock_flutter_demo/features/lock/data/repository/lock_record_repository.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_record.dart';

class _MockLockRecordApi extends Mock implements LockRecordApi {}

void main() {
  test('LockRecordDto 分页解析 + toEntity', () {
    const json = {
      'list': [
        {
          'recordId': 1635556821,
          'lockId': 163377,
          'recordTypeFromLock': 1,
          'recordType': 1,
          'success': 1,
          'username': 'alex@google.com',
          'lockDate': 1616674054000,
          'serverDate': 1616674056000,
        },
        {
          'recordId': 1635539709,
          'lockId': 163377,
          'recordTypeFromLock': 4,
          'recordType': 4,
          'success': 1,
          'username': '小明',
          'keyboardPwd': '383834',
          'lockDate': 1616675054000,
          'serverDate': 1616676056000,
          'subRecordType': 2,
        },
      ],
      'pageNo': 1,
      'pageSize': 20,
      'pages': 1,
      'total': 2,
    };
    final page = OpenApiPageDto<LockRecordDto>.fromJson(
      json,
      (j) => LockRecordDto.fromJson(j as Map<String, dynamic>),
    );
    expect(page.total, 2);
    final ble = page.list.first.toEntity();
    expect(ble.recordId, 1635556821);
    expect(ble.lockId, 163377);
    expect(ble.success, isTrue);
    expect(ble.username, 'alex@google.com');
    expect(ble.keyboardPwd, isEmpty);
    expect(ble.lockDate, DateTime.fromMillisecondsSinceEpoch(1616674054000));

    final pwd = page.list.last.toEntity();
    expect(pwd.keyboardPwd, '383834');
    expect(pwd.subRecordType, 2);
    expect(pwd.recordType, 4);
  });

  test('LockRecordDto 容错：数字字段以 String 返回、success 为 0', () {
    final dto = LockRecordDto.fromJson({
      'recordId': '12',
      'lockId': '3',
      'recordTypeFromLock': '4',
      'recordType': '4',
      'success': '0',
      'subRecordType': '1',
    });
    final entity = dto.toEntity();
    expect(entity.recordId, 12);
    expect(entity.lockId, 3);
    expect(entity.success, isFalse);
    expect(entity.subRecordType, 1);
  });

  test('LockRecordRepository.getRecords 经 mock Api 返回 PageState', () async {
    final api = _MockLockRecordApi();
    when(
      () => api.list(
        lockId: 163377,
        startDate: null,
        endDate: null,
        pageNo: 1,
        pageSize: 20,
        uid: null,
        recordType: null,
        searchStr: null,
      ),
    ).thenAnswer(
      (_) async => {
        'list': [
          {
            'recordId': 1,
            'lockId': 163377,
            'recordType': 1,
            'success': 1,
            'username': 'a',
          },
        ],
        'pageNo': 1,
        'pageSize': 20,
        'pages': 1,
        'total': 1,
      },
    );
    final container = ProviderContainer(
      overrides: [lockRecordApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(lockRecordRepositoryProvider.notifier);
    final r = await repo.getRecords(163377, pageNo: 1, pageSize: 20).run();
    expect(r, isA<Right<AppException, PageState<LockRecordEntity>>>());
    expect(
      r
          .getOrElse((_) => const PageState<LockRecordEntity>())
          .data
          .single
          .recordId,
      1,
    );
  });

  test('LockRecordDataSource.list 将裸 Map 解析为 OpenApiPageDto', () async {
    final api = _MockLockRecordApi();
    when(
      () => api.list(
        lockId: 1,
        startDate: 100,
        endDate: 200,
        pageNo: 1,
        pageSize: 20,
        uid: 9,
        recordType: 4,
        searchStr: '383834',
      ),
    ).thenAnswer(
      (_) async => {
        'list': [
          {'recordId': 9, 'lockId': 1, 'keyboardPwd': '383834'},
        ],
        'pageNo': 1,
        'pageSize': 20,
        'pages': 1,
        'total': 1,
      },
    );
    final container = ProviderContainer(
      overrides: [lockRecordApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(lockRecordDataSourceProvider.notifier);
    final r = await ds
        .list(
          lockId: 1,
          startDate: 100,
          endDate: 200,
          uid: 9,
          recordType: 4,
          searchStr: '383834',
        )
        .run();
    final page = r.getOrElse((_) => throw TestFailure('expected Right'));
    expect(page.list.single.recordId, 9);
    expect(page.list.single.keyboardPwd, '383834');
  });

  test('写接口 OpenApiEnvelope：errcode!=0 映射为 AppException', () async {
    final api = _MockLockRecordApi();
    when(() => api.clear(lockId: 1)).thenAnswer(
      (_) async => const OpenApiEnvelope(errcode: 1, errmsg: 'fail'),
    );
    when(
      () => api.delete(lockId: 1, recordIdList: '[1,2]'),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(
      () => api.upload(lockId: 1, records: '[]'),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [lockRecordApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(lockRecordDataSourceProvider.notifier);

    final failed = await ds.clear(lockId: 1).run();
    expect(failed.isLeft(), isTrue);
    failed.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 1);
    }, (_) => fail('expected Left'));

    final deleted = await ds.delete(lockId: 1, recordIdList: [1, 2]).run();
    expect(deleted.getOrElse((_) => throw TestFailure('left')).isOk, isTrue);

    final uploaded = await ds.upload(lockId: 1, records: '[]').run();
    expect(uploaded.getOrElse((_) => throw TestFailure('left')).isOk, isTrue);
  });

  test('delete 将 recordIdList 编码为 JSON 数组字符串', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/lockRecord/delete', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await LockRecordApi(dio).delete(lockId: 163377, recordIdList: '[1,2]');
    expect(sent?['lockId'], 163377);
    expect(sent?['recordIdList'], '[1,2]');
  });

  test('LockRecordRepository.clear / upload / delete 映射 Unit', () async {
    final api = _MockLockRecordApi();
    when(
      () => api.clear(lockId: 1),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(
      () => api.upload(lockId: 1, records: '[{"recordType":1}]'),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(
      () => api.delete(lockId: 1, recordIdList: '[9]'),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [lockRecordApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(lockRecordRepositoryProvider.notifier);

    final cleared = await repo.clear(1).run();
    expect(cleared, isA<Right<AppException, Unit>>());

    final uploaded = await repo.upload(1, records: '[{"recordType":1}]').run();
    expect(uploaded, isA<Right<AppException, Unit>>());

    final deleted = await repo.delete(1, recordIdList: [9]).run();
    expect(deleted, isA<Right<AppException, Unit>>());
  });
}
