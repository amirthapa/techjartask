class ApiError {
  int? httpStatusCode;
  int? status;
  String? message;
  int? messageType;

  ApiError({this.httpStatusCode, this.message, this.messageType});

  ApiError.fromJson(Map<String, dynamic> json) {
    httpStatusCode = json["httpStatusCode"];
    message = json["message"] ?? json["message"];
    messageType = json["MessageType"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["httpStatusCode"] = httpStatusCode;
    data["message"] = message;
    if (message == null || message?.isEmpty == true) {
      data["Message"] = message;
    }
    data["MessageType"] = messageType;
    return data;
  }
}

class Errors {
  String? title;
  String? content;

  Errors({this.title, this.content});

  Errors.fromJson(Map<String, dynamic> json) {
    title = json["Title"];
    content = json["Content"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Title"] = title;
    data["Content"] = content;
    return data;
  }
}
