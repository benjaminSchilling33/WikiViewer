import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:wiki_viewer/model/wiki.dart';
import 'package:wiki_viewer/model/wiki_data.dart';

class WikiFileReader {
  static Future<WikiData> readWikiFiles(BuildContext context) async {
    String jsonWiki = await DefaultAssetBundle.of(context)
        .loadString('examples/example.json');
    final jsonResult = json.decode(jsonWiki);

    List<Wiki> wikis = List<Wiki>();

    wikis.add(Wiki.fromJson(jsonResult));

    return WikiData(
      wikis: wikis,
    );
  }
}
