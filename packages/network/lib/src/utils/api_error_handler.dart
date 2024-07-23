import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:network/src/constants/api_error_messages.dart';
import 'package:network/src/model/api_error.dart';

ApiError _processErrorMessage(String errorResponse) {
  log("_processErrorMessage: $errorResponse");
  try {
    var errorBody = json.decode(errorResponse);
    if (errorBody['message'] != null) {
      return ApiError(message: errorBody['message']);
    } else {
      var apiError = ApiError.fromJson(errorBody);
      return apiError;
    }
  } catch (e) {
    log("_processErrorMessage: Could not process server error: $e");
  }
  return ApiError(message: ApiErrorMessage.generalMessage);
}

ApiError handleError(error) {
  String errorDescription = "";
  int? statusCode;
  try {
    if (error is DioException) {
      debugPrint("Log: ${error.response}");
      debugPrint("Log: ${error.type}");

      statusCode = error.response?.statusCode;
      if (error.response?.statusCode == 401) {
        errorDescription = ApiErrorMessage.invalidToken;
      }
      switch (error.type) {
        case DioExceptionType.cancel:
          errorDescription = ApiErrorMessage.requestCancel;
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription = ApiErrorMessage.connectionTimeout;
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = ApiErrorMessage.receiveTimeout;
          break;
        case DioExceptionType.badResponse:
          if (error.response != null) {
            return _processErrorMessage((error).response.toString());
          } else {
            errorDescription = ApiErrorMessage.generalMessage;
          }
          break;
        case DioExceptionType.sendTimeout:
          errorDescription = ApiErrorMessage.sendTimeout;
          break;
        case DioExceptionType.unknown:
          errorDescription = ApiErrorMessage.internetNotAvailable;
          break;
        case DioExceptionType.badCertificate:
          errorDescription = ApiErrorMessage.internetNotAvailable;
          break;
        case DioExceptionType.connectionError:
          errorDescription = ApiErrorMessage.internetNotAvailable;
          break;
      }
    } else {
      log("Not a dio client error");
      errorDescription = ApiErrorMessage.generalMessage;
    }
  } catch (e) {
    log("Could not handle server error: $e");
    errorDescription = ApiErrorMessage.generalMessage;
  }

  return ApiError(message: errorDescription, httpStatusCode: statusCode);
}
