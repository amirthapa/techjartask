import 'package:network/network.dart';

class DetailsApiService {
  static const detailsEndpont = "posts/";

  static Future<ApiResponse> getComments(
      {bool requiresToken = false, required int postId}) async {
    var response =
        await ApiServices.get(endPoint: "$detailsEndpont$postId/comments");
    return response;
  }
}
