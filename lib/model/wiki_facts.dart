import 'package:wiki_viewer/model/wiki_fact.dart';

class WikiFacts {
  List<WikiFact> facts = List<WikiFact>();

  WikiFacts({this.facts});

  factory WikiFacts.fromJson(var json) {
    List<WikiFact> facts = List<WikiFact>();
    for (var j in json) {
      facts.add(WikiFact.fromJson(j));
    }
    return WikiFacts(
      facts: facts,
    );
  }
}
