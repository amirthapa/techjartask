import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techjartask/core/base/widgets/textfield/text_field_helper.dart';
import 'package:techjartask/core/theme/app_theme.dart';

class AppTextFormField extends StatelessWidget {
  // Public properties
  final String name;
  final String label;
  final String? hintText;
  final String? initialValue;
  final bool obscureText;
  final Function(String?)? onChanged;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final int? maxLength;
  final int? maxLines;
  final bool? isRequired;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode autovalidateMode;
  final Widget? prefix;
  final Widget? suffix;

  const AppTextFormField(
      {Key? key,
      required this.name,
      required this.label,
      this.hintText,
      this.initialValue,
      this.obscureText = false,
      this.controller,
      this.maxLength,
      this.maxLines = 20,
      this.enabled = true,
      this.onChanged,
      this.validator,
      this.prefix,
      this.suffix,
      this.keyboardType = TextInputType.text,
      this.inputFormatters,
      this.autovalidateMode = AutovalidateMode.disabled,
      this.isRequired = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildTextFormField(
        name: name,
        label: label,
        isRequiredInput: validator != null,
        context: context);
  }

  _buildTextFormField(
      {required String name,
      required String label,
      required bool isRequiredInput,
      required BuildContext context}) {
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      obscureText: obscureText,
      style: AppTheme.getBodyLargeStyle(context),
      decoration: roundInputDecoration(
          context: context,
          label: label,
          hintText: hintText,
          prefix: prefix,
          suffix: suffix,
          isRequiredInput: isRequiredInput),
      maxLength: maxLength,
      enabled: enabled,
      onChanged: (changedValue) {
        if (onChanged != null) onChanged!(changedValue);
      },
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: autovalidateMode,
    );
  }
}
