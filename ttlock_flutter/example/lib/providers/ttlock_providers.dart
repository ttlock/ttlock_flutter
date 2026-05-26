import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';

part 'ttlock_providers.g.dart';

@riverpod
TTLockApi lockApi(Ref ref) => TTLock.lock;

@riverpod
TTGatewayApi gatewayApi(Ref ref) => TTLock.gateway;

@riverpod
TTRemoteKeyApi remoteKeyApi(Ref ref) => TTLock.remoteKey;

@riverpod
TTRemoteKeypadApi remoteKeypadApi(Ref ref) => TTLock.remoteKeypad;

@riverpod
TTDoorSensorApi doorSensorApi(Ref ref) => TTLock.doorSensor;

@riverpod
TTWaterMeterApi waterMeterApi(Ref ref) => TTLock.waterMeter;

@riverpod
TTElectricMeterApi electricMeterApi(Ref ref) => TTLock.electricMeter;
