import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HttpController {
  final Dio _dio = Dio();

  Future fetchData({
    required String url,
    String? method = 'GET',
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    const storage = FlutterSecureStorage();

    final token = await storage.read(key: 'token');

    if (token != null) {
      // debugPrint('Bearer $token');
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }

    setInterseptors();

    final response = await _dio.request(
      url,
      data: data,
      options: Options(
        contentType: 'application/json',
        method: method,
      ),
    );

    return response.data;
  }

  setInterseptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          log('REQUEST: ${options.method} ${options.uri}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // log('RESPONSE: ${response.statusCode} ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          final error = jsonDecode(e.response.toString());

          log('ERROR: ${e.response?.statusCode} ${error['error']} ${error['message']}');

          Get.snackbar(
            error['error'],
            error['message'],
            backgroundColor: Get.theme.colorScheme.error,
            colorText: Get.theme.primaryTextTheme.bodyLarge!.color!,
          );

          return handler.next(e);
        },
      ),
    );
  }
}
