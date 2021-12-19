import 'package:flutter/material.dart';

/// allows used transparent AppBar with 3 widgets:[leading], [title], [trailing]
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget title;
  final Widget? trailing;

  final Color? appBarColor;

  const CustomAppBar({
    Key? key,
    this.leading,
    required this.title,
    this.trailing,
    this.appBarColor,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: appBarColor ?? Colors.white,
      titleSpacing: 0.0,
      leading: leading,
      title: title,
      actions: trailing != null ? [trailing!] : null,
      centerTitle: true,
    );
  }
}
