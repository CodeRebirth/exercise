import 'dart:convert';
import 'package:exercise/data/api/api_service.dart';

class RemoteDataSource {
  ApiService apiService;
  RemoteDataSource({required this.apiService});

  Future<dynamic> getMovieList(int limit, int offset) async {
    try {
      final data = await apiService.getMovieList(limit, offset);
      if (data.statusCode == 200) {
        return jsonDecode(data.body);
      }
    } catch (err) {
      rethrow;
    }
  }
}
