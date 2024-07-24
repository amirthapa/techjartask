import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techjartask/core/base/base_screen.dart';
import 'package:techjartask/core/base/base_state.dart';
import 'package:techjartask/core/base/helper/ui_helpers.dart';
import 'package:techjartask/core/base/widgets/textfield/app_text_field.dart';
import 'package:techjartask/features/details/ui/widgets/commnet_surffix_widget.dart';
import 'package:techjartask/features/details/viewmodel/details_provider.dart';

class CommentTextField extends BaseScreen {
  const CommentTextField({super.key});

  @override
  State<CommentTextField> createState() => _CommentTextFieldState();
}

class _CommentTextFieldState extends BaseState<CommentTextField> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _buildCommentTextField(context);
  }

  @override
  void initState() {
    _textEditingController.addListener(() {
      log(900);
      _textEditingController.text.isNotEmpty
          ? context.read<DetailsProvider>().setActiveSetComment(true)
          : context.read<DetailsProvider>().setActiveSetComment(false);
    });
    super.initState();
  }

  Widget _buildCommentTextField(BuildContext context) {
    return Padding(
      padding: UiHelper.paddingAll(spacing: Spacing.small),
      child: AppTextFormField(
        name: "comment",
        label: "Comment",
        maxLines: 6,
        hintText: "Enter your comments",
        suffix: const CommentSurffixWidget(),
        controller: _textEditingController,
      ),
    );
  }
}
