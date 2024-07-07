class TambahData {
  final int id;
  final String namaPangan;
  final String persediaan;
  // final String kebutuhan;
  final String harga;
  

  TambahData({
    required this.id,
    required this.namaPangan,
    required this.persediaan,
    // required this.kebutuhan,
    required this.harga,
  });

  factory TambahData.fromJson(Map<String, dynamic> json) {
    return TambahData(
      id: json["id"],
      namaPangan: json['namaPangan'],
      persediaan: json['persediaan'],
      // kebutuhan: json['kebutuhan'],
      harga: json['harga'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id ' : id,
      'nama': namaPangan,
      'persesiaan': persediaan,
      // 'kebutuhan': kebutuhan,
      'harga': harga,
    };
  }
}
