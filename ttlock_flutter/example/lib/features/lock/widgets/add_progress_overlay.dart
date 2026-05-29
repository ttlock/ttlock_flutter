import 'package:flutter/material.dart';

import '../../../core/theme/app_text_styles.dart';

class AddProgressOverlay extends StatelessWidget {
  const AddProgressOverlay({
    super.key,
    required this.message,
    this.progress,
    this.subtitle,
  });

  final String message;
  final String? subtitle;
  final double? progress;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: Center(
        child: Card(
          margin: const EdgeInsets.all(32),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (progress != null)
                  LinearProgressIndicator(value: progress)
                else
                  const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(message, style: AppTextStyles.titleMedium, textAlign: TextAlign.center),
                if (subtitle != null) ...[
                  const SizedBox(height: 8),
                  Text(subtitle!, style: AppTextStyles.bodySmall, textAlign: TextAlign.center),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
