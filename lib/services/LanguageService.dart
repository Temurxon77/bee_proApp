import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = Locale('uz','UZ');

  Locale get appLocal => _appLocale ?? Locale("uz","UZ");
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale('uz');
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code'));
    return Null;
  }


  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    print("HEY: $appLocal");
    if(type == Locale("ru")){
      print("HEY: RU");
        _appLocale = Locale("ru");
        await prefs.setString('language_code', 'ru');
        await prefs.setString('countryCode', 'RU');
    } else if(type == Locale("en")){
      print("HEY: EN");
      _appLocale = Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    } else {
      print("HEY: UZ");
        _appLocale = Locale("uz");
        await prefs.setString('language_code', 'uz');
        await prefs.setString('countryCode', 'UZ');
    }
    notifyListeners();
  }
}