import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/loader.dart';
import 'package:employee_ni_service/core/constants/constants.dart';
import 'package:employee_ni_service/core/utils/fetch_user_role.dart';
import 'package:employee_ni_service/core/utils/show_snackbar.dart';
import 'package:employee_ni_service/features/home/data/model/response_fsr_model.dart';
import 'package:employee_ni_service/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_transition.dart';
import '../../../../core/common/widgets/app_bar_widget.dart';
import '../../../home/presentation/widgets/fsr_details_card.dart';

class FsrDetailsScreen extends StatefulWidget {
  const FsrDetailsScreen({super.key});

  static Route route() {
    return createSlideTransitionRoute(
      const FsrDetailsScreen(),
    );
  }

  @override
  State<FsrDetailsScreen> createState() => _FsrDetailsScreenState();
}

class _FsrDetailsScreenState extends State<FsrDetailsScreen> {
  final ScrollController _scrollController = ScrollController();
  ResponseFsrModel? fsrList;
  int _currentPage = 1;
  bool _isLoadingMore = false;
  bool _hasMoreData = true;
  @override
  void initState() {
    fetchFsrList();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !_isLoadingMore &&
          _hasMoreData) {
        loadNextPage();
      }
    });
    super.initState();
  }

  void fetchFsrList({int page = 1}) {
    context.read<HomeBloc>().add(GetFSRList(
          employeeId: hiveStorageService.getUser()!.id,
          role: fetchUserRole(),
          type: Constants.showAllFSR,
          page: page,
        ));
  }

  void loadNextPage() {
    _isLoadingMore = true;
    _currentPage += 1;
    fetchFsrList(page: _currentPage);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      appBar: const AppBarWidget(
        title: "FSR Details",
        isBackButtonVisible: true,
      ),
      body: BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
        if (state is HomeBlocFailure) {
          showSnackBar(context, state.error);
          _isLoadingMore = false;
        } else if (state is HomeBlocSuccess<ResponseFsrModel>) {
          final newData = (state.data.fsrData as List<FsrDataModel>);

          if (_currentPage == 1) {
            fsrList = state.data;
          } else {
            if (newData.isEmpty) {
              _hasMoreData = false;
            }

            // Merge existing and new only once
            fsrList = fsrList!.copyWith(
              fsrData: List.from(fsrList!.fsrData)..addAll(newData),
            );
          }

          _isLoadingMore = false;
        }
      }, builder: (context, state) {
        if (state is HomeBlocLoader && _currentPage == 1) {
          return const Loader();
        }

        if (fsrList == null) {
          return const SizedBox();
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: fsrList!.fsrData.length + (_isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < fsrList!.fsrData.length) {
                final fsr = fsrList!.fsrData[index];
                return FSRDetailsCard(
                  fsr: fsr,
                  isDetailsScreen: true,
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Loader(),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
