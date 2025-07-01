import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioClient {
  final Dio _dio;
  final Logger _logger = Logger();

  static const String _baseUrl =
      'https://foode-food-delivery-default-rtdb.asia-southeast1.firebasedatabase.app';

  DioClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          _logger.i('➡️ REQUEST [${options.method}] => PATH: ${options.path}');
          _logger.d('Headers: ${options.headers}');
          _logger.d('Data: ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          _logger.i(
            '✅ RESPONSE [${response.statusCode}] => PATH: ${response.requestOptions.path}',
          );
          _logger.d('Data: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          _logger.e(
            '❌ ERROR [${e.response?.statusCode}] => PATH: ${e.requestOptions.path}',
          );
          _logger.e('Message: ${e.message}');
          _logger.e('Data: ${e.response?.data}');
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response> get(String path) async {
    String fullPath = path.startsWith('/') ? path : '/$path';
    return await _dio.get('$fullPath.json');
  }

  Future<Response> post(String path, Map<String, dynamic> data) async {
    String fullPath = path.startsWith('/') ? path : '/$path';
    return await _dio.post('$fullPath.json', data: data);
  }

  Future<Response> put(String path, Map<String, dynamic> data) async {
    String fullPath = path.startsWith('/') ? path : '/$path';
    return await _dio.put('$fullPath.json', data: data);
  }

  Future<Response> patch(String path, Map<String, dynamic> data) async {
    String fullPath = path.startsWith('/') ? path : '/$path';
    return await _dio.patch('$fullPath.json', data: data);
  }

  Future<Response> delete(String path) async {
    String fullPath = path.startsWith('/') ? path : '/$path';
    return await _dio.delete('$fullPath.json');
  }
}
