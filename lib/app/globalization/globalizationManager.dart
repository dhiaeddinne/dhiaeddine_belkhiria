import 'package:flutter/material.dart';
import 'package:dhiaeddine_belkhiria/app/globalization/fr.dart';
import 'package:dhiaeddine_belkhiria/app/globalization/en.dart';

class GlobalizationManager {
  GlobalizationManager(this.locale);

  Locale locale;

  static GlobalizationManager of(BuildContext context) {
    return Localizations.of(context, GlobalizationManager);
  }

  static Map<String, Map<String, Map<String, String>>> _localizedValues = {
    'en': EnMessages.messages,
    'fr': FrMessages.messages
  };

  String getMessage(String key1, String key2) {
    return _localizedValues[locale.languageCode]?[key1]?[key2] ??
        "$key1.$key2 not found";
  }

  static Future<GlobalizationManager> load(Locale locale) async {
    GlobalizationManager translations = new GlobalizationManager(locale);
    return translations;
  }

  get currentLanguage => locale.languageCode;
}
