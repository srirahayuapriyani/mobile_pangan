import 'package:apk/models/draft_data_pangan_model.dart';
import 'package:dio/dio.dart';

class DraftDataPanganService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://sintrenayu.com/api/pangan/';

  Future<List<DraftDataPangan>> fetchDraftData() async {
    try {
      final response = await _dio.get(baseUrl);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => DraftDataPangan.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load draft data');
      }
    } catch (e) {
      throw Exception('Failed to load draft data: $e');
    }
  }
}


