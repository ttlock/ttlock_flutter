import 'dart:convert';

import 'package:ttlock_flutter/ttlock_flutter.dart';

extension TtLockSystemModelFirmware on TTLockSystemModel {
  String get firmwareInfoJson => jsonEncode(<String, String>{
    'modelNum': modelNum ?? '',
    'hardwareRevision': hardwareRevision ?? '',
    'firmwareRevision': firmwareRevision ?? '',
  });
}
