import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 捕获 `Navigator.pop` 值的可变盒子。
///
/// **必须按引用传出去**，不能按值返回 —— 按值返回只会拿到 `null` 快照。
class Popped<T> {
  T? value;
}

/// 把 [sheet] 推进路由，返回一个会被 pop 值填充的盒子。
///
/// 范式同 `lock_settings_sheets_test.dart`，只是把捕获变量包成盒子以便复用。
Future<Popped<T>> pushSheet<T>(WidgetTester tester, Widget sheet) async {
  final box = Popped<T>();
  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: TextButton(
              key: const Key('open_sheet'),
              onPressed: () async {
                box.value = await Navigator.of(context).push<T>(
                  MaterialPageRoute<T>(builder: (_) => sheet),
                );
              },
              child: const Text('open'),
            ),
          ),
        ),
      ),
    ),
  );
  await tester.tap(find.byKey(const Key('open_sheet')));
  await settlePop(tester);
  return box;
}

/// 等 `Navigator.pop` 的值落到盒子上。
///
/// 单靠一次 `pumpAndSettle` 不够：route 的 pop future 在路由被 dispose 后的
/// microtask 里才完成。
///
/// ⚠ **不能**用 `Future.delayed(Duration.zero)` 冲刷 —— `testWidgets` 跑在
/// fake-async zone 里，那个 Timer 永远不会被推进，测试会挂死到超时。
Future<void> settlePop(WidgetTester tester) async {
  await tester.pumpAndSettle();
  await tester.pump();
  await tester.pumpAndSettle();
}
