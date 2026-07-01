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
  final VoidCallback? onLongPress;
  final Widget? trailing;

  // New fields
  final int? power;
  final String? switchState;
  final String? accessoryInfo;

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
    this.onLongPress,
    this.trailing,
    this.power,
    this.switchState,
    this.accessoryInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        onLongPress: onLongPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLeadingIcon(),
              const SizedBox(width: 12),
              Expanded(child: _buildContent()),
              const SizedBox(width: 12),
              trailing ?? _buildStatusIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeadingIcon() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: isOnline
            ? AppColors.success.withValues(alpha: 0.1)
            : AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        icon,
        color: isOnline ? AppColors.success : AppColors.onSurfaceSecondary,
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.titleMedium),
        if (subtitle != null) ...[
          const SizedBox(height: 2),
          Text(subtitle!, style: AppTextStyles.bodySmall),
        ],
        if (mac != null) ...[
          const SizedBox(height: 2),
          Text(
            mac!,
            style: AppTextStyles.codeMedium.copyWith(
              color: AppColors.onSurfaceSecondary,
            ),
          ),
        ],
        if (power != null) ...[
          const SizedBox(height: 6),
          _buildBatteryBar(power!),
        ],
        if (switchState != null || accessoryInfo != null) ...[
          const SizedBox(height: 4),
          _buildInfoRow(),
        ],
      ],
    );
  }

  Widget _buildBatteryBar(int level) {
    final clamped = level.clamp(0, 100);
    final color = clamped > 30
        ? AppColors.success
        : (clamped > 10 ? AppColors.warning : AppColors.error);
    return Row(
      children: [
        Icon(Icons.battery_full, size: 14, color: color),
        const SizedBox(width: 4),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: clamped / 100,
              backgroundColor: AppColors.surface,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 4,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Text('$clamped%', style: AppTextStyles.labelSmall.copyWith(fontSize: 10)),
      ],
    );
  }

  Widget _buildInfoRow() {
    return Row(
      children: [
        if (switchState != null) ...[
          Icon(
            switchState!.toLowerCase() == 'locked'
                ? Icons.lock
                : Icons.lock_open,
            size: 14,
            color: AppColors.primary,
          ),
          const SizedBox(width: 4),
          Text(switchState!, style: AppTextStyles.labelSmall),
        ],
        if (switchState != null && accessoryInfo != null)
          const SizedBox(width: 12),
        if (accessoryInfo != null)
          Text(
            accessoryInfo!,
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.onSurfaceSecondary,
            ),
          ),
      ],
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
