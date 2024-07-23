import 'package:flutter/material.dart';
import 'package:techjartask/core/base/widgets/api_loading_widget.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({Key? key}) : super(key: key);

  void dismissProgressDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  Future<void> showProgressDialog(BuildContext context) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        barrierColor: const Color(0x00ffffff),
        builder: (_) => const ApiLoadingWidget());
  }
}
