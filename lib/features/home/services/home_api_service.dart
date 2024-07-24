import 'package:network/network.dart';

class HomeApiService {
  static const listOfPostEndpoint = "posts";
  static Future<ApiResponse> getPost({
    bool requiresToken = false,
  }) async {
    var response = await ApiServices.get(
      endPoint: listOfPostEndpoint,
    );
    return response;
  }
}
