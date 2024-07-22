class Pasar {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  Pasar({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Pasar.fromJson(Map<String, dynamic> json) {
    return Pasar(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}