import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/keypad_slot.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/wireless_keypad.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/provider/keypad_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/provider/keypad_detail_state.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/screen/wireless_keypad_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/wireless_keypad_args.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

/// 应用语言固定为 zh（`localeProvider` 硬编码 `Locale('zh')`）。
/// 断言用同一个入口取文案，避免把中文字面量抄进测试。
final _l10n = lookupAppLocalizations(const Locale('zh'));

/// class 型 Notifier 的 override 必须用可构造子类。
class _FakeKeypadDetailNotifier extends KeypadDetailNotifier {
  _FakeKeypadDetailNotifier(this._value, {this.retryResult = false});

  KeypadDetailState _value;
  final bool retryResult;

  @override
  Future<KeypadDetailState> build(WirelessKeypadDetailArgs args) async =>
      _value;

  /// 模拟一次页面级操作失败（真实 Notifier 内部就是这么写 state 的）。
  void failWith(AppException error, {bool? pendingCloudSync}) {
    _value = _value.copyWith(
      actionError: error,
      pendingCloudSync: pendingCloudSync ?? _value.pendingCloudSync,
    );
    state = AsyncValue.data(_value);
  }

  @override
  Future<bool> retryCloudSync() async => retryResult;
}

const _lock = LockEntity(lockId: 1, lockData: 'ld');

WirelessKeypadEntity _keypad({required bool multi}) => WirelessKeypadEntity(
  wirelessKeypadId: 4242,
  wirelessKeypadMac: 'KP',
  isMultifunctionalKeypad: multi,
  slotNumber: multi ? 2 : 0,
  slotLimit: multi ? 3 : 0,
);

WirelessKeypadDetailArgs _args({required bool multi}) =>
    WirelessKeypadDetailArgs(
      lock: _lock,
      item: _keypad(multi: multi),
    );

Widget _wrap({
  required bool multi,
  required _FakeKeypadDetailNotifier notifier,
}) {
  final args = _args(multi: multi);
  return ProviderScope(
    overrides: [keypadDetailProvider(args).overrideWith(() => notifier)],
    child: MaterialApp(home: WirelessKeypadDetailScreen(args: args)),
  );
}

/// 详情页要被真实 Navigator push/pop 才能观察 `Navigator.pop`。
Widget _wrapHosted(_FakeKeypadDetailNotifier notifier) {
  final args = _args(multi: true);
  return ProviderScope(
    overrides: [keypadDetailProvider(args).overrideWith(() => notifier)],
    child: MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: TextButton(
              key: const Key('open_detail'),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<bool>(
                  builder: (_) => WirelessKeypadDetailScreen(args: args),
                ),
              ),
              child: const Text('open'),
            ),
          ),
        ),
      ),
    ),
  );
}

/// 详情页是 `ListView`（懒构建）。多功能键盘分支有七八个 tile 在底部，
/// 默认 800×600 的测试画布装不下——**不放宽断言**，改把画布抬高，
/// 让每个用例断言的 widget 都确实进入过 widget 树。
void _useTallSurface(WidgetTester tester) {
  tester.view.physicalSize = const Size(1000, 2200);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);
}

/// 只在 SnackBar 里找文案——`keypadCloudPending` 的同一句话还被常驻横幅
/// 渲染着，不过滤会误判成「snackbar 报的是它」。
Finder _inSnackBar(String text) =>
    find.descendant(of: find.byType(SnackBar), matching: find.text(text));

