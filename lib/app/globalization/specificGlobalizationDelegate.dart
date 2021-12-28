import 'package:flutter/material.dart';
import 'package:dhiaeddine_belkhiria/app/globalization/globalizationManager.dart';

class SpecificGlobalizationDelegate
    extends LocalizationsDelegate<GlobalizationManager> {
  final Locale overriddenLocale;

  const SpecificGlobalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  bool shouldReload(LocalizationsDelegate<GlobalizationManager> old) => true;

  @override
  Future<GlobalizationManager> load(Locale locale) =>
      GlobalizationManager.load(overriddenLocale);
}
