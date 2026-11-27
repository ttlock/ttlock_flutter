DateTime? nullableDateTimeMsFromJson(Object? ms) {
  if (ms == null) return null;
  final value = switch (ms) {
    int i => i,
    num n => n.toInt(),
    _ => int.tryParse(ms.toString()),
  };
  if (value == null) return null;
  return DateTime.fromMillisecondsSinceEpoch(value);
}

int? nullableDateTimeMsToJson(DateTime? dt) => dt?.millisecondsSinceEpoch;

/// 容错: cloud 部分数字字段以 String 返回（如 keyboardPwdType:"3"、keyId:"2342342"）。
int intFromDynamic(Object? v) {
  if (v is int) return v;
  if (v is num) return v.toInt();
  return int.tryParse(v?.toString() ?? '') ?? 0;
}

/// 缺省字段保持 null（如 lock/detail 中从未配置的设置项不会出现）。
int? nullableIntFromDynamic(Object? v) {
  if (v == null) return null;
  if (v is int) return v;
  if (v is num) return v.toInt();
  return int.tryParse(v.toString());
}

String stringFromDynamic(Object? v) => v?.toString() ?? '';

/// 容错: bool 字段收到 1/0 或 "1"/"0" 时安全转换。
bool boolFromDynamic(Object? v) =>
    v == true || v == 1 || v == '1' || v == 'true';
