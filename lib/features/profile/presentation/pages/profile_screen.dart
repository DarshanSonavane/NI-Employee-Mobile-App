import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/app_bar_widget.dart';
import 'package:employee_ni_service/core/common/widgets/loader.dart';
import 'package:employee_ni_service/core/utils/app_transition.dart';
import 'package:employee_ni_service/core/utils/fetch_user_role.dart';
import 'package:employee_ni_service/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:employee_ni_service/features/profile/presentation/widget/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/show_snackbar.dart';

class ProfileScreen extends StatefulWidget {
  static Route route() {
    return createSlideTransitionRoute(const ProfileScreen());
  }

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    _fetchEmployeeProfile();
  }

  void _fetchEmployeeProfile() {
    final id = fetchUserId();
    if (id.isNotEmpty) {
      context.read<ProfileBloc>().add(
            GetEmployeeProfileEvent(employeeId: id),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget? _buildAppBar() {
    return fetchUserRole() == "0"
        ? const AppBarWidget(
            title: 'Account Details',
            isBackButtonVisible: true,
            isMoreButtonVisible: false,
            isFromMoreIcon: false,
          )
        : null;
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: _handleStateChanges,
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: _buildStateWidget,
        ),
      ),
    );
  }

  void _handleStateChanges(BuildContext context, ProfileState state) {
    if (state is ProfileFailure) {
      showSnackBar(context, state.message);
    }
  }

  Widget _buildStateWidget(BuildContext context, ProfileState state) {
    if (state is ProfileLoader) {
      return const Loader();
    } else if (state is ProfileSuccess) {
      return ProfileCard(empData: state.responseEmployeeProfile.data);
    } else {
      return const Center(
        child: Text(
          'No profile data available.',
          style: TextStyle(fontSize: 16),
        ),
      );
    }
  }
}
