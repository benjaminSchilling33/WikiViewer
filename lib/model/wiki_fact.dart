class WikiFact {
  String factName = '';
  String factValue = '';

  WikiFact({
    this.factName,
    this.factValue,
  });

  factory WikiFact.fromJson(var json) {
    return WikiFact(
      factName: json['factName'],
      factValue: json['factValue'],
    );
  }
}
