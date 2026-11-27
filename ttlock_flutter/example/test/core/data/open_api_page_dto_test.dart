import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_page_dto.dart';

void main() {
  test('分页响应解析', () {
    const json = {
      'list': [
        {'id': 1},
      ],
      'pageNo': 1,
      'pageSize': 20,
      'pages': 1,
      'total': 1,
    };
    final page = OpenApiPageDto<Map<String, dynamic>>.fromJson(
      json,
      (j) => j as Map<String, dynamic>,
    );
    expect(page.list, hasLength(1));
    expect(page.total, 1);
  });
  test('写接口 errcode 语义', () {
    const ok = OpenApiEnvelope(errcode: 0, errmsg: '', description: '');
    expect(ok.isOk, isTrue);
    const fail = OpenApiEnvelope(
      errcode: 10007,
      errmsg: 'bad',
      description: '',
    );
    expect(fail.isOk, isFalse);
  });
}
