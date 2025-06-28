import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/loader.dart';
import 'package:employee_ni_service/core/common/widgets/set_text_normal.dart';
import 'package:employee_ni_service/core/constants/constants.dart';
import 'package:employee_ni_service/core/utils/scaling_factor.dart';
import 'package:employee_ni_service/features/home/data/model/response_fsr_model.dart';
import 'package:employee_ni_service/features/home/data/model/response_home_details.dart';
import 'package:employee_ni_service/features/home/presentation/bloc/home_bloc.dart';
import 'package:employee_ni_service/features/home/presentation/widgets/appreciation_card.dart';
import 'package:employee_ni_service/features/home/presentation/widgets/build_home_details_card.dart';
import 'package:employee_ni_service/features/home/presentation/widgets/build_pie_char_card.dart';
import 'package:employee_ni_service/features/products/presentation/widgets/no_product_available.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/fetch_user_role.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../widgets/build_fsr_list_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ResponseHomeDetails? homeDetailsValue;
  ResponseFsrModel? fsrList;
  bool hasAppreciation = true;
  final String appreciationMessage =
      "We appreciate your incredible effort this week, John!";
  final String description =
      "John consistently demonstrated outstanding professionalism and team spirit. His contributions were critical to our success this week. We truly value your efforts!'";
  @override
  void initState() {
    context.read<HomeBloc>().add(GetAllHomeDetails());
    context.read<HomeBloc>().add(GetFSRList(
        employeeId: hiveStorageService.getUser()!.id,
        role: fetchUserRole(),
        type: Constants.showLatestFSR));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isAdmin = fetchUserRole() == "0";
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeBlocFailure) {
              showSnackBar(context, state.error);
            } else if (state is HomeBlocSuccess<ResponseHomeDetails>) {
              homeDetailsValue = state.data;
            } else if (state is HomeBlocSuccess<ResponseFsrModel>) {
              final data = state.data;
              if (data.requestType == Constants.showLatestFSR) {
                fsrList = data;
              }
            }
          },
          builder: (context, state) {
            if (state is HomeBlocLoader ||
                homeDetailsValue == null ||
                fsrList == null) {
              return const Loader();
            }

            return SingleChildScrollView(
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppreciationCard(
                    hasData: hasAppreciation,
                    message: appreciationMessage,
                    description: description,
                  ),
                  if (isAdmin) BuildHomeDetailsCard(homeDetailsValue),
                  if (isAdmin) BuildPieCharCard(homeDetailsValue),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: setTextNormal(
                        "Field Survey Report(FSR's)", ScalingFactor.scale(1.2),
                        color: AppPallete.label3Color),
                  ),
                  (fsrList!.fsrData.isNotEmpty)
                      ? BuildFsrListCard(fsrList)
                      : const NoProductAvailable(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
