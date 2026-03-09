/// Base exception for all TTLock SDK errors.
class TTException implements Exception {
  final int code;
  final String message;

  const TTException({required this.code, this.message = ''});

  @override
  String toString() => '$runtimeType(code: $code, message: $message)';
}
