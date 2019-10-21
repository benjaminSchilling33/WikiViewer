import 'package:wiki_viewer/model/wiki_section.dart';

class WikiSections {
  List<WikiSection> sections;

  WikiSections({this.sections});

  factory WikiSections.fromJson(var json) {
    List<WikiSection> sections = List<WikiSection>();
    for (var j in json) {
      sections.add(WikiSection.fromJson(j));
    }
    return WikiSections(
      sections: sections,
    );
  }
}
