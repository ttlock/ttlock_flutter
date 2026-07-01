import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class DeviceInfoSection extends StatelessWidget {
  final String? mac;
  final int? batteryLevel;
  final String? switchState;
  final String? firmwareVersion;
  final String? hardwareVersion;
  final String? model;

  const DeviceInfoSection({
    super.key,
    this.mac,
    this.batteryLevel,
    this.switchState,
    this.firmwareVersion,
    this.hardwareVersion,
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (mac != null) ...[
              Row(
                children: [
                  Icon(Icons.bluetooth, size: 16, color: AppColors.primary),
                  const SizedBox(width: 8),
                  Text(mac!, style: AppTextStyles.codeMedium),
                ],
              ),
              const SizedBox(height: 12),
            ],
            if (batteryLevel != null) ...[
              _buildBatteryBar(batteryLevel!),
              const SizedBox(height: 12),
            ],
            if (switchState != null) ...[
              _buildSwitchStatus(switchState!),
              const SizedBox(height: 12),
            ],
            if (firmwareVersion != null || hardwareVersion != null || model != null)
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  if (firmwareVersion != null) _buildChip('FW: $firmwareVersion'),
                  if (hardwareVersion != null) _buildChip('HW: $hardwareVersion'),
                  if (model != null) _buildChip(model!),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBatteryBar(int level) {
    final clamped = level.clamp(0, 100);
    final color = clamped > 30
        ? AppColors.success
        : (clamped > 10 ? AppColors.warning : AppColors.error);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.battery_full, size: 16, color: color),
            const SizedBox(width: 8),
            Text('Battery: $clamped%', style: AppTextStyles.bodySmall),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: clamped / 100,
            backgroundColor: AppColors.surface,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 6,
          ),
        ),
      ],
    );
  }

  Widget _buildSwitchStatus(String state) {
    final lowered = state.toLowerCase();
    final isLocked = lowered == 'locked';
    return Row(
      children: [
        Icon(
          isLocked ? Icons.lock : Icons.lock_open,
          size: 16,
          color: isLocked ? AppColors.success : AppColors.warning,
        ),
        const SizedBox(width: 8),
        Text(state, style: AppTextStyles.bodySmall),
      ],
    );
  }

  Widget _buildChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary),
      ),
    );
  }
}
