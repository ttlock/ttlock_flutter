import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ErrorDisplay extends StatelessWidget {
  final String? message;
  final String? errorCode;
  final VoidCallback? onRetry;

  const ErrorDisplay({super.key, this.message, this.errorCode, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48, color: AppColors.error),
            const SizedBox(height: 16),
            if (errorCode != null)
              Text(errorCode!, style: AppTextStyles.labelSmall.copyWith(color: AppColors.error)),
            const SizedBox(height: 8),
            Text(message ?? 'Unknown error', style: AppTextStyles.bodyMedium, textAlign: TextAlign.center),
            if (onRetry != null) ...[
              const SizedBox(height: 16),
              ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
            ],
          ],
        ),
      ),
    );
  }
}
