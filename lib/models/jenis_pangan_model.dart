class JenisPangan {
  final int id;
  final String name;
  final String gambar;
  final DateTime createdAt;
  final DateTime updatedAt;

  JenisPangan({
    required this.id,
    required this.name,
    required this.gambar,
    required this.createdAt,
    required this.updatedAt,
  });

  factory JenisPangan.fromJson(Map<String, dynamic> json) {
    return JenisPangan(
      id: json['id'],
      name: json['name'],
      gambar: json['gambar'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'gambar': gambar,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
