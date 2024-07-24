import 'dart:math';

import 'package:network/network.dart';
import 'package:techjartask/core/base/base_provider.dart';
import 'package:techjartask/features/home/models/post_list_response_model.dart';
import 'package:techjartask/features/home/services/home_api_service.dart';

class HomeProvider extends BaseProvider {
  PostListResposeModel? _postListResposeModel;

  List<Post>? get postListResponseData => _postListResposeModel?.postList ?? [];

  Future<ApiResponse?> getPost() async {
    ApiResponse apiResponse = await HomeApiService.getPost();
    if (apiResponse.status == Status.completed) {
      _postListResposeModel = PostListResposeModel.fromJson(apiResponse.data);

      log(_postListResposeModel?.postList?.length ?? 0);
    }
    return apiResponse;
  }
}
