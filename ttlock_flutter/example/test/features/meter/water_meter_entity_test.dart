import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/data/model/water_meter_dto.dart';

void main() {
  test('WaterMeterDto.toEntity 映射设备信息字段', () {
    final e = WaterMeterDto.fromJson(const {
      'waterMeterId': 296,
      'name': '表A',
      'number': 'WM2_410100',
      'mac': '78:58:44:00:01:41',
      'modelNum': 'SN774-V01',
      'hardwareRevision': '1.3',
      'firmwareRevision': '1.1.27.250326',
      'syncM3Date': '2025-06',
      'groupName': '1',
      'groupId': 92,
      'maxPower': '255',
      'totalM3': '9.89',
      'remainderM3': '10.00',
    }).toEntity();
    expect(e.mac, '78:58:44:00:01:41');
    expect(e.modelNum, 'SN774-V01');
    expect(e.hardwareRevision, '1.3');
    expect(e.firmwareRevision, '1.1.27.250326');
    expect(e.syncM3Date, '2025-06');
    expect(e.groupName, '1');
    expect(e.groupId, 92);
    expect(e.maxPower, '255');
    expect(e.totalM3, '9.89');
  });

  test('WaterMeterCatOneDetailDto.toEntity 映射 4G 信息', () {
    final e = WaterMeterCatOneDetailDto.fromJson(const {
      'rssiGrade': 3,
      'catOneNodeId': 'node1',
      'catOneCardNumber': '898600',
      'catOneOperator': 'CMCC',
      'catOneImsi': '46000',
      'catOneApn': 'cmnet',
      'overseaCard': 1,
    }).toEntity();
    expect(e.rssiGrade, 3);
    expect(e.catOneNodeId, 'node1');
    expect(e.overseaCard, isTrue);
    expect(e.isEmpty, isFalse);
  });

  test('WaterMeterUpgradeCheckDto.toEntity 映射固件信息', () {
    final e = WaterMeterUpgradeCheckDto.fromJson(const {
      'needUpgrade': 1,
      'firmwareInfo': {
        'modelNum': 'SN774-V01',
        'hardwareRevision': '1.1',
        'firmwareRevision': '1.1.28.250625',
      },
      'version': '1.1.28.250626',
    }).toEntity();
    expect(e.needUpgrade, isTrue);
    expect(e.modelNum, 'SN774-V01');
    expect(e.hardwareRevision, '1.1');
    expect(e.firmwareRevision, '1.1.28.250625');
    expect(e.version, '1.1.28.250626');
  });

  test('WaterMeterOperationRecordDto.toEntity 映射操作记录', () {
    final e = WaterMeterOperationRecordDto.fromJson(const {
      'id': 1,
      'recordType': '9',
      'title': 't',
      'content': 'c',
      'date': 'd',
      'headUrl': 'h',
    }).toEntity();
    expect(e.id, 1);
    expect(e.recordType, '9');
    expect(e.isDateSeparator, isFalse);
  });
}
