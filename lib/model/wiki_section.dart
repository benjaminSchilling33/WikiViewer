import 'package:wiki_viewer/model/wiki_section_references.dart';

class WikiSection {
  String sectionId = '';
  String sectionTitle = '';
  String sectionText = '';
  WikiSectionReferences references = WikiSectionReferences();

  WikiSection({
    this.sectionId,
    this.sectionTitle,
    this.sectionText,
    this.references,
  });

  factory WikiSection.fromJson(var json) {
    return WikiSection(
      sectionId: json['sectionId'] == null ? '' : json['sectionId'],
      sectionTitle: json['sectionTitle'] == null ? '' : json['sectionTitle'],
      sectionText: json['sectionText'] == null ? '' : json['sectionText'],
      references: json['sectionReferences'] == null
          ? WikiSectionReferences()
          : WikiSectionReferences.fromJson(json['sectionReferences']),
    );
  }
}
