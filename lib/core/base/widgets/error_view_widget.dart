import 'package:flutter/material.dart';
import 'package:techjartask/core/base/helper/ui_helpers.dart';
import 'package:techjartask/core/theme/app_colors.dart';
import 'package:techjartask/core/theme/app_theme.dart';

class ErrorViewWidget extends StatelessWidget {
  final Function()? onPressed;
  final String? retryText;
  final String? message;

  const ErrorViewWidget(
      {Key? key, this.onPressed, this.retryText, this.message})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
            child: Icon(
          Icons.error,
          size: 40,
        )),
        UiHelper.verticalSpace(vspace: Spacing.large),
        message?.isNotEmpty == true
            ? Text(
                message!,
                style: AppTheme.getTitleMediumStyle(context)?.copyWith(
                  color: AppColors.bodyColor,
                ),
              )
            : const SizedBox(),
        (onPressed != null)
            ? TextButton(
                onPressed: onPressed, child: Text(retryText ?? "Retry?"))
            : const SizedBox(),
      ],
    );
  }
}
