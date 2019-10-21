import 'package:flutter/material.dart';

class WikiTheme {
  ThemeData wikiTheme;

  WikiTheme({this.wikiTheme});

  factory WikiTheme.fromJson(var json) {
    return WikiTheme(
      wikiTheme: ThemeData(
        backgroundColor: hexToColor(json['backgroundColor']),
        scaffoldBackgroundColor: hexToColor(json['scaffoldBackgroundColor']),
      ),
    );
  }

  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
