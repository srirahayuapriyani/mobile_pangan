class SubjenisPangan {
  final int id;
  final String jenisPanganId;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  SubjenisPangan({
    required this.id,
    required this.jenisPanganId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create an instance of SubjenisPangan from JSON
  factory SubjenisPangan.fromJson(Map<String, dynamic> json) {
    return SubjenisPangan(
      id: json['id'],
      jenisPanganId: json['jenis_pangan_id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Method to convert an instance of SubjenisPangan to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jenis_pangan_id': jenisPanganId,
      'name': name,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  static List<SubjenisPangan> fromJsonList(List jsonList) {
    return jsonList.map((json) => SubjenisPangan.fromJson(json)).toList();
  }
}
