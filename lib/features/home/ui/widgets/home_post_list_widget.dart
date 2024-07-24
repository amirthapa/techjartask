import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techjartask/core/base/base_stateless_widget.dart';
import 'package:techjartask/features/home/models/post_list_response_model.dart';
import 'package:techjartask/features/home/ui/widgets/post_list_tile.dart';
import 'package:techjartask/features/home/viewmodel/home_provider.dart';

class HomePostListWidget extends BaseStatelessWidget {
  const HomePostListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  _buildBody(BuildContext context) {
    List<Post>? list = context.read<HomeProvider>().postListResponseData;

    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        Post? item = list?[index];
        return item != null
            ? PostListTile(
                post: item,
              )
            : null;
      },
      itemCount: list?.length,
    );
  }
}
