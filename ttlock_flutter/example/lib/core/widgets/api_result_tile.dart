import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ApiResultTile extends StatelessWidget {
  final String methodName;
  final String? result;
  final int? durationMs;
  final bool isSuccess;
  final VoidCallback? onTap;

  const ApiResultTile({
    super.key,
    required this.methodName,
    this.result,
    this.durationMs,
    this.isSuccess = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: Icon(
          isSuccess ? Icons.check_circle : Icons.error,
          color: isSuccess ? AppColors.success : AppColors.error,
          size: 20,
        ),
        title: Text(methodName, style: AppTextStyles.codeMedium),
        subtitle: result != null
            ? Text(result!, style: AppTextStyles.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis)
            : null,
        trailing: durationMs != null ? Text('${durationMs}ms', style: AppTextStyles.labelSmall) : null,
        onTap: onTap,
      ),
    );
  }
}
