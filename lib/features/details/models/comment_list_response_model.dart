import 'package:techjartask/features/details/models/comment_model.dart';

class CommentListResposeModel {
  List<CommentsModel>? commentList;

  CommentListResposeModel({this.commentList});

  CommentListResposeModel.fromJson(List<dynamic> data) {
    commentList = (data).map((e) => CommentsModel.fromJson(e)).toList();
  }
}
