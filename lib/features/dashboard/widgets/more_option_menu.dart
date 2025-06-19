import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:flutter/material.dart';

class MoreOptionMenu extends StatelessWidget {
  final Function(String) onSelected;
  const MoreOptionMenu({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppPallete.deepNavy,
      onSelected: onSelected,
      icon: const Icon(
        Icons.more_vert,
        size: 28,
        color: AppPallete.gradientColor,
      ),
      itemBuilder: (BuildContext context) => [
        buildItem(Icons.account_box, 'Account Details', 'details'),
        buildItem(Icons.celebration, 'Appreciation Post', 'appreciation'),
        buildItem(Icons.edit_notifications, 'Notification', 'notification'),
        buildItem(Icons.logout, 'Logout', 'logout'),
      ],
    );
  }

  PopupMenuItem<String> buildItem(IconData icon, String text, String value) {
    return PopupMenuItem<String>(
        value: value,
        child: ListTile(
          leading: Icon(
            icon,
            size: 28,
            color: AppPallete.gradientColor,
          ),
          title: CustomGlolbalText(
            text: text,
            fontSize: 15,
            color: AppPallete.backgroundColor,
          ),
        ));
  }
}
