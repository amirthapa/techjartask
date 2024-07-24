import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techjartask/core/base/base_screen.dart';
import 'package:techjartask/core/base/widgets/api_loading_widget.dart';
import 'package:techjartask/core/base/widgets/error_view_widget.dart';
import 'package:techjartask/features/details/models/comment_model.dart';
import 'package:techjartask/features/details/ui/widgets/commnet_tile_widget.dart';
import 'package:techjartask/features/details/viewmodel/details_provider.dart';

class CommentListWidget extends BaseScreen {
  const CommentListWidget({super.key});

  @override
  State<CommentListWidget> createState() => _CommentListWidgetState();
}

class _CommentListWidgetState extends State<CommentListWidget> {
  @override
  Widget build(Object context) {
    return _mainBody();
  }

  Widget _buildCommnetList() {
    List<CommentsModel>? list = context.read<DetailsProvider>().commnetsList;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        CommentsModel? item = list[index];
        return CommnetListTile(
          commentsModel: item,
        );
      },
      itemCount: list.length,
    );
  }

  _mainBody() {
    return FutureBuilder(
      future: context.read<DetailsProvider>().getComments(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          //Loading State
          return const ApiLoadingWidget();
        }
        // Error State
        if (snapshot.data?.error != null) {
          return ErrorViewWidget(
            onPressed: () async {
              setState(() {});
            },
            message: snapshot.data?.error?.message,
          );
        } else {
          return Column(
            children: [_buildCommnetList()],
          );
        }
      },
    );
  }
}
