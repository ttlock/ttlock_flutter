import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_ble_command.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_ble_credentials.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_kind.dart';

const _creds = MeterBleCredentials(url: 'u', clientId: 'c', token: 't');

void main() {
  test('先重设 client param，再执行指令', () async {
    final calls = <String>[];
    final r = await runMeterBleCommand<String>(
      kind: MeterKind.electric,
      credentials: _creds,
      action: () async {
        calls.add('action');
        return 'ok';
      },
      setClientParam: (kind, c) async => calls.add('setClientParam'),
    );
    expect(r, 'ok');
    expect(calls, ['setClientParam', 'action']);
  });

  test('setClientParam 失败时不执行指令，错误原样抛出', () async {
    var acted = false;
    await expectLater(
      runMeterBleCommand<void>(
        kind: MeterKind.water,
        credentials: _creds,
        action: () async => acted = true,
        setClientParam: (kind, c) async =>
            throw AppException.business(code: -32, message: 'no creds'),
      ),
      throwsA(isA<AppBusinessException>()),
    );
    expect(acted, isFalse);
  });

  test('指令错误原样抛出', () async {
    await expectLater(
      runMeterBleCommand<void>(
        kind: MeterKind.water,
        credentials: _creds,
        action: () async => throw AppException.firmware(message: 'boom'),
        setClientParam: (kind, c) async {},
      ),
      throwsA(isA<AppFirmwareException>()),
    );
  });
}
