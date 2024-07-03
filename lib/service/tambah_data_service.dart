import 'package:apk/models/tambah_data_model.dart';
import 'package:dio/dio.dart';

class TambahDataService{
  final Dio _dio = Dio();
  final String baseUrl = 'https://sintrenayu.com/api/pangan/';

  Future<List<TambahData>> fetchJenisPangan(int id) async {
    try {
      final response = await _dio.get('$baseUrl/jenis_pangan/$id');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => TambahData.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  Future<bool> store(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(
        'baseUrl/store',
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: data,
      );

      if (response.statusCode != 201) {
        print("Gagal menyimpan data: ${response.statusCode} - ${response.data}");
        return false;
      }

      return true;
    } catch (e) {
      print("Gagal menyimpan data: $e");
      return false;
    }
  }
}