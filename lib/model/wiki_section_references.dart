import 'package:wiki_viewer/model/wiki_section_reference.dart';

class WikiSectionReferences {
  List<WikiSectionReference> references;

  WikiSectionReferences({this.references});

  factory WikiSectionReferences.fromJson(var json) {
    List<WikiSectionReference> references = List<WikiSectionReference>();
    for (var j in json) {
      references.add(WikiSectionReference.fromJson(j));
    }
    return WikiSectionReferences(
      references: references,
    );
  }
}