void main() {
  testWidgets('多功能键盘显示录入入口 / 槽位区 / 检查升级 / 解除绑定', (tester) async {
    _useTallSurface(tester);
    await tester.pumpWidget(
      _wrap(
        multi: true,
        notifier: _FakeKeypadDetailNotifier(
          KeypadDetailState(
            keypad: _keypad(multi: true),
            slots: const [
              KeypadSlot(slotNumber: 1, lockAlias: '别的锁'),
              KeypadSlot(slotNumber: 2, lockAlias: '大门锁'),
              KeypadSlot(slotNumber: 3),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('keypad_enroll_card')), findsOneWidget);
    expect(find.byKey(const Key('keypad_enroll_fingerprint')), findsOneWidget);
    expect(find.byKey(const Key('keypad_slots')), findsOneWidget);
    expect(find.byKey(const Key('keypad_slot_3')), findsOneWidget);
    // 本锁占用 slot 2
    expect(find.byKey(const Key('keypad_slot_2')), findsOneWidget);
    expect(find.byKey(const Key('keypad_check_upgrade')), findsOneWidget);
    expect(find.byKey(const Key('keypad_unbind')), findsOneWidget);

    // 槽位区**渲染出来的是什么**，而不只是「有没有这三个 tile」。
    // slot 2 是本锁占用的槽位 → 带「本锁」标记。
    expect(
      find.descendant(
        of: find.byKey(const Key('keypad_slot_2')),
        matching: find.text(_l10n.keypadSlotMine),
      ),
      findsOneWidget,
    );
    // 标记只此一处：另外两个槽位都不是本锁的。
    expect(find.text(_l10n.keypadSlotMine), findsOneWidget);

    // 副标题：已绑定槽位显示 lockAlias，空别名槽位显示「未绑定」。
    expect(
      find.descendant(
        of: find.byKey(const Key('keypad_slot_1')),
        matching: find.text('别的锁'),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byKey(const Key('keypad_slot_2')),
        matching: find.text('大门锁'),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byKey(const Key('keypad_slot_3')),
        matching: find.text(_l10n.keypadSlotEmpty),
      ),
      findsOneWidget,
    );
  });

  testWidgets('普通键盘不显示录入入口与槽位区', (tester) async {
    await tester.pumpWidget(
      _wrap(
        multi: false,
        notifier: _FakeKeypadDetailNotifier(
          KeypadDetailState(keypad: _keypad(multi: false)),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('keypad_enroll_card')), findsNothing);
    expect(find.byKey(const Key('keypad_enroll_fingerprint')), findsNothing);
    expect(find.byKey(const Key('keypad_slots')), findsNothing);
    expect(find.byKey(const Key('keypad_check_upgrade')), findsNothing);
    expect(find.byKey(const Key('keypad_unbind')), findsOneWidget);
  });

  testWidgets('槽位读取失败显示错误与重试', (tester) async {
    _useTallSurface(tester);
    await tester.pumpWidget(
      _wrap(
        multi: true,
        notifier: _FakeKeypadDetailNotifier(
          KeypadDetailState(
            keypad: _keypad(multi: true),
            slotsError: AppException.business(code: 500, message: 'boom'),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('keypad_slots_retry')), findsOneWidget);
  });

  testWidgets('槽位为空显示说明性空态（非错误）', (tester) async {
    _useTallSurface(tester);
    await tester.pumpWidget(
      _wrap(
        multi: true,
        notifier: _FakeKeypadDetailNotifier(
          KeypadDetailState(keypad: _keypad(multi: true)),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('keypad_slots_retry')), findsNothing);
    expect(find.byKey(const Key('keypad_slots')), findsOneWidget);
  });

  testWidgets('pendingCloudSync 显示横幅与重试', (tester) async {
    _useTallSurface(tester);
    await tester.pumpWidget(
      _wrap(
        multi: true,
        notifier: _FakeKeypadDetailNotifier(
          KeypadDetailState(
            keypad: _keypad(multi: true),
            pendingCloudSync: true,
            actionError: AppException.business(code: 500, message: 'down'),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('keypad_cloud_pending')), findsOneWidget);
    expect(find.byKey(const Key('keypad_cloud_retry')), findsOneWidget);
  });

  testWidgets('解绑失败后 pendingCloudSync 仍在，重命名失败要如实报重命名的错', (tester) async {
    _useTallSurface(tester);
    final notifier = _FakeKeypadDetailNotifier(
      KeypadDetailState(
        keypad: _keypad(multi: true),
        pendingCloudSync: true,
        // ① 解绑的云端那一步失败了。
        actionError: AppException.business(code: 500, message: 'unbind-boom'),
      ),
    );
    await tester.pumpWidget(_wrap(multi: true, notifier: notifier));
    await tester.pumpAndSettle();

    // ① 的提示报的是解绑失败本身，而不是 pendingCloudSync 的笼统文案。
    // （后者是常驻横幅的职责，不是一次性 snackbar 的。）
    expect(_inSnackBar('unbind-boom'), findsOneWidget);
    expect(_inSnackBar(_l10n.keypadCloudPending), findsNothing);

    // 让第一条 snackbar 自然消失，否则第二条只会排队、不进 widget 树。
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();

    // ② 用户接着改重命名，同样失败。
    notifier.failWith(AppException.business(code: 500, message: 'rename-boom'));
    await tester.pumpAndSettle();

    // `pendingCloudSync` 还是 true；若 snackbar 按它分流，这里报的会是
    // 「键盘已解绑，但云端未同步」——renaming 的真实失败就被吞掉了。
    expect(_inSnackBar('rename-boom'), findsOneWidget);
    expect(_inSnackBar(_l10n.keypadCloudPending), findsNothing);
  });

  testWidgets('pendingCloudSync 时解除绑定被禁用', (tester) async {
    _useTallSurface(tester);
    await tester.pumpWidget(
      _wrap(
        multi: true,
        notifier: _FakeKeypadDetailNotifier(
          KeypadDetailState(
            keypad: _keypad(multi: true),
            pendingCloudSync: true,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // BLE 清槽已经跑过，槽位是空的。此时再点解除绑定会对同一个空槽重跑一次
    // clearKeypadSlot——正是 pendingCloudSync 机制要避开的那次调用。
    expect(
      tester.widget<ListTile>(find.byKey(const Key('keypad_unbind'))).enabled,
      isFalse,
    );
  });

  testWidgets('没有待同步的云端状态时解除绑定可用', (tester) async {
    _useTallSurface(tester);
    await tester.pumpWidget(
      _wrap(
        multi: true,
        notifier: _FakeKeypadDetailNotifier(
          KeypadDetailState(keypad: _keypad(multi: true)),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(
      tester.widget<ListTile>(find.byKey(const Key('keypad_unbind'))).enabled,
      isTrue,
    );
  });

  testWidgets('云端重试成功后关闭详情页', (tester) async {
    _useTallSurface(tester);
    await tester.pumpWidget(
      _wrapHosted(
        _FakeKeypadDetailNotifier(
          KeypadDetailState(
            keypad: _keypad(multi: true),
            pendingCloudSync: true,
          ),
          retryResult: true,
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('open_detail')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('wireless_keypad_detail')), findsOneWidget);

    await tester.tap(find.byKey(const Key('keypad_cloud_retry')));
    await tester.pumpAndSettle();

    // 重试成功 == 本锁与该键盘已彻底解绑，页面必须像 `_unbind` 一样关闭，
    // 否则会留下一个「仍然绑定」的假象和一条会把 BLE 清槽重跑一遍的入口。
    expect(find.byKey(const Key('wireless_keypad_detail')), findsNothing);
    expect(find.byKey(const Key('open_detail')), findsOneWidget);
  });

  testWidgets('云端重试失败时留在原页，横幅与重试入口都还在', (tester) async {
    _useTallSurface(tester);
    await tester.pumpWidget(
      _wrap(
        multi: true,
        notifier: _FakeKeypadDetailNotifier(
          KeypadDetailState(
            keypad: _keypad(multi: true),
            pendingCloudSync: true,
          ),
          retryResult: false,
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('keypad_cloud_retry')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('wireless_keypad_detail')), findsOneWidget);
    expect(find.byKey(const Key('keypad_cloud_pending')), findsOneWidget);
    expect(find.byKey(const Key('keypad_cloud_retry')), findsOneWidget);
  });
}
