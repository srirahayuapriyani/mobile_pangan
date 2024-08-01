import 'package:apk/models/jenis_pangan_model.dart';
import 'package:apk/models/pasar_model.dart';
import 'package:apk/models/subjenis_pangan_model.dart';
import 'package:apk/models/user_model.dart';

class LaporanPangan {
  final int id;
  final String userId;
  final String pasarId;
  final String jenisPanganId;
  final String subjenisPanganId;
  final int stok;
  final int harga;
  final int status;
  final String date;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Pasar pasar;
  final JenisPangan jenisPangan;
  final SubjenisPangan subjenisPangan;
  final User user;

  LaporanPangan({
    required this.id,
    required this.userId,
    required this.pasarId,
    required this.jenisPanganId,
    required this.subjenisPanganId,
    required this.stok,
    required this.harga,
    required this.status,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    required this.pasar,
    required this.jenisPangan,
    required this.subjenisPangan,
    required this.user,
  });

  factory LaporanPangan.fromJson(Map<String, dynamic> json) {
    return LaporanPangan(
      id: json['id'],
      userId: json['user_id'],
      pasarId: json['pasar_id'],
      jenisPanganId: json['jenis_pangan_id'],
      subjenisPanganId: json['subjenis_pangan_id'],
      stok: json['stok'],
      harga: json['harga'],
      status: json['status'],
      date: json['date'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      pasar: Pasar.fromJson(json['pasar']),
      jenisPangan: JenisPangan.fromJson(json['jenis_pangan']),
      subjenisPangan: SubjenisPangan.fromJson(json['subjenis_pangan']),
      user: User.fromJson(json['user']),
    );
  }
}



