enum AppSite {
  cn('cn', 'https://api.sciener.com'),
  overseas('overseas', 'https://euapi.sciener.com');

  const AppSite(this.value, this.baseUrl);
  final String value;
  final String baseUrl;

  static AppSite fromValue(String? v) =>
      AppSite.values.firstWhere((e) => e.value == v, orElse: () => AppSite.cn);
}
