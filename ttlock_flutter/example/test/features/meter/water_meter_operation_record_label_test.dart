import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/water_meter_operation_record_label.dart';

void main() {
  final l10n = lookupAppLocalizations(const Locale('zh'));

  test('水表响应侧 recordType 逐值映射（listOperationRecords.md:44）', () {
    expect(
      waterMeterOperationRecordText(l10n, '1'),
      l10n.meterRecordTypeClearRemainderWater,
    );
    expect(
      waterMeterOperationRecordText(l10n, '2'),
      l10n.meterRecordTypePayModeSwitch,
    );
    expect(
      waterMeterOperationRecordText(l10n, '4'),
      l10n.meterRecordTypePowerOnOffWater,
    );
    expect(waterMeterOperationRecordText(l10n, '5'), l10n.meterRecordTypeRead);
    expect(waterMeterOperationRecordText(l10n, '6'), l10n.meterRecordTypePrice);
    expect(
      waterMeterOperationRecordText(l10n, '7'),
      l10n.meterRecordTypeRecharge,
    );
    expect(
      waterMeterOperationRecordText(l10n, '8'),
      l10n.meterRecordTypeSetTotalUsage,
    );
    expect(
      waterMeterOperationRecordText(l10n, '9'),
      l10n.meterRecordTypePaying,
    );
  });

  test('水表 8 是「设置水量」而电表 8 是「充值中」', () {
    expect(
      waterMeterOperationRecordText(l10n, '8'),
      isNot(l10n.meterRecordTypePaying),
    );
    expect(waterMeterOperationRecordText(l10n, '99'), '99');
  });
}
