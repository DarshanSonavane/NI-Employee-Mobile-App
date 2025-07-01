import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/app_bar_widget.dart';
import 'package:employee_ni_service/core/common/widgets/loader.dart';
import 'package:employee_ni_service/core/utils/app_transition.dart';
import 'package:employee_ni_service/core/common/widgets/notification_appreciation_list_widget.dart';
import 'package:employee_ni_service/core/utils/show_snackbar.dart';
import 'package:employee_ni_service/features/appreciation_profile/presentation/bloc/fetch_appriciation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class AppreciationList extends StatefulWidget {
  static Route route() {
    return createSlideTransitionRoute(const AppreciationList());
  }

  const AppreciationList({super.key});

  @override
  State<AppreciationList> createState() => _AppreciationListState();
}

class _AppreciationListState extends State<AppreciationList> {
  @override
  void initState() {
    super.initState();
    _fetchAppreciation();
  }

  void _fetchAppreciation() {
    context.read<FetchAppriciationBloc>().add(GetAllAppreciation());
  }

  Widget _buildAppreciationItem(dynamic item) {
    return NotificationAppreciationListWidget(
      itemAppreciation: item,
      hasFile: true,
      isAppreciation: true,
    );
  }

  Widget _buildSuccessState(FetchAppreciationSuccess state) {
    final appreciationData =
        state.modelAllAppreciationResponse.appreciationData;

    if (appreciationData.isEmpty) {
      return _buildEmptyState();
    }

    final validAppreciations = appreciationData;

    if (validAppreciations.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: validAppreciations.length,
      itemBuilder: (context, index) {
        final item = validAppreciations[index];
        return _buildAppreciationItem(item);
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animations/sadman.json',
            width: 140,
            height: 140,
            repeat: true,
          ),
          const SizedBox(height: 16),
          Text(
            "No appreciations found",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 8),
          Text(
            "Check back later for new appreciations",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[500],
                ),
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
            onPressed: _fetchAppreciation,
            icon: const Icon(Icons.refresh),
            label: const Text("Try Again"),
          ),
        ],
      ),
    );
  }

  void _handleBlocListener(BuildContext context, FetchAppriciationState state) {
    if (state is FetchAppreciationFailure) {
      showSnackBar(context, state.message);
    }
  }

  Widget _buildAppreciationsList(
      BuildContext context, FetchAppriciationState state) {
    if (state is FetchAppriciationLoading) {
      return const Loader();
    } else if (state is FetchAppreciationSuccess) {
      return _buildSuccessState(state);
    } else if (state is FetchAppreciationFailure) {
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
        title: "Appreciation",
        isBackButtonVisible: true,
        isMoreButtonVisible: false,
        isFromMoreIcon: true,
        navigateTo: "addAppreciation",
      ),
      body: BlocConsumer<FetchAppriciationBloc, FetchAppriciationState>(
        listener: _handleBlocListener,
        builder: _buildAppreciationsList,
      ),
    );
  }
}
