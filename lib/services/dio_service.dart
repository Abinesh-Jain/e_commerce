import 'dart:developer';

import 'package:dio/dio.dart';

class DioService<T> {
  final Dio _dio;
  DioService() : _dio = Dio();

  Dio get dio => _dio;

  Future<T?> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    log('GET $url');
    log('Query Parameters: $queryParameters');
    try {
      final response = await _dio.get<T?>(
        url,
        queryParameters: queryParameters,
      );
      log('Response: ${response.data}');
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
