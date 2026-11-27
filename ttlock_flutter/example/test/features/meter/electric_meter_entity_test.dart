import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/data/model/electric_meter_dto.dart';

void main() {
  test('ElectricMeterDto.toEntity 映射设备信息字段', () {
    final dto = ElectricMeterDto.fromJson(const {
      'electricMeterId': 296,
      'name': '表A',
      'number': 'EM2_410100',
      'mac': '78:58:44:00:01:41',
      'modelNum': 'SN774-V01',
      'hardwareRevision': '1.3',
      'firmwareRevision': '1.1.27.250326',
      'syncKwhDate': 1750748374000,
      'groupName': '1',
      'groupId': 92,
      'maxPower': '255',
    });
    final e = dto.toEntity();
    expect(e.mac, '78:58:44:00:01:41');
    expect(e.modelNum, 'SN774-V01');
    expect(e.hardwareRevision, '1.3');
    expect(e.firmwareRevision, '1.1.27.250326');
    expect(e.syncKwhDate, DateTime.fromMillisecondsSinceEpoch(1750748374000));
    expect(e.groupName, '1');
    expect(e.groupId, 92);
    expect(e.maxPower, '255');
  });

  test('ElectricMeterCatOneDetailDto.toEntity 映射 4G 信息', () {
    final e = ElectricMeterCatOneDetailDto.fromJson(const {
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

  test('ElectricMeterUpgradeCheckDto.toEntity 映射固件信息', () {
    final e = ElectricMeterUpgradeCheckDto.fromJson(const {
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

  test('ElectricMeterOperationRecordDto.toEntity 映射操作记录', () {
    final e = ElectricMeterOperationRecordDto.fromJson(const {
      'id': 13577,
      'recordType': '5',
      'title': '135 black',
      'content': '抄表，总电量9.89kWh。',
      'date': '14:59:34',
      'headUrl': 'http://x/y.jpg',
    }).toEntity();
    expect(e.id, 13577);
    expect(e.recordType, '5');
    expect(e.isDateSeparator, isFalse);
  });
}
