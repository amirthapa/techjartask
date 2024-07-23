import 'dart:core';
import 'dart:io' show Platform;

import 'package:dio/dio.dart';
import 'package:network/src/dio_client.dart';

Future<Map<String, dynamic>> _buildHeaders(
    String? requestedSnapshotTime) async {
  late Map<String, dynamic> headers;
  requestedSnapshotTime == null
      ? headers = {
          "Content-Type": "application/json",
          "SourceSystem": "HFM",
          "BuildVersion": "",
          "ApiVersion": "1",
          "user-agent": _getPlatfromName(),
          // "user-agent": {
          //   'os': {'name': _getPlatfromName}
          // },
          "AppVersion": "1.0.0",
        }
      : requestedSnapshotTime.isEmpty == true
          ? headers = {
              "Content-Type": "application/json",
              "SourceSystem": "HFM",
              "BuildVersion": "",
              "ApiVersion": "1",
              "AppVersion": "1.0.0",
              "user-agent": _getPlatfromName(),
              // "user-agent": {
              //   'os': {'name': _getPlatfromName()}
              // }
            }
          : headers = {
              "Content-Type": "application/json",
              "SourceSystem": "HFM",
              "BuildVersion": "",
              "ApiVersion": "1",
              "AppVersion": "1.0.0",
              "sync_time": requestedSnapshotTime,
              "user-agent": _getPlatfromName(),
              // "user-agent": {
              //   'os': {'name': _getPlatfromName}
              // },
              "is_snapshot": "1",
            };
  return headers;
}

_getPlatfromName() {
  return Platform.isAndroid ? "android" : "ios";
}

_handleUnauthorisedToken() async {
  // Cancel existing dio token to cancel all request
  DioClient().cancelToken.cancel();
  // Wait for the token to be cancelled
  await DioClient().cancelToken.whenCancel;
  // Show logout dialog if the token is cancelled
  if (DioClient().cancelToken.isCancelled) {
    // // Check if dialog is already shown
    // if (!isUnauthorizedDialogShown) {
    //   // Set dialog shown flag to true
    //   isUnauthorizedDialogShown = true;
    //   // Show session logout dialog
    //   showErrorDialog(
    //       context: navigatorKey.currentContext!,
    //       message: ApiErrorMessage.sessionExpire,
    //       okButtonPressed: () {
    //         // Set dialog shown flag to false
    //         isUnauthorizedDialogShown = false;
    //         // Create new dio token
    //         DioClient().cancelToken = CancelToken();
    //         // logout session
    //         doLogout();
    //       });
  }
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
    // requestedSnapshotTime = SharedPrefs.getString(PrefConstants.snapShotTime);
    // options.headers.addAll(await _buildHeaders(requestedSnapshotTime));
    // token = SharedPrefs.getString(PrefConstants.jwtToken);
    // if (options.headers.containsKey("requirestoken")) {
    //   bool requiresToken = options.headers["requirestoken"];
    //   if (requiresToken == true && token != null) {
    //     options.headers.addAll({
    //       "Authorization": "Bearer $token",
    //     });
    //   }
    //remove the auxiliary header
    options.headers.remove("requirestoken");
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
