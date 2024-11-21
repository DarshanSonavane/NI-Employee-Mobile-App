import 'package:employee_ni_service/core/common/widgets/simple_dialog_with_message.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_cylinder_details/response_cylinder_details.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_delete_calibration/response_delete_calibration_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/common/widgets/auth_gradient_button.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../../data/model/model_calibration_details/response_calibration_details.dart';
import '../../data/model/model_update_cylinder/request_update_cylinder_details.dart';
import '../bloc/calibration_bloc.dart';
import '../widgets/calibration_card.dart';
import '../widgets/show_cylinder_details_dialog.dart';

class CalibrationScreen extends StatefulWidget {
  const CalibrationScreen({super.key});

  @override
  State<CalibrationScreen> createState() => _CalibrationScreenState();
}

class _CalibrationScreenState extends State<CalibrationScreen>
    with SingleTickerProviderStateMixin {
  ResponseCalibrationDetails? calibrationDetails;
  ResponseCylinderDetails? responseCylinderDetails;
  late TabController _tabController;
  bool isDialogOpen = false;

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

  void deleteCalibrationItem(String calibrationId) {
    context.read<CalibrationBloc>().add(
          DeleteCalibrationItem(
            calibrationId: calibrationId,
          ),
        );
  }

  void generateAndSendCalibrationItem(String calibrationId) {
    context.read<CalibrationBloc>().add(
          GenerateAndSendCalibrationItem(
            calibrationId: calibrationId,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AuthGradientButton(
                  buttonText: Constants.addMachine,
                  startColor: AppPallete.label3Color,
                  endColor: AppPallete.label3Color,
                  width: MediaQuery.of(context).size.width < 600 ? 120 : 175,
                  height:
                      MediaQuery.of(context).size.height < 600 ? 0.03 : 0.02,
                  onPressed: () {},
                ),
                const SizedBox(width: 20),
                AuthGradientButton(
                  buttonText: Constants.cylinderDetails,
                  startColor: AppPallete.buttonColor,
                  endColor: AppPallete.gradientColor,
                  width: MediaQuery.of(context).size.width < 600 ? 120 : 175,
                  height:
                      MediaQuery.of(context).size.height < 600 ? 0.03 : 0.02,
                  onPressed: () {
                    context.read<CalibrationBloc>().add(GetCylinderDetails());
                  },
                ),
              ],
            ),
          ),
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
                    if (state.data is ResponseCalibrationDetails) {
                      calibrationDetails = state.data;
                    } else if (state.data is ResponseCylinderDetails) {
                      if (isDialogOpen) {
                        Navigator.pop(context); // Close dialog
                        isDialogOpen = false;
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return SimpleDialogWithMessage(
                              message: Constants.cylinderDetailsUpdated,
                              onCloseTap: () {
                                Navigator.pop(context);
                              },
                            );
                          },
                        );
                      } else {
                        isDialogOpen = true;
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => ShowCylinderDetailsDialog(
                            state.data,
                            onCylinderDetailsTap: (RequestUpdateCylinderDetails
                                requestUpdateCylinderDetails) {
                              context.read<CalibrationBloc>().add(
                                  UpdateCylinderDetails(
                                      cylinderDetails:
                                          requestUpdateCylinderDetails));
                            },
                          ),
                        ).then((_) {
                          isDialogOpen =
                              false; // Reset dialog state when closed
                        });
                      }
                    } else if (state.data is ResponseDeleteCalibrationModel) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return SimpleDialogWithMessage(
                            message: Constants.calibrationDeletedMessage,
                            onCloseTap: () {
                              context
                                  .read<CalibrationBloc>()
                                  .add(GetAllCalibrationList());
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    }
                  }
                },
                builder: (context, state) {
                  if (state is CalibrationLoader && !isDialogOpen) {
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
                                    calibrationId: calibration.sId,
                                    assignedTo:
                                        '${calibration.employeeId?.firstName} ${calibration.employeeId?.lastName}',
                                    onDelete: (String calibrationId) {
                                      deleteCalibrationItem(calibrationId);
                                    },
                                    onGenerateAndSend: (String calibrationId) {
                                      generateAndSendCalibrationItem(
                                          calibrationId);
                                    },
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
                                    name: calibration.customerId?.customerName,
                                    customerCode:
                                        calibration.customerId?.customerCode,
                                    date: calibration.createdAt.toString(),
                                    fuelType: calibration.machineType,
                                    location: calibration.customerId?.city,
                                    state: calibration.customerId?.stateCode,
                                    status: calibration.status,
                                    calibrationId: calibration.sId,
                                    assignedTo:
                                        '${calibration.employeeId?.firstName} ${calibration.employeeId?.lastName}',
                                    onDelete: (String calibrationId) {
                                      deleteCalibrationItem(calibrationId);
                                    },
                                  );
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
