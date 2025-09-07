import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? actions;
  final Color? backgroundColor;
  final bool hideLeading;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  const BaseAppBar({
    super.key,
    this.title,
    this.actions,
    this.backgroundColor,
    this.bottom,
    this.hideLeading = true,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ?? const Text(''),
      titleTextStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary),
      centerTitle: centerTitle,
      titleSpacing: 0,
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      actions: [actions ?? const SizedBox()],
      leading: hideLeading
          ? null
          : IconButton(
              icon: const Icon(Icons.arrow_back, size: 24),
              onPressed: () => context.pop(true),
            ),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
