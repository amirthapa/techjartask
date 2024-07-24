import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techjartask/core/base/base_screen.dart';
import 'package:techjartask/core/base/base_state.dart';
import 'package:techjartask/core/base/widgets/app_bar/center_title_back_icon.dart';
import 'package:techjartask/core/base/widgets/error_view_widget.dart';
import 'package:techjartask/features/home/ui/widgets/home_post_list_widget.dart';
import 'package:techjartask/features/home/viewmodel/home_provider.dart';

import '../../../core/base/widgets/api_loading_widget.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CenterTitleBackIconAppbar(
        title: "Home",
        shouldShowBack: false,
      ),
      body: _mainBody(),
    );
  }

  _mainBody() {
    return FutureBuilder(
      future: context.read<HomeProvider>().getPost(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          //Loading State
          return const ApiLoadingWidget();
        }
        // Error State
        if (snapshot.data?.error?.message != null) {
          return ErrorViewWidget(
            onPressed: () async {
              setState(() {});
            },
            message: snapshot.data?.error?.message,
          );
        } else {
          return const HomePostListWidget();
        }
      },
    );
  }
}
