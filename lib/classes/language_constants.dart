// ignore_for_file: constant_identifier_names, no_leading_underscores_for_local_identifiers, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String FRENCH = 'fr';
// ignore: constant_identifier_names
const String ARABIC = 'ar';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  // ignore: no_leading_underscores_for_local_identifiers
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? FRENCH;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return const Locale(ENGLISH, '');
    case FRENCH:
      return const Locale(FRENCH, "");
    case ARABIC:
      return const Locale(ARABIC, "");
    default:
      return const Locale(FRENCH, '');
  }
}

AppLocalizations translation(BuildContext context) {
  
  return AppLocalizations.of(context)!;
}