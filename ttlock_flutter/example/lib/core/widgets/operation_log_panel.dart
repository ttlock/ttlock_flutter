import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../command/operation_record.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class OperationLogPanel extends ConsumerWidget {
  final List<OperationRecord> records;
  final VoidCallback? onClear;

  const OperationLogPanel({
    super.key,
    required this.records,
    this.onClear,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        initiallyExpanded: false,
        title: Row(
          children: [
            const Icon(Icons.history, size: 18, color: AppColors.primary),
            const SizedBox(width: 8),
            Text('Operation Log', style: AppTextStyles.titleMedium),
            const Spacer(),
            if (records.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${records.length}',
                  style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary),
                ),
              ),
            if (records.isNotEmpty) const SizedBox(width: 8),
          ],
        ),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        children: [
          if (onClear != null && records.isNotEmpty)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: onClear,
                icon: const Icon(Icons.clear_all, size: 16),
                label: const Text('Clear'),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.error,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ),
          if (records.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Text(
                  'No operations yet',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.onSurfaceSecondary,
                  ),
                ),
              ),
            )
          else
            ...records.map((record) => _OperationLogEntry(record: record)),
        ],
      ),
    );
  }
}

class _OperationLogEntry extends StatelessWidget {
  final OperationRecord record;

  const _OperationLogEntry({required this.record});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => _copyToClipboard(context),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                record.isSuccess ? Icons.check_circle : Icons.error,
                size: 18,
                color: record.isSuccess ? AppColors.success : AppColors.error,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      record.methodName,
                      style: AppTextStyles.codeMedium,
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(record.durationMs, style: AppTextStyles.labelSmall),
                        if (record.errorCode != null) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                            decoration: BoxDecoration(
                              color: AppColors.error.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              record.errorCode!,
                              style: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.error,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => _copyToClipboard(context),
                icon: Icon(
                  Icons.copy,
                  size: 16,
                  color: AppColors.onSurfaceSecondary,
                ),
                tooltip: 'Copy details',
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _copyToClipboard(BuildContext context) {
    final text = record.toPrettyJson();
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Operation details copied'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
