import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class DeviceCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? mac;
  final IconData icon;
  final int? rssi;
  final bool isOnline;
  final bool isInited;
  final VoidCallback? onTap;
  final Widget? trailing;

  const DeviceCard({
    super.key,
    required this.title,
    this.subtitle,
    this.mac,
    required this.icon,
    this.rssi,
    this.isOnline = false,
    this.isInited = false,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: isOnline ? AppColors.success.withValues(alpha: 0.1) : AppColors.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: isOnline ? AppColors.success : AppColors.onSurfaceSecondary),
        ),
        title: Text(title, style: AppTextStyles.titleMedium),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (subtitle != null) Text(subtitle!, style: AppTextStyles.bodySmall),
            if (mac != null) Text(mac!, style: AppTextStyles.codeMedium.copyWith(color: AppColors.onSurfaceSecondary)),
          ],
        ),
        trailing: trailing ?? _buildStatusIndicator(),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  Widget _buildStatusIndicator() {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isInited
            ? AppColors.onSurfaceSecondary.withValues(alpha: 0.3)
            : AppColors.success,
      ),
    );
  }
}
