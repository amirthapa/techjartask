import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:techjartask/core/theme/app_colors.dart';

/// Common appbar with [Title] param
/// and back icon
///

class CenterTitleBackIconAppbar extends StatefulWidget
    implements PreferredSizeWidget {
  final String title;
  @override
  final Size preferredSize;
  final bool? hasWidgetTitle;
  final Widget? widgetTitle;
  final List<Widget>? actions;

  final Function()? customNavigation;

  final bool shouldShowBack;
  const CenterTitleBackIconAppbar(
      {Key? key,
      required this.title,
      this.hasWidgetTitle,
      this.widgetTitle,
      this.customNavigation,
      this.shouldShowBack = true,
      this.actions})
      : preferredSize = const Size.fromHeight(60),
        super(key: key);

  @override
  State<CenterTitleBackIconAppbar> createState() =>
      _CenterTitleBackIconAppbarState();
}

class _CenterTitleBackIconAppbarState extends State<CenterTitleBackIconAppbar> {
  bool isSerachEnable = false;
  @override
  Widget build(BuildContext context) {
    return _buildAppBar(context);
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: widget.shouldShowBack
          ? IconButton(
              onPressed: widget.customNavigation ??
                  () {
                    if (GoRouter.of(context).canPop()) {
                      GoRouter.of(context).pop();
                    } else {
                      // Navigate back to the home route if there's nothing to pop
                      GoRouter.of(context).go('/');
                    }
                  },
              icon: Container(
                width: 32,
                height: 32,
                decoration: _decoration(context),
                child: const Center(
                    child: Icon(Icons.chevron_left,
                        semanticLabel: "Back", color: Colors.black)),
              ),
            )
          : const SizedBox.shrink(),
      bottomOpacity: 2,
      elevation: 1.0,
      centerTitle: true,
      title: Text(widget.title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold, color: AppColors.primaryColor)),
      actions: widget.actions,
    );
  }

  // Helper Methods
  BoxDecoration _decoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      border: Border.all(color: Theme.of(context).dividerColor),
    );
  }
}
