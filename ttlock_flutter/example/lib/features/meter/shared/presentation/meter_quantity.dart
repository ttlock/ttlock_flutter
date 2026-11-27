/// 把数值与**标准单位**拼成展示串（如 `9.89 千瓦时`、`10.00 吨`）。
///
/// [value] 为空/全空白 → 返回空串，交给 `MeterLabeledValueTile` 落 `—`；
/// 否则会出现「 千瓦时」这种只有单位没有数字的展示。
///
/// 用于**我们自己拼的数字**：云端 `detail` 返回的 `totalKwh` / `remainderKwh` /
/// `totalM3` / `remainderM3` 都是裸数字，单位得由客户端补。
/// 服务端已自带单位的字符串（如 `listRecords` 的 `"0.00kWh"`）**不走这里** ——
/// 解析服务端自由文本会随格式漂移而碎。
String meterQuantity(String value, String unit) {
  final v = value.trim();
  return v.isEmpty ? '' : '$v $unit';
}
