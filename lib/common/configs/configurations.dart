import 'default_env.dart';

class Configurations {
  static String _environment = DefaultConfig.environment;
  static String _baseUrl = DefaultConfig.baseUrl;
  static String _defaultLanguage = DefaultConfig.defaultLanguage;

  void setConfigurationValues(Map<String, dynamic> value) {
    _environment = value['environment'] ?? DefaultConfig.environment;
    _baseUrl = value['baseUrl'] ?? DefaultConfig.baseUrl;

    _defaultLanguage =
        value['defaultLanguage'] ?? DefaultConfig.defaultLanguage;
  }

  static String get environment => _environment;
  static String get baseUrl => _baseUrl;
  static String get defaultLanguage => _defaultLanguage;
}
