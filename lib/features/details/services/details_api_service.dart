import 'package:network/network.dart';
import 'package:techjartask/features/details/models/comment_model.dart';

class DetailsApiService {
  static const detailsEndpont = "posts/";

  static Future<ApiResponse> getComments(
      {bool requiresToken = false, required int postId}) async {
    var response =
        await ApiServices.get(endPoint: "$detailsEndpont$postId/comments");
    return response;
  }

  static Future<ApiResponse> sendComment(
      {bool requiresToken = false,
      required int postId,
      required CommentsModel commentsModel}) async {
    var response = await ApiServices.post(
        endPoint: "$detailsEndpont$postId/comments", request: commentsModel);
    return response;
  }
}
