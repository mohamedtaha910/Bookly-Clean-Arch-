import 'package:dio/dio.dart';

class ApiSevice {
  final Dio _dio;
  // final String baseUrl = 'https://www.googleapis.com/books/v1/';
  final String baseUrl = 'https://www.googleapis.com/books/v1/';
  final String key = 'AIzaSyAdzsxBmUBt1NSxx8nrztWJ6CLWVX3Jai4';

  ApiSevice(this._dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
