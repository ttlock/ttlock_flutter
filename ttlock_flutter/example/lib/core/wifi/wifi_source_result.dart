class WifiSourceResult {
  const WifiSourceResult({
    required this.currentSsid,
    required this.availableSsids,
    required this.canScan,
    this.errorMessage,
  });

  final String? currentSsid;
  final List<String> availableSsids;
  final bool canScan;
  final String? errorMessage;
}
