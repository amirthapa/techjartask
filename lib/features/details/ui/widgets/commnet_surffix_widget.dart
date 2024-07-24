import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techjartask/features/details/viewmodel/details_provider.dart';

import '../../../../core/theme/theme.dart';

class CommentSurffixWidget extends StatefulWidget {
  const CommentSurffixWidget({super.key});

  @override
  State<CommentSurffixWidget> createState() => _CommentSurffixWidgetState();
}

class _CommentSurffixWidgetState extends State<CommentSurffixWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<DetailsProvider>().getCommentsFromPref();
        },
        icon: Icon(
          Icons.send,
          color: context.watch<DetailsProvider>().activeSendComment
              ? AppColors.primaryColor
              : Colors.grey,
        ));
  }
}
