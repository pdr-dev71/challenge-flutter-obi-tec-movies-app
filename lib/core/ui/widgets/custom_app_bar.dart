import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text? title;
  final bool? isBackButtonExist;
  final Widget? menuWidget;
  final Function? onTap;
  final Widget? leading;
  final List<Widget>? actions;
  const CustomAppBar({
    super.key,
    @required this.title,
    this.isBackButtonExist = true,
    this.menuWidget,
    this.onTap,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      actions: actions,
      title: title,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size(1170, GetPlatform.isDesktop ? 70 : 50);
}
