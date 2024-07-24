import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:network/src/utils/api_interceptors.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  static final DioClient _singleton = DioClient._internal();

  static Dio? _dio;

  static const Duration _defaultTimeOut = Duration(milliseconds: 60 * 1000);

  static const String baseUrl = 'https://jsonplaceholder.typicode.com/';

  static final PrettyDioLogger _logger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    error: true,
  );

  // global configration
  static Dio get dio {
    if (_dio == null) {
      final BaseOptions options = BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: _defaultTimeOut,
          receiveTimeout: _defaultTimeOut,
          sendTimeout: _defaultTimeOut);
      options.headers.remove(Headers.contentLengthHeader);

      _dio = Dio(options);
      _dio?.interceptors.add(ApiInterceptors());

      if (kDebugMode) {
        _dio?.interceptors.add(_logger);
      }
    }
    return _dio!;
  }

  CancelToken cancelToken = CancelToken();
  factory DioClient() {
    return _singleton;
  }

  DioClient._internal();
}
