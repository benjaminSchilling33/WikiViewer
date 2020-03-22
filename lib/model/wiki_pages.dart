import 'package:flutter/material.dart';

import 'package:wiki_viewer/model/wiki_page.dart';
import 'package:wiki_viewer/model/wiki_theme.dart';

class WikiPages extends StatelessWidget {
  List<WikiPage> pages = List<WikiPage>();

  WikiPages({this.pages});

  factory WikiPages.fromJson(var json, String wikiName) {
    List<WikiPage> pages = List<WikiPage>();
    for (var j in json) {
      pages.add(WikiPage.fromJson(j, wikiName));
    }
    return WikiPages(
      pages: pages,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: pages.length,
            itemBuilder: (context, index) {
              String name = pages[index].pageName;
              return FlatButton(
                child: Text('$name'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return pages[index];
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
