import 'package:flutter/material.dart';
import 'package:techjartask/core/base/base_screen.dart';
import 'package:techjartask/core/base/base_state.dart';
import 'package:techjartask/core/base/widgets/app_bar/center_title_back_icon.dart';

class DetailsScreen extends BaseScreen {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends BaseState<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CenterTitleBackIconAppbar(title: "Post Details"),
    );
  }
}
