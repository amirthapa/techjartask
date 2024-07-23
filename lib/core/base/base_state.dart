import 'dart:async';

import 'package:flutter/material.dart';
import 'package:techjartask/core/base/base_screen.dart';
import 'package:techjartask/core/base/widgets/api_loading_widget.dart';

abstract class BaseState<Page extends BaseScreen> extends State<Page> {
  String? requestedSnapshotTime;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void dismissProgressDialog() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> showProgressDialog() async {
    showDialog(
        barrierDismissible: false,
        context: context,
        barrierColor: const Color(0x00ffffff),
        builder: (_) => const ApiLoadingWidget());
  }
}
