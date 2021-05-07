import 'package:flutter/cupertino.dart';

class LocaleManagment extends ChangeNotifier {
  Locale locale;

  setLocale(locale) {
    this.locale = locale;
    notifyListeners();
  }
}
