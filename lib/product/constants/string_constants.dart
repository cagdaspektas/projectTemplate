class StringConstants {
  static StringConstants? _instace;
  static StringConstants get instance {
    _instace ??= StringConstants._init();
    return _instace!;
  }

  StringConstants._init();
  final String appName = 'App Name';
}
