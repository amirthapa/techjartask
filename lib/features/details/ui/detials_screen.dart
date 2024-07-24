import 'package:flutter/material.dart';
import 'package:techjartask/core/base/base_screen.dart';
import 'package:techjartask/core/base/base_state.dart';
import 'package:techjartask/core/base/helper/ui_helpers.dart';
import 'package:techjartask/core/base/widgets/app_bar/center_title_back_icon.dart';
import 'package:techjartask/core/base/widgets/keyboard_hider.dart';
import 'package:techjartask/core/theme/app_theme.dart';
import 'package:techjartask/features/details/ui/widgets/comment_list_widget.dart';
import 'package:techjartask/features/details/ui/widgets/comment_textfield_widget.dart';
import 'package:techjartask/features/details/ui/widgets/post_header_widget.dart';

class DetailsScreen extends BaseScreen {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends BaseState<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: KeyboardHider(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          bottomSheet: _buildEditText(),
          appBar: const CenterTitleBackIconAppbar(title: "Post Details"),
          body: _mainBody(),
        ),
      ),
    );
  }

  _buildEditText() {
    return const CommentTextField();
  }

  Widget _mainBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PostHeaderWidget(),
          Padding(
            padding: UiHelper.paddingAll(spacing: Spacing.small),
            child:
                Text("Commnets", style: AppTheme.getBodyMediumStyle(context)),
          ),
          const CommentListWidget()
        ],
      ),
    );
  }
}
