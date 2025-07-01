import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/app_bar_widget.dart';
import 'package:employee_ni_service/core/common/widgets/loader.dart';
import 'package:employee_ni_service/core/common/widgets/notification_appreciation_list_widget.dart';
import 'package:employee_ni_service/core/utils/app_transition.dart';
import 'package:employee_ni_service/core/utils/show_snackbar.dart';
import 'package:employee_ni_service/features/notification_profile/presentation/bloc/fetch_notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsList extends StatefulWidget {
  static Route route() {
    return createSlideTransitionRoute(const NotificationsList());
  }

  const NotificationsList({super.key});

  @override
  State<NotificationsList> createState() => _NotificationsListState();
}

class _NotificationsListState extends State<NotificationsList> {
  @override
  void initState() {
    super.initState();
    _fetchNotifications();
  }

  void _fetchNotifications() {
    context.read<FetchNotificationBloc>().add(GetAllNotificationEvent());
  }

  Widget _buildNotificationItem(dynamic item) {
    final hasFile = item?.file?.isNotEmpty ?? false;
    return NotificationAppreciationListWidget(
      itemNotification: item,
      hasFile: hasFile,
    );
  }

  Widget _buildSuccessState(FetchNotificationSuccess state) {
    final notificationData =
        state.modelAllNotificationResponse.notificationData;

    if (notificationData.isEmpty) {
      return _buildEmptyState();
    }

    final validNotifications = notificationData;

    if (validNotifications.isEmpty) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: () async {
        _fetchNotifications();
      },
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: validNotifications.length,
        itemBuilder: (context, index) {
          final item = validNotifications[index];
          return _buildNotificationItem(item);
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_none,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            "No notifications found",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 8),
          Text(
            "Check back later for new notifications",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[500],
                ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _fetchNotifications,
            icon: const Icon(Icons.refresh),
            label: const Text("Refresh"),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red[400],
          ),
          const SizedBox(height: 16),
          Text(
            "Something went wrong",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.red[600],
                ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _fetchNotifications,
            icon: const Icon(Icons.refresh),
            label: const Text("Try Again"),
          ),
        ],
      ),
    );
  }

  void _handleBlocListener(BuildContext context, FetchNotificationState state) {
    if (state is FetchNotificationFailure) {
      showSnackBar(context, state.errorMessage);
    }
  }

  Widget _buildNotificationsList(
      BuildContext context, FetchNotificationState state) {
    if (state is FetchNotificationLoader) {
      return const Center(child: Loader());
    } else if (state is FetchNotificationSuccess) {
      return _buildSuccessState(state);
    } else if (state is FetchNotificationFailure) {
      return _buildErrorState();
    } else {
      return _buildEmptyState();
    }
  }

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
      body: BlocConsumer<FetchNotificationBloc, FetchNotificationState>(
        listener: _handleBlocListener,
        builder: _buildNotificationsList,
      ),
    );
  }
}
