/// 表计「连接成功」二次确认弹窗的参数。
///
/// 水表与电表只在文案上不同（红灯闪烁 / 红灯交替闪烁），交互完全一致。
class MeterConnectionConfirmArgs {
  const MeterConnectionConfirmArgs({required this.isWaterMeter});

  final bool isWaterMeter;

  @override
  bool operator ==(Object other) =>
      other is MeterConnectionConfirmArgs && other.isWaterMeter == isWaterMeter;

  @override
  int get hashCode => isWaterMeter.hashCode;

  @override
  String toString() =>
      'MeterConnectionConfirmArgs(isWaterMeter: $isWaterMeter)';
}
