import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';

class LoadingOverlay extends StatelessWidget {
  final String? message;
  final Widget? child;

  const LoadingOverlay({super.key, this.message, this.child});

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return Stack(children: [
        child!,
        Container(
          color: Colors.black26,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                if (message != null) ...[
                  const SizedBox(height: 16),
                  Text(message!, style: AppTextStyles.bodyMedium),
                ],
              ],
            ),
          ),
        ),
      ]);
    }
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(message!, style: AppTextStyles.bodyMedium),
          ],
        ],
      ),
    );
  }
}
