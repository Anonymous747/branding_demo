import 'dart:convert';

import 'package:demo_branding/utils/brand_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<Locale> supportedLocales = [const Locale("ru")];

// ignore: non_constant_identifier_names
class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    late final String jsonDefaultString;
    late final String jsonString;

    await Future.wait([
      rootBundle
          .loadString('lang/default/${locale.languageCode}.json')
          .then((value) => jsonDefaultString = value),
      rootBundle
          .loadString('lang/${BrandProvider.name}/${locale.languageCode}.json')
          .then((value) => jsonString = value),
    ]);
    Map<String, dynamic> jsonDefaultMap = json.decode(jsonDefaultString);
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonDefaultMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    final brandedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    _localizedStrings.addAll(brandedStrings);

    return true;
  }

  String get brandName => _translate("brandName");

  String get appName => _translate("appNameText");

  String get appLogo => _translate("appLogo");

  String get appColor => _translate("appColor");

  String get defaultLogo => _translate("defaultLogo");

  String _translate(String key) {
    return _localizedStrings[key]!;
  }
}

// LocalizationsDelegate is a factory for a set of localized resources
// In this case, the localized strings will be gotten in an AppLocalizations object
class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return supportedLocales.map((it) {
      return it.languageCode;
    }).contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
