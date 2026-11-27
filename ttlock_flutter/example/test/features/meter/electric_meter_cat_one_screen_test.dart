import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/provider/electric_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_cat_one_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_cat_one_info.dart';

class _FakeDomain extends ElectricMeterDomain {
  _FakeDomain({this.info, this.error});

  final MeterCatOneInfoEntity? info;
  final AppException? error;

  @override
  void build() {}

  @override
  TaskEither<AppException, ElectricMeterEntity> detail(int meterId) =>
      TaskEither.right(
        ElectricMeterEntity(electricMeterId: meterId, mac: 'BB:W1'),
      );

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
        electricMeterDomainProvider.overrideWith(
          () => _FakeDomain(info: info, error: error),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const ElectricMeterCatOneScreen(meterId: 9),
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

  testWidgets('信息非空 → 显示信息区与重新配置（含海外卡）', (tester) async {
    await _pump(
      tester,
      info: const MeterCatOneInfoEntity(
        rssiGrade: 2,
        catOneNodeId: 'node1',
        catOneCardNumber: '898600',
        catOneOperator: '中国移动',
        overseaCard: true,
      ),
    );
    expect(find.text('node1'), findsOneWidget);
    expect(find.text('898600'), findsOneWidget);
    expect(find.text('中国移动'), findsOneWidget);
    // rssiGrade 2 → 「中」，不渲染裸数字。
    expect(find.text('中'), findsOneWidget);
    expect(find.text('是'), findsOneWidget);
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
    expect(find.text('node1'), findsNothing);
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
