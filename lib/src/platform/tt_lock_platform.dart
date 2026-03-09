/// Event emitted by the platform stream for stream/progress commands.
class PlatformStreamEvent {
  final bool isProgress;
  final Map<String, dynamic> data;
  const PlatformStreamEvent({required this.isProgress, required this.data});
}

/// Abstract platform interface for TTLock native communication.
///
/// All native interactions go through this interface, making it possible
/// to substitute a mock implementation for testing.
abstract class TTLockPlatform {
  /// Invoke a one-shot command and wait for a single result.
  ///
  /// [params] can be a [Map<String, dynamic>] or a plain [String] (e.g. lockData).
  /// Returns the data map from the success event.
  /// Throws an appropriate exception on failure.
  Future<Map<String, dynamic>> invoke(String command, [Object? params]);

  /// Send a command without waiting for a result (fire-and-forget).
  ///
  /// Used for stop-scan commands and disconnect.
  Future<void> send(String command, [Object? params]);

  /// Invoke a stream/progress command and return a stream of events.
  ///
  /// [params] can be a [Map<String, dynamic>] or a plain [String].
  ///
  /// For scan commands, each [PlatformStreamEvent] has `isProgress = false`
  /// and contains scan result data. The stream stays open until the
  /// corresponding stop command is sent via [send].
  ///
  /// For progress commands (addFingerprint, addCard, addFace), events with
  /// `isProgress = true` are progress updates, and the final event with
  /// `isProgress = false` is the completed result. The stream closes after
  /// the final result or on error.
  Stream<PlatformStreamEvent> eventStream(String command, [Object? params]);

  /// Whether debug logging is enabled.
  bool get printLog;
  set printLog(bool value);
}
