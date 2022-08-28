class Notice {
  final String title;
  final String description;
  final String date;
  final String downloadLink;
  final String documentType;

  Notice({
    required this.title,
    required this.description,
    required this.date,
    required this.downloadLink,
    required this.documentType,
  });

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      title: json['title'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      downloadLink: json['download_link'] as String,
      documentType: json['document_type'] as String,
    );
  }
}
