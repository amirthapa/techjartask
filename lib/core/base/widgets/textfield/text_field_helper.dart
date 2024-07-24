import 'package:flutter/material.dart';
import 'package:techjartask/core/theme/app_colors.dart';
import 'package:techjartask/core/theme/app_theme.dart';

InputDecoration roundInputDecoration(
    {String? label,
    required BuildContext context,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? hintText,
    bool? isDense,
    bool? onlyTwoEdgeCurved,
    Widget? prefix,
    Widget? suffix,
    BoxConstraints? suffixIconConstraints,
    required bool isRequiredInput}) {
  return InputDecoration(
      label: Text(
        label ?? "",
        style: AppTheme.getTitleSmallStyle(context),
      ),
      prefix: prefix,
      suffix: suffix,
      floatingLabelStyle: AppTheme.getTitleSmallStyle(context),
      suffixIconConstraints: suffixIconConstraints,
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Colors.grey,
        fontStyle: FontStyle.normal,
      ),
      counterText: "",
      isDense: isDense,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.bodyColor, width: 1.0),
        borderRadius: onlyTwoEdgeCurved ?? false
            ? const BorderRadius.only(
                topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0))
            : const BorderRadius.all(Radius.circular(8.0)),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.bodyColor, width: 1.0),
        borderRadius: onlyTwoEdgeCurved ?? false
            ? const BorderRadius.only(
                topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0))
            : const BorderRadius.all(Radius.circular(8.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.bodyColor, width: 1.0),
        borderRadius: onlyTwoEdgeCurved ?? false
            ? const BorderRadius.only(
                topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0))
            : const BorderRadius.all(Radius.circular(8.0)),
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      errorMaxLines: 2);
}
