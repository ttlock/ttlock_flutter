/// Remote keypad command constants for platform channel.
class TTRemoteKeypadCommands {
  TTRemoteKeypadCommands._();

  static const String COMMAND_START_SCAN_REMOTE_KEYPAD =
      "remoteKeypadStartScan";
  static const String COMMAND_STOP_SCAN_REMOTE_KEYPAD = "remoteKeypadStopScan";
  static const String COMMAND_INIT_REMOTE_KEYPAD = "remoteKeypadInit";

  static const String COMMAND_INIT_MULTIFUNCTIONAL_REMOTE_KEYPAD =
      "multifunctionalRemoteKeypadInit";
  static const String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_DELETE_STORED_LOCK =
      "multifunctionalRemoteKeypadDeleteLock";
  static const String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_GET_STORED_LOCK =
      "multifunctionalRemoteKeypadGetLocks";
  static const String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT =
      "multifunctionalRemoteKeypadAddFingerprint";
  static const String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD =
      "multifunctionalRemoteKeypadAddCard";
}
