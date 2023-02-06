import 'package:flutter/material.dart';

import '../utils/preferance_helper.dart';
import 'language.dart';

class LanguageProvider with ChangeNotifier {
  Locale _currentLocale = Locale(PreferenceHelper.getString(PreferenceHelper.keyLanguage).toString());

  get currentLocale => _currentLocale;

  void changeLocale(String locale) {
    _currentLocale = Locale(locale);
    notifyListeners();
  }
}
