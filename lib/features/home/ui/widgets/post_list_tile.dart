import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:techjartask/core/base/base_stateless_widget.dart';
import 'package:techjartask/core/router/router_helper.dart';

import '../../../../core/theme/theme.dart';

class PostListTile extends BaseStatelessWidget {
  final String title;
  final String subTitle;
  final int id;
  const PostListTile(
      {required this.title,
      required this.subTitle,
      required this.id,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBackgroundColor,
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(AppPages.postDetails.toPath);
        },
        child: ListTile(
          title: Text(
            title,
            style: AppTheme.getTitleMediumStyle(context),
          ),
          subtitle: Text(
            title,
            style: AppTheme.getBodyLargeStyle(context),
          ),
        ),
      ),
    );
  }
}
