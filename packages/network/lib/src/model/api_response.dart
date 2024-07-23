import 'package:network/src/model/api_error.dart';

class ApiResponse<T> {
  /// Properties
  T? data;
  Status? status;
  String? message;
  ApiError? error;

  /// Set Response
  ApiResponse.loading(this.message) : status = Status.loading;
  ApiResponse.completed(this.data) : status = Status.completed;
  ApiResponse.error(this.error) : status = Status.error;
  ApiResponse.unverified() : status = Status.unverified;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { loading, completed, error, unverified }
