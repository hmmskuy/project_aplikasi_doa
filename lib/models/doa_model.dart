class DoaModel {
  final String title;
  final String arab;
  final String latin;
  final String arti;

  DoaModel({
    required this.title,
    required this.arab,
    required this.latin,
    required this.arti,
  });

  factory DoaModel.fromJson(Map<String, dynamic> json) {
    return DoaModel(
      title: json['title'],
      arab: json['arab'],
      latin: json['latin'],
      arti: json['arti'],
    );
  }
}
