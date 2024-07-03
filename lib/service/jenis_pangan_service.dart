import 'package:apk/models/jenis_pangan_model.dart';
import 'package:dio/dio.dart';

class JenisPanganService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://sintrenayu.com/api/pangan'; // Sesuaikan dengan URL API yang sesuai

  Future<List<JenisPangan>> fetchJenisPangan() async {
    try {
      final response = await _dio.get('$baseUrl/jenis_pangan');
      print(response);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['jenis_pangan'];
        return data.map((json) => JenisPangan.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  Future<JenisPangan> fetchJenisPanganById(int id) async {
    try {
      final response = await _dio.get('$baseUrl/$id');
      if (response.statusCode == 200) {
        return JenisPangan.fromJson(response.data['jenis_pangan']);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
