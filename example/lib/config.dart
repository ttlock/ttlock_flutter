/// A class to hold configuration data for the gateway.
class GatewayConfig {
  /// The UID of the TTLock account.
  ///
  /// This can be obtained from the TTLock API.
  static int uid = 17498;
  /// The login password for the TTLock account.
  static String ttlockLoginPassword = '111111';
  /// The name of the gateway.
  static String gatewayName = 'My gateway 1';
}

/// A class to hold configuration data for the lock.
class LockConfig {
  /// The lock data string used to operate the lock.
  static String lockData = "";
  /// The MAC address of the lock.
  static String lockMac = "";
}

