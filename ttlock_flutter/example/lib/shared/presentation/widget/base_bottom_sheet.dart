import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseBottomSheet extends HookConsumerWidget {
  const BaseBottomSheet({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 键盘遮住的高度。sheet 路由是满屏的，且面板底边对齐在屏幕底部；iOS / 鸿蒙
    // 弹出键盘时 window 不缩放，面板不会自己上移而被键盘盖住，这里显式把它抬到
    // 键盘上方。Android 的 adjustResize 下该值为 0，不会重复顶起。
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return BottomSheet(
      onClosing: () {},
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      builder: (context) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(12).copyWith(
              bottom: bottomInset + 12,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    BackButton(onPressed: () => context.pop()),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Flexible(child: child),
              ],
            ),
          ),
        );
      },
    );
  }
}
