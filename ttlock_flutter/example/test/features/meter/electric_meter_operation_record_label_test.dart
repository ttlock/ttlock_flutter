import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/electric_meter_operation_record_label.dart';

void main() {
  final l10n = lookupAppLocalizations(const Locale('zh'));

  test('电表响应侧 recordType 逐值映射（listOperationRecords.md:44）', () {
    expect(
      electricMeterOperationRecordText(l10n, '1'),
      l10n.meterRecordTypeClearRemainder,
    );
    expect(
      electricMeterOperationRecordText(l10n, '2'),
      l10n.meterRecordTypePayModeSwitch,
    );
    expect(
      electricMeterOperationRecordText(l10n, '4'),
      l10n.meterRecordTypePowerOnOff,
    );
    expect(electricMeterOperationRecordText(l10n, '5'), l10n.meterRecordTypeRead);
    expect(
      electricMeterOperationRecordText(l10n, '6'),
      l10n.meterRecordTypePrice,
    );
    expect(
      electricMeterOperationRecordText(l10n, '7'),
      l10n.meterRecordTypeRecharge,
    );
    expect(
      electricMeterOperationRecordText(l10n, '8'),
      l10n.meterRecordTypePaying,
    );
  });

  test('响应侧 1 不是「充值」（那是对请求侧的值域），未知值回落原串', () {
    expect(
      electricMeterOperationRecordText(l10n, '1'),
      isNot(l10n.meterRecordTypeRecharge),
    );
    expect(electricMeterOperationRecordText(l10n, '99'), '99');
  });
}
