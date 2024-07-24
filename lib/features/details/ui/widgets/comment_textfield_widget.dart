import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:network/network.dart';
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
        suffix: CommentSurffixWidget(
          onSendPressed: () {
            _callSendComments();
          },
        ),
        controller: _textEditingController,
      ),
    );
  }

  _callSendComments() async {
    showProgressDialog();
    ApiResponse addCommentResponse = await context
        .read<DetailsProvider>()
        .sendComments(_textEditingController.text);
    dismissProgressDialog();

    if (addCommentResponse.error == null &&
        addCommentResponse.status == Status.completed) {
      Fluttertoast.showToast(msg: "Comment sent successsfully");
      _textEditingController.clear();
    } else {
      Fluttertoast.showToast(msg: "Comment sent Failed");
    }
  }
}
