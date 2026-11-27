import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fpdart/fpdart.dart';

int _count = 0;
bool _showEnabled = true;

/// 展示全局 loading 并执行 [task]，结束后自动关闭。
/// EasyLoading 的 show/dismiss 是全局的，这里用引用计数保证
/// 嵌套/并发操作全部结束才关闭，避免先完成的操作提前关掉后者的 loading。
/// 若 EasyLoading 宿主未挂载（例如单元测试无 widget 树，`EasyLoading.init()`
/// 未注入 builder），首次 show 抛 `StateError`；此时退化为「仅执行任务、不展示
/// loading」，并缓存该状态，后续调用不再尝试 show/dismiss。
Future<T> withGlobalLoading<T>(
  Future<T> Function() task, {
  String? status,
}) async {
  if (!_showEnabled) return task();
  final show = _count++ == 0;
  if (show) {
    try {
      await EasyLoading.show(status: status);
    } on StateError {
      _showEnabled = false;
      _count--;
      return task();
    }
  }
  try {
    return await task();
  } finally {
    if (--_count == 0) EasyLoading.dismiss();
  }
}

extension TaskEitherLoading<L, R> on TaskEither<L, R> {
  /// 等价 [TaskEither.run]，期间展示全局 loading。
  Future<Either<L, R>> runWithLoading({String? status}) =>
      withGlobalLoading(() => run(), status: status);
}
