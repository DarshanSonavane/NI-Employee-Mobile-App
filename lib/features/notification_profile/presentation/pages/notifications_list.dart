import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/app_bar_widget.dart';
import 'package:employee_ni_service/core/utils/app_transition.dart';
import 'package:employee_ni_service/features/notification_profile/presentation/widgets/notification_list_widget.dart';
import 'package:flutter/material.dart';

class NotificationsList extends StatefulWidget {
  static Route route() {
    return createSlideTransitionRoute(const NotificationsList());
  }

  const NotificationsList({super.key});

  @override
  State<NotificationsList> createState() => _NotificationsListState();
}

class _NotificationsListState extends State<NotificationsList> {
  final List<Map<String, String>> dummyList = [
    {
      "text":
          "Flutter is an open-source UI software development toolkit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, and the web from a single codebase.",
      "imgUrl": "https://picsum.photos/seed/pic1/200/300"
    },
    {
      "text":
          "React Native combines the best parts of native development with React, a best-in-class JavaScript library for building user interfaces.",
      "imgUrl": "https://picsum.photos/seed/pic2/200/300"
    },
    {
      "text":
          "Dart is a client-optimized language for fast apps on any platform. It is optimized for UI, developed by Google, and used heavily in Flutter.",
      "imgUrl": "https://picsum.photos/seed/pic3/200/300"
    },
    {
      "text":
          "The goal of cross-platform development is to create software that works on multiple operating systems with a single codebase, saving both time and resources.",
    },
    {
      "text":
          "A good UI design is not just about how the app looks, but also how it behaves and responds to user interaction, ensuring a smooth user experience.",
      "imgUrl": "https://picsum.photos/seed/pic5/200/300"
    },
    {
      "text":
          "A good UI design is not just about how the app looks, but also how it behaves and responds to user interaction, ensuring a smooth user experience.",
    },
    {
      "text":
          "A good UI design is not just about how the app looks, but also how it behaves and responds to user interaction, ensuring a smooth user experience.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      appBar: const AppBarWidget(
        title: "Notifications",
        isBackButtonVisible: true,
        isMoreButtonVisible: false,
        isFromMoreIcon: true,
        navigateTo: "addNotification",
      ),
      body: ListView.builder(
        itemCount: dummyList.length,
        itemBuilder: (context, index) {
          final item = dummyList[index];
          final hasImage = item['imgUrl'] != null && item['imgUrl']!.isNotEmpty;
          return NotificationListWidget(item: item, hasImage: hasImage);
        },
      ),
    );
  }
}
