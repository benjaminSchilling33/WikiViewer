import 'package:flutter/material.dart';

import 'package:wiki_viewer/model/wiki_facts.dart';
import 'package:wiki_viewer/model/wiki_sections.dart';
import 'package:wiki_viewer/model/wiki_theme.dart';

class WikiPage extends StatelessWidget {
  String wikiName = '';
  String pageId = '';
  String pageName = '';
  String abstract = '';
  WikiFacts facts = WikiFacts();
  WikiSections sections = WikiSections();

  WikiPage({
    this.wikiName,
    this.pageId,
    this.pageName,
    this.abstract,
    this.facts,
    this.sections,
  });

  factory WikiPage.fromJson(var json, String wikiName) {
    return WikiPage(
      wikiName: wikiName,
      pageId: json['pageId'],
      pageName: json['pageName'],
      abstract: json['abstract'],
      facts: WikiFacts.fromJson(json['facts']),
      sections: WikiSections.fromJson(json['sections']),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$wikiName - $pageName'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: sections.sections.length,
              itemBuilder: (context, index) {
                String name = sections.sections[index].sectionTitle;
                String text = sections.sections[index].sectionText;
                List<Widget> widgets = List<Widget>();
                widgets.add(ListTile(
                  title: Text('$name'),
                ));
                widgets.add(Text('$text'));
                for (var ref
                    in sections.sections[index].references.references) {
                  widgets.add(ref);
                }
                return Card(
                  child: Column(
                    children: widgets,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
