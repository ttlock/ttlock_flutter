import 'dart:convert';

class OperationRecord {
  final String methodName;
  final Map<String, dynamic> params;
  final Duration duration;
  final bool isSuccess;
  final dynamic data;
  final String? errorCode;
  final String? errorMessage;
  final DateTime timestamp;

  const OperationRecord({
    required this.methodName,
    this.params = const {},
    required this.duration,
    required this.isSuccess,
    this.data,
    this.errorCode,
    this.errorMessage,
    required this.timestamp,
  });

  String get durationMs => '${duration.inMilliseconds}ms';

  String get summary => isSuccess
      ? '✅ $durationMs'
      : '❌ ${errorCode ?? "Unknown"}';

  Map<String, dynamic> toJson() => {
    'methodName': methodName,
    'params': params,
    'durationMs': duration.inMilliseconds,
    'isSuccess': isSuccess,
    'data': data,
    'errorCode': errorCode,
    'errorMessage': errorMessage,
    'timestamp': timestamp.toIso8601String(),
  };

  String toPrettyJson() => const JsonEncoder.withIndent('  ').convert(toJson());
}
