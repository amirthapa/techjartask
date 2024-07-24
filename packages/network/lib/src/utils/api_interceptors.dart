import 'dart:core';

import 'package:dio/dio.dart';
import 'package:network/src/dio_client.dart';

Future<Map<String, dynamic>> _buildHeaders() async {
  late Map<String, dynamic> headers;
  headers = {
    "Content-Type": "application/json",
  };

  return headers;
}

_handleUnauthorisedToken() async {
  // Cancel existing dio token to cancel all request
  DioClient().cancelToken.cancel();
  // Wait for the token to be cancelled
  await DioClient().cancelToken.whenCancel;
  // Show logout dialog if the token is cancelled
  if (DioClient().cancelToken.isCancelled) {}
}

class ApiInterceptors extends Interceptor {
  String? token;
  String? refreshToken;
  String? deviceIdentifier;
  String? requestedSnapshotTime;

  /// Boolean to check weather user is shown with logout dialog
  /// in case of unauthorized user
  bool isUnauthorizedDialogShown = false;

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    //handling refresh token and single signin session
    if (err.response?.statusCode == 401) {
      _handleUnauthorisedToken();
    } else {
      super.onError(err, handler);
    }
  }

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll(await _buildHeaders());

    return super.onRequest(options, handler);
  }
}

class BadRequestException extends DioException {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}
