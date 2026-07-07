import 'package:flutter/material.dart';
import '../../features/scan/scan_config.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class DeviceTypeSelector extends StatelessWidget {
  final DeviceType? selected;
  final ValueChanged<DeviceType> onSelected;

  const DeviceTypeSelector({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  static const _mainTypes = [
    DeviceType.lock,
    DeviceType.gateway,
    DeviceType.standaloneDoorSensor,
    DeviceType.waterMeter,
    DeviceType.electricMeter,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.4,
        children: _mainTypes.map((type) {
          final meta = _meta(type);
          final isSelected = selected == type;
          return Material(
            color: isSelected
                ? AppColors.primary.withValues(alpha: 0.12)
                : AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => onSelected(type),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.onSurfaceSecondary.withValues(alpha: 0.3),
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(meta.icon,
                        size: 32,
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.onSurfaceSecondary),
                    const SizedBox(height: 8),
                    Text(meta.label, style: AppTextStyles.titleMedium),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  ({IconData icon, String label}) _meta(DeviceType type) {
    switch (type) {
      case DeviceType.lock:
        return (icon: Icons.lock, label: 'Lock');
      case DeviceType.gateway:
        return (icon: Icons.router, label: 'Gateway');
      case DeviceType.standaloneDoorSensor:
        return (icon: Icons.sensors, label: 'Door Sensor');
      case DeviceType.waterMeter:
        return (icon: Icons.water_drop, label: 'Water Meter');
      case DeviceType.electricMeter:
        return (icon: Icons.bolt, label: 'Electric Meter');
      default:
        return (icon: Icons.devices, label: type.name);
    }
  }
}
