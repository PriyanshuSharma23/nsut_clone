class Branch {
  final String name;
  final String code;

  Branch({
    required this.name,
    required this.code,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      name: json['name'] as String,
      code: json['code'] as String,
    );
  }
}
