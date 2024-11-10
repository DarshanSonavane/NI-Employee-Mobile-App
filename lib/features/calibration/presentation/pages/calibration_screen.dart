import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../../data/model/response_calibration_details.dart';
import '../bloc/calibration_bloc.dart';
import '../widgets/calibration_card.dart';

class CalibrationScreen extends StatefulWidget {
  const CalibrationScreen({super.key});

  @override
  State<CalibrationScreen> createState() => _CalibrationScreenState();
}

class _CalibrationScreenState extends State<CalibrationScreen>
    with SingleTickerProviderStateMixin {
  ResponseCalibrationDetails? calibrationDetails;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    context.read<CalibrationBloc>().add(GetAllCalibrationList());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      body: Column(
        children: [
          Container(
            color: AppPallete.gradientColor,
            child: TabBar(
              controller: _tabController,
              indicatorColor: AppPallete.backgroundColor,
              labelColor: AppPallete.backgroundColor,
              unselectedLabelColor: AppPallete.label2Color,
              tabs: const [
                Tab(text: Constants.activeCalibration),
                Tab(text: Constants.closedCalibrations),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: BlocConsumer<CalibrationBloc, CalibrationState>(
                listener: (context, state) {
                  if (state is CalibrationFailure) {
                    showSnackBar(context, state.errorMessage);
                  } else if (state is CalibrationSuccess) {
                    calibrationDetails = state.calibrationDetails;
                  }
                },
                builder: (context, state) {
                  if (state is CalibrationLoader) {
                    return const Loader();
                  } else if (state is CalibrationSuccess &&
                      calibrationDetails != null) {
                    final statusZeroCalibrations = calibrationDetails!.data
                        ?.where((calibration) => calibration.status == '0')
                        .toList();
                    final otherStatusCalibrations = calibrationDetails!.data
                        ?.where((calibration) => calibration.status != '0')
                        .toList();

                    return TabBarView(
                      controller: _tabController,
                      children: [
                        // Open Tab
                        otherStatusCalibrations!.isEmpty
                            ? const Center(
                                child: Text(
                                  Constants.noActiveCalibration,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 22,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount: otherStatusCalibrations.length,
                                itemBuilder: (context, index) {
                                  final calibration =
                                      otherStatusCalibrations[index];
                                  return CalibrationCard(
                                    name: calibration.customerId?.customerName,
                                    customerCode:
                                        calibration.customerId?.customerCode,
                                    date: calibration.createdAt.toString(),
                                    fuelType: calibration.machineType,
                                    location: calibration.customerId?.city,
                                    state: calibration.customerId?.stateCode,
                                    status: calibration.status,
                                    assignedTo:
                                        '${calibration.employeeId?.firstName} ${calibration.employeeId?.lastName}',
                                  );
                                },
                              ),
                        // Closed Tab
                        statusZeroCalibrations!.isEmpty
                            ? const Center(
                                child: Text(
                                  Constants.noClosedCalibration,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount: statusZeroCalibrations.length,
                                itemBuilder: (context, index) {
                                  final calibration =
                                      statusZeroCalibrations[index];
                                  return CalibrationCard(
                                      name:
                                          calibration.customerId?.customerName,
                                      customerCode:
                                          calibration.customerId?.customerCode,
                                      date: calibration.createdAt.toString(),
                                      fuelType: calibration.machineType,
                                      location: calibration.customerId?.city,
                                      state: calibration.customerId?.stateCode,
                                      status: calibration.status,
                                      assignedTo:
                                          '${calibration.employeeId?.firstName} ${calibration.employeeId?.lastName}');
                                },
                              ),
                      ],
                    );
                  }
                  return const Center(
                    child: Text(
                      Constants.noCalibrationAvailable,
                      style: TextStyle(
                        color: AppPallete.gradientColor,
                        fontSize: 22,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
