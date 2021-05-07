import 'package:flutter/material.dart';
import 'package:marvel/values/dark_light.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/theme_data.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _darkTheme = true;
  ThemeNotifier themeNotifier;
  @override
  void initState() {
    themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _darkTheme = (themeNotifier.getTheme() == _darkTheme);
    return Scaffold(
      appBar: null,
      body: _body(),
    );
  }

  Widget _body() {
    return ListView(
      children: [
        ListTile(
          title: Text("dark Theme"),
          contentPadding: EdgeInsets.only(left: 16),
          trailing: Transform.scale(
            scale: 0.4,
            child: Switch(
              value: _darkTheme,
              onChanged: (val) {
                setState(() {
                  _darkTheme = val;
                });
                onThemeChanged(val, themeNotifier);
              },
            ),
          ),
        )
      ],
    );
  }

  void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(themeNotifier.lightThem)
        : themeNotifier.setTheme(ligtTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool("darkMode", value);
  }
}
