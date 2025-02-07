import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:insync_flutter/core/network/api_exception.dart';

class ApiService {

  final String baseUrl;
  late Dio _dio;

  ApiService({required this.baseUrl}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
      ),
      );
  }

  Future<dynamic> get(String endpoint, Map<String, dynamic> params) async {
    try{
      final response = await _dio.get(endpoint, queryParameters: params);
      return response.data;

    }catch(e){
      throw ApiException.handleError(e);
    }
  }

  Future<dynamic> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(endpoint, data: jsonEncode(data));
      return response.data;
    } catch (e) {
      throw ApiException.handleError(e);
    }
  }

  Future<dynamic> put(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.put(endpoint, data: jsonEncode(data));
      return response.data;
    } catch (e) {
      throw ApiException.handleError(e);
    }
  }

  Future<dynamic> delete(String endpoint) async {
    try {
      final response = await _dio.delete(endpoint);
      return response.data;
    } catch (e) {
      throw ApiException.handleError(e);
    }
  }

}