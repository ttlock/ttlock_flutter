import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_cat_one_info.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/provider/water_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_cat_one_screen.dart';

class _FakeDomain extends WaterMeterDomain {
  _FakeDomain({this.info, this.error});

  final MeterCatOneInfoEntity? info;
  final AppException? error;

  @override
  void build() {}

  @override
  TaskEither<AppException, WaterMeterEntity> detail(int meterId) =>
      TaskEither.right(WaterMeterEntity(waterMeterId: meterId, mac: 'AA:W1'));

  @override
  TaskEither<AppException, bool> catOneNeedsApn() => TaskEither.right(false);

  @override
  TaskEither<AppException, MeterCatOneInfoEntity> catOneInfo(int meterId) =>
      error != null ? TaskEither.left(error!) : TaskEither.right(info!);
}

Future<void> _pump(
  WidgetTester tester, {
  MeterCatOneInfoEntity? info,
  AppException? error,
}) async {
  await tester.binding.setSurfaceSize(const Size(800, 2000));
  addTearDown(() => tester.binding.setSurfaceSize(null));
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        waterMeterDomainProvider.overrideWith(
          () => _FakeDomain(info: info, error: error),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const WaterMeterCatOneScreen(meterId: 7),
      ),
    ),
  );
  await tester.pump();
  await tester.pump();
}

void main() {
  testWidgets('信息字段全空 → 显示配置按钮，不显示信息区', (tester) async {
    await _pump(tester, info: const MeterCatOneInfoEntity());
    expect(find.text('配置服务器'), findsOneWidget);
    expect(find.byKey(const Key('meter_cat_one_reconfigure')), findsNothing);
    expect(find.byKey(const Key('meter_cat_one_retry')), findsNothing);
  });

  testWidgets('信息非空 → 显示信息区与重新配置', (tester) async {
    await _pump(
      tester,
      info: const MeterCatOneInfoEntity(
        rssiGrade: 3,
        catOneNodeId: 'node1',
        catOneCardNumber: '898600',
      ),
    );
    expect(find.text('node1'), findsOneWidget);
    expect(find.text('898600'), findsOneWidget);
    // rssiGrade 3 → 「强」。
    expect(find.text('强'), findsOneWidget);
    expect(find.byKey(const Key('meter_cat_one_reconfigure')), findsOneWidget);
    expect(find.text('配置服务器'), findsNothing);
  });

  testWidgets('网络失败 → 显示重试，不显示配置按钮（spec §6.3）', (tester) async {
    await _pump(
      tester,
      error: AppException.network(exception: 'x', message: '超时'),
    );
    expect(find.byKey(const Key('meter_cat_one_retry')), findsOneWidget);
    expect(find.text('配置服务器'), findsNothing);
  });

  testWidgets('非网络类业务失败 → 视为未配置，给配置按钮', (tester) async {
    await _pump(
      tester,
      error: AppException.business(code: 3001, message: '未配置'),
    );
    expect(find.text('配置服务器'), findsOneWidget);
    expect(find.byKey(const Key('meter_cat_one_retry')), findsNothing);
  });
}
