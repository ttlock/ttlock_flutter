enum AppMode { onPremise, online }

abstract final class AppEnv {
  static AppMode get mode {
    const modeStr = String.fromEnvironment('mode');
    switch (modeStr) {
      case 'online':
        return AppMode.online;
      default:
        return AppMode.onPremise;
    }
  }

  static bool get isOnPremise => mode == AppMode.onPremise;
  static bool get isOnline => mode == AppMode.online;
}
