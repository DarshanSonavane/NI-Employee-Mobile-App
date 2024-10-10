import 'package:flutter/material.dart';
import '../../../core/app_theme/app_pallete.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: const TextStyle(
          color: AppPallete.label3Color,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 4.0, right: 8.0),
          child: IconButton(
            color: AppPallete.gradientColor,
            onPressed: () {
              debugPrint("Logout");
            },
            icon: const Icon(
              Icons.logout,
              size: 28,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
