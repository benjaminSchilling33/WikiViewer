import 'package:flutter/material.dart';

import 'package:wiki_viewer/model/wiki_pages.dart';
import 'package:wiki_viewer/model/wiki_theme.dart';

class Wiki extends StatelessWidget {
  String wikiId;
  String wikiName;
  WikiTheme wikiTheme;
  WikiPages wikiPages;

  Wiki({this.wikiId, this.wikiName, this.wikiTheme, this.wikiPages});

  factory Wiki.fromJson(var json) {
    return Wiki(
      wikiId: json['wikiId'],
      wikiName: json['wikiName'],
      wikiTheme: WikiTheme.fromJson(json['wikiTheme']),
      wikiPages: WikiPages.fromJson(
        json['wikiPages'],
        json['wikiName'],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: wikiTheme.wikiTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('$wikiName'),
        ),
        body: WikiPages(pages: wikiPages.pages),
      ),
    );
  }
}
