import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = 'https://www.googleapis.com/books/v1/volumes/';
  const ApiService(this._dio);

  Future get({required String endpoint, String? query}) async {
    try {
      if (query != null) {
        endpoint += '?q=$query';
        final response = await _dio.get(
          baseUrl + endpoint,
          queryParameters: {'q': query},
        );
        return response.data;
      } else {
        final response = await _dio.get(baseUrl + endpoint);
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }
}
