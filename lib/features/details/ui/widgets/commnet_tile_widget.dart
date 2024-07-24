import 'package:flutter/material.dart';
import 'package:techjartask/core/base/base_stateless_widget.dart';
import 'package:techjartask/features/details/models/comment_model.dart';

import '../../../../core/theme/theme.dart';

class CommnetListTile extends BaseStatelessWidget {
  final CommentsModel? commentsModel;

  const CommnetListTile({required this.commentsModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      child: ListTile(
        leading: const Icon(Icons.supervised_user_circle),
        title: Text(
          commentsModel?.email ?? "",
          style: AppTheme.getTitleSmallStyle(context),
        ),
        minVerticalPadding: 10,
        subtitle: Text(
          commentsModel?.body ?? "",
          style: AppTheme.getBodySmallStyle(context),
        ),
      ),
    );
  }
}
