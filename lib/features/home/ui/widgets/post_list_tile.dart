import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:techjartask/core/base/base_stateless_widget.dart';
import 'package:techjartask/core/router/router_helper.dart';
import 'package:techjartask/features/details/viewmodel/details_provider.dart';
import 'package:techjartask/features/home/models/post_list_response_model.dart';

import '../../../../core/theme/theme.dart';

class PostListTile extends BaseStatelessWidget {
  final Post? post;

  const PostListTile({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child: InkWell(
        onTap: () {
          if (post != null) {
            context.read<DetailsProvider>().setCurrentPost(post!);
            GoRouter.of(context).push(AppPages.postDetails.toPath);
          }
        },
        child: ListTile(
          title: Text(
            post?.title ?? "",
            style: AppTheme.getTitleMediumStyle(context),
          ),
          subtitle: Text(
            post?.body ?? "",
            style: AppTheme.getBodyMediumStyle(context),
          ),
        ),
      ),
    );
  }
}
