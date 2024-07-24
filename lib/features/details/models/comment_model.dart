class CommentsModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  CommentsModel({this.postId, this.id, this.name, this.email, this.body});

  CommentsModel.fromJson(Map<String, dynamic> json) {
    if (json["postId"] is int) {
      postId = json["postId"];
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["body"] is String) {
      body = json["body"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["postId"] = postId;
    data["id"] = id;
    data["name"] = name;
    data["email"] = email;
    data["body"] = body;
    return data;
  }

  static List<CommentsModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => CommentsModel.fromJson(map)).toList();
  }
}
