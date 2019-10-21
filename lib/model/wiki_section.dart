import 'package:wiki_viewer/model/wiki_section_references.dart';

class WikiSection {
  String sectionId;
  String sectionTitle;
  String sectionText;
  WikiSectionReferences references;

  WikiSection({
    this.sectionId,
    this.sectionTitle,
    this.sectionText,
    this.references,
  });

  factory WikiSection.fromJson(var json) {
    return WikiSection(
      sectionId: json['sectionId'],
      sectionTitle: json['sectionTitle'],
      sectionText: json['sectionText'],
      references: WikiSectionReferences.fromJson(json['sectionReferences']),
    );
  }
}
