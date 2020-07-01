import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  //
  static var _t = Translations.byLocale("en_us") +
      {
        "en_us": {
          "Hi": "Hi",
          "Goodbye": "Goodbye",
        },
        "es_es": {
          "Hi": "Hola",
          "Goodbye": "Adiós",
        }
      };
  // static var _t = Translations("en_us") +
  // {
  //   "en_us": "Comic Book",
  //   "es": "Historieta",
  // } +
  // {
  //   "en_us": "Hi",
  //   "es": "Hola",
  // };

  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(int value) => localizePlural(value, this, _t);

  String version(Object modifier) => localizeVersion(modifier, this, _t);

  Map<String, String> allVersions() => localizeAllVersions(this, _t);
}
