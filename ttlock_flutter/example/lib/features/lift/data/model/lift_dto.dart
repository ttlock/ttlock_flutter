import 'dart:convert';

/// lift 域仅含写接口；此文件提供 floorList 序列化辅助。
abstract final class LiftDto {
  LiftDto._();

  /// API 要求 floorList 为 JSON 数组字符串，如 `[1,2,3]`。
  static String encodeFloorList(List<String> floors) => jsonEncode(floors);
}
