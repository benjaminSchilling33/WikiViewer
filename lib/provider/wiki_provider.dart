import 'package:flutter/cupertino.dart';
import 'package:wiki_viewer/model/wiki.dart';
import 'package:wiki_viewer/model/wiki_data.dart';
import 'package:wiki_viewer/utilities/wiki_file_reader.dart';

class WikiProvider extends ChangeNotifier {
  Future<WikiData> futureWikiData;
  WikiData wikiData;
  bool isInitialized = false;

  WikiProvider(BuildContext context) {
    futureWikiData = WikiFileReader.readWikiFiles(context);
  }

  void initializeProvider(WikiData wikiData) async {
    if (!isInitialized) {
      this.wikiData = wikiData;
      isInitialized = true;
    }
  }
}
