import 'package:wiki_viewer/model/wiki.dart';
import 'package:flutter/material.dart';

class WikiData extends StatelessWidget {
  List<Wiki> wikis = List<Wiki>();

  WikiData({this.wikis});

  List<Widget> buildWikiList(List<Wiki> wikis, BuildContext context) {
    List<Widget> widgets = List<Widget>();

    wikis.forEach((e) {
      String name = e.wikiName;
      widgets.add(
        Container(
          color: e.wikiTheme.wikiTheme.backgroundColor,
          child: FlatButton(
            child: Text('$name'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return e;
                  },
                ),
              );
            },
          ),
        ),
      );
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(5),
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      crossAxisCount: 2,
      children: buildWikiList(wikis, context),
    );
  }
}
