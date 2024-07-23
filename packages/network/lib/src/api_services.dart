import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:network/src/dio_client.dart';
import 'package:network/src/model/api_response.dart';
import 'package:network/src/utils/api_error_handler.dart';

class ApiServices {
  static Future<ApiResponse> get(
      {required String endPoint,
      bool requiresToken = true,
      Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await DioClient.dio.get(endPoint,
          options: Options(headers: {"requirestoken": requiresToken}),
          queryParameters: queryParameters,
          cancelToken: DioClient().cancelToken);
      return ApiResponse.completed(res.data);
    } catch (error, stacktrace) {
      log("Method: GET : error: $error");
      log("Method: GET : stacktrace: $stacktrace");
      return ApiResponse.error(handleError(error));
    }
  }

  static Future<ApiResponse> post(
      {required dynamic request,
      required String endPoint,
      bool requiresToken = true, bool isBodyJson = false}) async {
    try {
      var res = await DioClient.dio.post(endPoint,
          data: isBodyJson ? request :  request.toJson(),
          options: Options(headers: {"requirestoken": requiresToken}),
          cancelToken: DioClient().cancelToken);
      print("res");
      print(res);
      return ApiResponse.completed(res.data);
    } catch (error, stacktrace) {
      log("Method: POST : error: $error");
      log("Method: POST : stacktrace: $stacktrace");
      return ApiResponse.error(handleError(error));
    }
  }

  static Future<ApiResponse> put(
      {required dynamic request,
      required String endPoint,
      bool requiresToken = true, bool isBodyJson = false}) async {
    try {
      var res = await DioClient.dio.put(endPoint,
          data: isBodyJson ? request :  request.toJson(),
          options: Options(headers: {"requirestoken": requiresToken}),
          cancelToken: DioClient().cancelToken);
      return ApiResponse.completed(res.data);
    } catch (error, stacktrace) {
      log("Method: PUT : error: $error");
      log("Method: PUT : stacktrace: $stacktrace");
      return ApiResponse.error(handleError(error));
    }
  }

  static Future<ApiResponse> delete(
      {required String endPoint, bool requiresToken = true}) async {
    try {
      var res = await DioClient.dio.delete(endPoint,
          options: Options(headers: {"requirestoken": requiresToken}),
          cancelToken: DioClient().cancelToken);
      return ApiResponse.completed(res.data);
    } catch (error, stacktrace) {
      log("Method: DELETE : error: $error");
      log("Method: DELETE : stacktrace: $stacktrace");
      return ApiResponse.error(handleError(error));
    }
  }
}
