import 'dart:convert';

import 'package:network/network.dart';
import 'package:techjartask/core/base/base_provider.dart';
import 'package:techjartask/core/base/database/shared_pref_constant.dart';
import 'package:techjartask/core/base/database/sharedpref.dart';
import 'package:techjartask/features/details/models/comment_list_response_model.dart';
import 'package:techjartask/features/details/models/comment_model.dart';
import 'package:techjartask/features/details/services/details_api_service.dart';
import 'package:techjartask/features/home/models/post_list_response_model.dart';

class DetailsProvider extends BaseProvider {
  Post? _currentPost;
  CommentListResposeModel? _commentListResposeModel;
  bool activeSendComment = false;
  List<CommentsModel> get commnetsList =>
      _commentListResposeModel?.commentList ?? [];

  Post? get currentPost => _currentPost;

  Future<ApiResponse?> getComments() async {
    ApiResponse apiResponse =
        await DetailsApiService.getComments(postId: currentPost?.id ?? 0);
    if (apiResponse.status == Status.completed) {
      _commentListResposeModel =
          CommentListResposeModel.fromJson(apiResponse.data);
      if (_commentListResposeModel != null) {
        _saveDataInPref(apiResponse);
      }
    }
    return apiResponse;
  }

  getCommentsFromPref() {
    String? commentsString =
        SharedPrefs.getString(SharedPrefConstants.commnets);
    if (commentsString != null) {
      var jsonDataComments = jsonDecode(commentsString);
      _commentListResposeModel =
          CommentListResposeModel.fromJson(jsonDataComments);
    }
  }

  setActiveSetComment(bool isActive) {
    activeSendComment = isActive;
    notifyListeners();
  }

  setCurrentPost(Post post) {
    _currentPost = post;
  }

  _saveDataInPref(ApiResponse apiResponse) async {
    String jsonString = jsonEncode(apiResponse.data);
    await SharedPrefs.setString(SharedPrefConstants.commnets, jsonString);
  }
}
