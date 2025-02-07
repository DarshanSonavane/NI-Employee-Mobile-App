import 'package:employee_ni_service/core/common/widgets/dialog_helper.dart';
import 'package:employee_ni_service/core/utils/fetch_user_role.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_add_machine/request_add_machine_model.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_cylinder_details/response_cylinder_details.dart';
import 'package:employee_ni_service/features/calibration/data/model/common_response_model/common_response_calibration_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/common/widgets/auth_gradient_button.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/constants/constants.dart';
import '../../data/model/model_calibration_details/response_calibration_details.dart';
import '../../data/model/model_update_cylinder/request_update_cylinder_details.dart';
import '../bloc/calibration_bloc.dart';
import '../widgets/add_machine_dialog.dart';
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

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _fetchDataForTab(_tabController.index);
      }
    });
    super.initState();
  }

  void _fetchDataForTab(int index) {
    if (index == 0) {
      context.read<CalibrationBloc>().add(
          GetAllCalibrationList(calibrationType: Constants.activeCalibration));
    } else {
      context.read<CalibrationBloc>().add(
          GetAllCalibrationList(calibrationType: Constants.closedCalibrations));
    }
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

  Future<dynamic> showCylinderDetailDialog(BuildContext context, data) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ShowCylinderDetailsDialog(
        data,
        onCylinderDetailsTap:
            (RequestUpdateCylinderDetails requestUpdateCylinderDetails) {
          context.read<CalibrationBloc>().add(
                UpdateCylinderDetails(
                    cylinderDetails: requestUpdateCylinderDetails),
              );
        },
      ),
    );
  }

  void addMachineDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AddMachineDialog(
          onAddMachineTap: (RequestAddMachineModel requestAddMachineModel) {
        context.read<CalibrationBloc>().add(
            AddMachineDetails(requestAddMachineModel: requestAddMachineModel));
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      body: Column(
        children: [
          Visibility(
            visible: fetchUserRole() == '0',
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AuthGradientButton(
                    buttonText: Constants.addMachine,
                    startColor: AppPallete.label3Color,
                    endColor: AppPallete.label3Color,
                    width: MediaQuery.of(context).size.width * 0.4,
                    height:
                        MediaQuery.of(context).size.height < 600 ? 0.03 : 0.02,
                    onPressed: () {
                      addMachineDialog(context);
                    },
                  ),
                  const SizedBox(width: 20),
                  AuthGradientButton(
                    buttonText: Constants.cylinderDetails,
                    startColor: AppPallete.buttonColor,
                    endColor: AppPallete.gradientColor,
                    width: MediaQuery.of(context).size.width * 0.4,
                    height:
                        MediaQuery.of(context).size.height < 600 ? 0.03 : 0.02,
                    onPressed: () {
                      context.read<CalibrationBloc>().add(GetCylinderDetails());
                    },
                  ),
                ],
              ),
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
                    DialogHelper.showAlertDialog(
                        context: context,
                        message: state.errorMessage,
                        onButtonPressed: () {
                          if (_tabController.index == 0) {
                            context.read<CalibrationBloc>().add(
                                GetAllCalibrationList(
                                    calibrationType:
                                        Constants.activeCalibration));
                          } else {
                            context.read<CalibrationBloc>().add(
                                GetAllCalibrationList(
                                    calibrationType:
                                        Constants.closedCalibrations));
                          }
                          Navigator.pop(context);
                        });
                  } else if (state is CalibrationSuccess) {
                    if (state.data is ResponseCalibrationDetails) {
                      calibrationDetails = state.data;
                    } else if (state.data is ResponseCylinderDetails) {
                      if (state.source == Constants.fetch) {
                        showCylinderDetailDialog(context, state.data);
                      } else {
                        final response = state.data as ResponseCylinderDetails;
                        DialogHelper.showAlertDialog(
                          context: context,
                          message: response.message!,
                          onButtonPressed: () {
                            Navigator.pop(context);
                          },
                        );
                      }
                    } else if (state.data is CommonResponseCalibrationModel) {
                      final response =
                          state.data as CommonResponseCalibrationModel;
                      DialogHelper.showAlertDialog(
                        context: context,
                        message: response.message!,
                        onButtonPressed: () {
                          if (_tabController.index == 0) {
                            context.read<CalibrationBloc>().add(
                                GetAllCalibrationList(
                                    calibrationType:
                                        Constants.activeCalibration));
                          } else {
                            context.read<CalibrationBloc>().add(
                                GetAllCalibrationList(
                                    calibrationType:
                                        Constants.closedCalibrations));
                          }
                          Navigator.pop(context);
                        },
                      );
                    }
                  }
                },
                builder: (context, state) {
                  if (state is CalibrationLoader) {
                    return const Loader();
                  } else if (state is CalibrationSuccess &&
                      calibrationDetails != null) {
                    return TabBarView(
                      controller: _tabController,
                      children: [
                        // Open Tab
                        calibrationDetails?.data!.isEmpty ?? true
                            ? const Center(
                                child: Text(
                                  Constants.noActiveCalibration,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 22,
                                  ),
                                ),
                              )
                            : calibrationDetails?.status == Constants.open
                                ? ListView.builder(
                                    itemCount: calibrationDetails?.data!.length,
                                    itemBuilder: (context, index) {
                                      final calibration =
                                          calibrationDetails?.data?[index];
                                      return CalibrationCard(
                                        name: calibration
                                            ?.customerId?.customerName,
                                        customerCode: calibration
                                            ?.customerId?.customerCode,
                                        date: calibration?.createdAt.toString(),
                                        fuelType: calibration?.machineType,
                                        location: calibration?.customerId?.city,
                                        state:
                                            calibration?.customerId?.stateCode,
                                        status: calibration?.status,
                                        calibrationId: calibration?.sId,
                                        assignedTo:
                                            '${calibration?.employeeId?.firstName} ${calibration?.employeeId?.lastName}',
                                        onDelete: (String calibrationId) {
                                          deleteCalibrationItem(calibrationId);
                                        },
                                        onGenerateAndSend:
                                            (String calibrationId) {
                                          generateAndSendCalibrationItem(
                                              calibrationId);
                                        },
                                      );
                                    },
                                  )
                                : const Center(
                                    child: Text(
                                      Constants.noOpenComplaints,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                        // Closed Tab
                        calibrationDetails?.data!.isEmpty ?? true
                            ? const Center(
                                child: Text(
                                  Constants.noClosedCalibration,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            : calibrationDetails?.status ==
                                    Constants.statusClose
                                ? ListView.builder(
                                    itemCount: calibrationDetails?.data!.length,
                                    itemBuilder: (context, index) {
                                      final calibration =
                                          calibrationDetails?.data?[index];
                                      return CalibrationCard(
                                        name: calibration
                                            ?.customerId?.customerName,
                                        customerCode: calibration
                                            ?.customerId?.customerCode,
                                        date: calibration?.createdAt.toString(),
                                        fuelType: calibration?.machineType,
                                        location: calibration?.customerId?.city,
                                        state:
                                            calibration?.customerId?.stateCode,
                                        status: calibration?.status,
                                        calibrationId: calibration?.sId,
                                        assignedTo:
                                            '${calibration?.employeeId?.firstName} ${calibration?.employeeId?.lastName}',
                                        onDelete: (String calibrationId) {
                                          deleteCalibrationItem(calibrationId);
                                        },
                                      );
                                    },
                                  )
                                : const Center(
                                    child: Text(
                                      Constants.noClosedComplaints,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
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
