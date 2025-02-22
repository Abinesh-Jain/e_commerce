import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/services/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DioService<T> {
  final Dio _dio;
  final ConnectivityService _connectivityService = ConnectivityService();
  DioService() : _dio = Dio();

  Dio get dio => _dio;

  Future<T?> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    if (!await _connectivityService.hasInternetConnection) {
      log('No internet connection');
      Get.snackbar(
        'No internet connection',
        'Please check your internet connection',
        backgroundColor: Colors.red,
      );
      return null;
    }
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
