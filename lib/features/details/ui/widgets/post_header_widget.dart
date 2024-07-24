import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techjartask/core/base/base_stateless_widget.dart';
import 'package:techjartask/features/details/viewmodel/details_provider.dart';
import 'package:techjartask/features/home/models/post_list_response_model.dart';
import 'package:techjartask/features/home/ui/widgets/post_list_tile.dart';

class PostHeaderWidget extends BaseStatelessWidget {
  const PostHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Post? post = context.read<DetailsProvider>().currentPost;
    return PostListTile(post: post);
  }
}
