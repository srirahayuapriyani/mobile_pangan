class TambahData {
  final int id;
  final String namaPangan;
  final String ketersediaan;
  final String kebutuhan;
  final String harga;

  TambahData({
    required this.id,
    required this.namaPangan,
    required this.ketersediaan,
    required this.kebutuhan,
    required this.harga,
  });

  factory TambahData.fromJson(Map<String, dynamic> json) {
    return TambahData(
      id: json["id"],
      namaPangan: json['namaPangan'],
      ketersediaan: json['ketersediaan'],
      kebutuhan: json['kebutuhan'],
      harga: json['harga'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id ' : id,
      'nama': namaPangan,
      'ketersediaan': ketersediaan,
      'kebutuhan': kebutuhan,
      'harga': harga,
    };
  }
}
