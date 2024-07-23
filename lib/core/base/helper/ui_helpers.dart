import 'package:flutter/material.dart';

enum Spacing {
  xxsmall,
  xsmall,
  small,
  medium,
  large,
  xlarge,
  xxlarge,
}

class UiHelper {
  static const double _xxsmallVertSpace = 2;
  static const double _xsmallVertSpace = 5;
  static const double _smallVertSpace = 10;
  static const double _mediumVertSpace = 20;
  static const double _largeVertSpace = 30;
  static const double _xlargeVertSpace = 40;
  static const double _xxlargeVertSpace = 60;

  static const double _xxSmallHorSpace = 1;
  static const double _xSmallHorSpace = 3;
  static const double _smallHorSpace = 6;
  static const double _mediumHorSpace = 10;
  static const double _largeHorSpace = 14;
  static const double _xlargeHorSpace = 16;
  static const double _xxlargeHorSpace = 30;

  // Corner Radius
  static const double _xSmallCornerRadius = 3;
  static const double _smallCornerRadius = 8;
  static const double _mediumCornerRadius = 10;
  static const double _largeCornerRadiusHorSpace = 14;
  static const double _xlargeCornerRadius = 16;

  static Widget horizontalDivider = const Divider(
    color: Colors.grey,
    height: 2.0,
  );

  static double displayHeight(BuildContext context) {
    return displaySize(context).height;
  }

  static Size displaySize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double displayWidth(BuildContext context) {
    return displaySize(context).width;
  }

  static TextStyle? getToolbarTitleStyle(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 16);
  }

  static hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static Widget horizontalSpace({hspace = Spacing.values}) {
    switch (hspace) {
      case Spacing.xxsmall:
        return const SizedBox(
          width: _xxSmallHorSpace,
        );
      case Spacing.xsmall:
        return const SizedBox(
          width: _xSmallHorSpace,
        );
      case Spacing.small:
        return const SizedBox(
          width: _smallHorSpace,
        );

      case Spacing.medium:
        return const SizedBox(
          width: _mediumHorSpace,
        );

      case Spacing.large:
        return const SizedBox(
          width: _largeHorSpace,
        );

      case Spacing.xlarge:
        return const SizedBox(
          width: _xlargeHorSpace,
        );
      case Spacing.xxlarge:
        return const SizedBox(
          width: _xxlargeHorSpace,
        );

      default:
        return const SizedBox(
          width: _smallHorSpace,
        );
    }
  }

  static EdgeInsets paddingAll({Spacing spacing = Spacing.large}) {
    return EdgeInsets.all(space(spacing));
  }

  static EdgeInsets paddingHorizontal({Spacing hspacing = Spacing.large}) {
    return EdgeInsets.symmetric(horizontal: space(hspacing));
  }

  static EdgeInsets paddingSymmetric(
      {double horizontalSpacing = 16.0, double verticalSpacing = 16.0}) {
    return EdgeInsets.symmetric(
        horizontal: horizontalSpacing, vertical: verticalSpacing);
  }

  static EdgeInsets paddingVertical({Spacing vspacing = Spacing.large}) {
    return EdgeInsets.symmetric(vertical: space(vspacing));
  }

  static double space(Spacing space) {
    switch (space) {
      case Spacing.xxsmall:
        return _xxsmallVertSpace;
      case Spacing.xsmall:
        return 5;
      case Spacing.small:
        return 10;
      case Spacing.medium:
        return 16;
      case Spacing.large:
        return 25;
      case Spacing.xlarge:
        return 40;
      case Spacing.xxlarge:
        return 60;
      default:
        return 20;
    }
  }

  static Widget verticalSpace({vspace = Spacing.medium, double? height}) {
    if (height != null) {
      return SizedBox(
        height: height,
      );
    }
    switch (vspace) {
      case Spacing.xxsmall:
        return const SizedBox(
          height: _xxsmallVertSpace,
        );
      case Spacing.xsmall:
        return const SizedBox(
          height: _xsmallVertSpace,
        );

      case Spacing.small:
        return const SizedBox(
          height: _smallVertSpace,
        );

      case Spacing.medium:
        return const SizedBox(
          height: _mediumVertSpace,
        );

      case Spacing.large:
        return const SizedBox(
          height: _largeVertSpace,
        );

      case Spacing.xlarge:
        return const SizedBox(
          height: _xlargeVertSpace,
        );
      case Spacing.xxlarge:
        return const SizedBox(
          height: _xxlargeVertSpace,
        );

      default:
        return const SizedBox(
          height: _smallVertSpace,
        );
    }
  }
}
