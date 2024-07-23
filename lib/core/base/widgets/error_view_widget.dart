import 'package:base/src/constants/base_asset_image.dart';
import 'package:flutter/material.dart';

import '../../base.dart';

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
        Center(
          child: SvgPicture.asset(
            BaseAssetImage.imgUnderConstruction,
            height: 128,
          ),
        ),
        UiHelper.verticalSpace(vspace: Spacing.large),
        message?.isNotEmpty == true
            ? Text(
                message!,
                style: AppTheme.getTitleMediumStyle(context)?.copyWith(
                  color: AppColors.defaultTextColor,
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
