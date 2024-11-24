import 'package:employee_ni_service/features/auth/presentation/pages/signin.dart';
import 'package:flutter/material.dart';
import '../../../core/app_theme/app_pallete.dart';
import '../../../core/database/hive_storage_service.dart';
import '../../../service_locator_dependecies.dart';

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
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Text(
          title,
          key: ValueKey<String>(title),
          style: const TextStyle(
            color: AppPallete.label3Color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 4.0, right: 8.0),
          child: IconButton(
            color: AppPallete.gradientColor,
            onPressed: () async {
              await sl<HiveStorageService>().clearUser();
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  SigninScreen.route(),
                  (route) => false,
                );
              }
            },
            icon: const Icon(
              Icons.logout,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
