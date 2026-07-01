import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/ttlock_providers.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class DeveloperTag extends ConsumerWidget {
  final String methodName;
  final int durationMs;
  final bool isSuccess;
  final String? errorCode;
  final String? jsonData;

  const DeveloperTag({
    super.key,
    required this.methodName,
    required this.durationMs,
    required this.isSuccess,
    this.errorCode,
    this.jsonData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devMode = ref.watch(developerModeProvider);
    if (!devMode) return const SizedBox.shrink();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isSuccess ? Icons.check_circle : Icons.error,
                  size: 18,
                  color: isSuccess ? AppColors.success : AppColors.error,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(methodName, style: AppTextStyles.codeMedium),
                ),
                if (errorCode != null) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.error.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      errorCode!,
                      style: AppTextStyles.labelSmall.copyWith(color: AppColors.error),
                    ),
                  ),
                ],
                const SizedBox(width: 8),
                Text('${durationMs}ms', style: AppTextStyles.labelSmall),
              ],
            ),
            if (jsonData != null) _buildJsonSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildJsonSection(BuildContext context) {
    return _ExpandableJsonSection(jsonData: jsonData!);
  }
}

class _ExpandableJsonSection extends StatefulWidget {
  final String jsonData;

  const _ExpandableJsonSection({required this.jsonData});

  @override
  State<_ExpandableJsonSection> createState() => _ExpandableJsonSectionState();
}

class _ExpandableJsonSectionState extends State<_ExpandableJsonSection> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Row(
            children: [
              Icon(
                _expanded ? Icons.expand_less : Icons.expand_more,
                size: 16,
                color: AppColors.onSurfaceSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                _expanded ? 'Hide JSON' : 'Show JSON',
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.onSurfaceSecondary,
                ),
              ),
            ],
          ),
        ),
        if (_expanded) ...[
          const SizedBox(height: 4),
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: widget.jsonData));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('JSON copied to clipboard'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                widget.jsonData,
                style: AppTextStyles.bodySmall.copyWith(
                  fontFamily: 'monospace',
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

}
