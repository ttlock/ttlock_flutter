import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/provider/standalone_door_sensor_domain.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/widget/standalone_list_content.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/entity/gateway.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/provider/gateway_domain.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/widget/gateway_list_content.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/provider/electric_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/provider/water_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/widget/water_meter_list_content.dart';
import 'package:ttlock_flutter_demo/features/other_devices/presentation/screen/other_devices_screen.dart';

class _EmptyGatewayDomain extends GatewayDomain {
  @override
  void build() {}

  @override
  TaskEither<AppException, PageState<GatewayEntity>> list({int pageNo = 1}) =>
      TaskEither.right(
        PageState(data: <GatewayEntity>[], currentPage: pageNo, total: 0),
      );
}

class _EmptyWaterMeterDomain extends WaterMeterDomain {
  @override
  void build() {}

  @override
  TaskEither<AppException, PageState<WaterMeterEntity>> list({
    int pageNo = 1,
    int pageSize = 20,
    int? groupId,
    String? searchStr,
  }) => TaskEither.right(
    PageState(data: <WaterMeterEntity>[], currentPage: pageNo, total: 0),
  );
}

class _EmptyElectricMeterDomain extends ElectricMeterDomain {
  @override
  void build() {}

  @override
  TaskEither<AppException, PageState<ElectricMeterEntity>> list({
    int pageNo = 1,
    int pageSize = 20,
    int? groupId,
    String? searchStr,
  }) => TaskEither.right(
    PageState(data: <ElectricMeterEntity>[], currentPage: pageNo, total: 0),
  );
}

class _EmptyStandaloneDoorSensorDomain extends StandaloneDoorSensorDomain {
  @override
  void build() {}

  @override
  TaskEither<AppException, PageState<StandaloneDoorSensorEntity>> list({
    int pageNo = 1,
    int pageSize = 20,
    String? searchStr,
  }) => TaskEither.right(
    PageState(
      data: <StandaloneDoorSensorEntity>[],
      currentPage: pageNo,
      total: 0,
    ),
  );
}

void main() {
  testWidgets('TabBar 展示网关/水表/电表/独立门磁四 tab,可切换,FAB 存在', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          gatewayDomainProvider.overrideWith(_EmptyGatewayDomain.new),
          waterMeterDomainProvider.overrideWith(_EmptyWaterMeterDomain.new),
          electricMeterDomainProvider.overrideWith(
            _EmptyElectricMeterDomain.new,
          ),
          standaloneDoorSensorDomainProvider.overrideWith(
            _EmptyStandaloneDoorSensorDomain.new,
          ),
          localeProvider.overrideWithValue(const Locale('en')),
        ],
        child: MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const OtherDevicesScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // 结构：TabBar + 四个设备 tab + TabBarView + FAB
    expect(find.byType(TabBar), findsOneWidget);
    expect(find.byType(Tab), findsNWidgets(4));
    expect(find.byType(TabBarView), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    // 第 4 个 tab 标签为独立门磁
    final l10n = AppLocalizations.of(tester.element(find.byType(TabBar)))!;
    expect(find.text(l10n.standaloneDoorSensorTitle), findsOneWidget);
    // 默认展示第一个 tab（网关列表内容）
    expect(find.byType(GatewayListContent), findsOneWidget);

    // 切换到第二个 tab → 水表列表内容出现
    await tester.tap(find.byType(Tab).at(1));
    await tester.pumpAndSettle();
    expect(find.byType(WaterMeterListContent), findsOneWidget);

    // 切换到第四个 tab → 独立门磁列表内容出现
    await tester.tap(find.byType(Tab).at(3));
    await tester.pumpAndSettle();
    expect(find.byType(StandaloneDoorSensorListContent), findsOneWidget);
  });
}
