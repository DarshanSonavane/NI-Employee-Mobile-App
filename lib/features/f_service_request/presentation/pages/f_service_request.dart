import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/dialog_helper.dart';
import 'package:employee_ni_service/core/common/widgets/set_text_normal.dart';
import 'package:employee_ni_service/core/utils/machine_options.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/provider/total_amount_provider.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/widgets/create_signature_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../../../../core/common/widgets/auth_gradient_button.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/location_permission.dart';
import '../../../calibration/presentation/widgets/machine_dropdown.dart';
import '../widgets/add_details_widget.dart';

class FServiceRequest extends StatefulWidget {
  final String complaintId;
  final String customerCode;
  final String customerName;
  final String employeeCode;
  final String complaintType;
  static route(String complaintId, String customerCode, String customerName,
          String employeeCode, String complaintType) =>
      MaterialPageRoute(
        builder: (context) => FServiceRequest(
          complaintId: complaintId,
          customerCode: customerCode,
          customerName: customerName,
          employeeCode: employeeCode,
          complaintType: complaintType,
        ),
      );
  const FServiceRequest({
    super.key,
    required this.complaintId,
    required this.customerName,
    required this.customerCode,
    required this.employeeCode,
    required this.complaintType,
  });

  @override
  State<FServiceRequest> createState() => _FServiceRequestState();
}

class _FServiceRequestState extends State<FServiceRequest> {
  final formKey = GlobalKey<FormState>();
  String? selectedMachine;
  String? natureOfComplaint;
  String? status;
  final customerCodeController = TextEditingController();
  final contactPersonController = TextEditingController();
  final designationController = TextEditingController();
  final engEmpCodeController = TextEditingController();
  final complaintTypeController = TextEditingController();
  final remarkController = TextEditingController();
  final correctiveActionController = TextEditingController();
  final detailsActionController = TextEditingController();
  double totalAmount = 0.0;

  @override
  void initState() {
    super.initState();
  }

  Future<void> checkLocationPermission() async {
    bool permissionGranted = await handleLocationPermission();
    if (!permissionGranted) {
      showPermissionDeniedDialog();
    } else {
      getCurrentLocation();
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ));
      debugPrint(
          "Current location: ${position.latitude}, ${position.longitude}");

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      debugPrint(
          "Full address: ${place.street}, ${place.locality}, ${place.country}");
      debugPrint("Street: ${place.street}");
      debugPrint("Sub-locality: ${place.subLocality}");
      debugPrint("Locality: ${place.locality}");
      debugPrint("Administrative Area: ${place.administrativeArea}");
      debugPrint("Country: ${place.country}");
      debugPrint("Postal Code: ${place.postalCode}");
    } catch (e) {
      debugPrint("Error getting location: $e");
    }
  }

  showPermissionDeniedDialog() {
    DialogHelper.showOpenSettingAlertDialog(
      context: context,
      message: Constants.locationDeniedMessage,
      onTextButtonPressed: () {
        Navigator.of(context).pop;
        Geolocator.openAppSettings();
      },
      onCloseButtonPressed: Navigator.of(context).pop,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      appBar: AppBar(
        title: setTextNormal(Constants.fsr, 1, color: AppPallete.label3Color),
        backgroundColor: AppPallete.backgroundColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppPallete.gradientColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    labelText: Constants.customerCode,
                    value: widget.customerCode,
                    controller: customerCodeController,
                    textStyle: const TextStyle(
                        color: AppPallete.label3Color, fontSize: 20),
                    labelStyle: const TextStyle(color: AppPallete.label3Color),
                    fillColor: AppPallete.backgroundClosed,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    editableText: false,
                  ),
                  CustomTextFormField(
                    labelText: Constants.contactPerson,
                    value: widget.customerName,
                    controller: contactPersonController,
                    textStyle: const TextStyle(
                        color: AppPallete.label3Color, fontSize: 20),
                    labelStyle: const TextStyle(color: AppPallete.label3Color),
                    fillColor: AppPallete.backgroundClosed,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    editableText: false,
                  ),
                  CustomTextFormField(
                    labelText: Constants.designation,
                    controller: designationController,
                    textStyle: const TextStyle(
                        color: AppPallete.label3Color, fontSize: 20),
                    labelStyle: const TextStyle(color: AppPallete.label3Color),
                    fillColor: AppPallete.backgroundClosed,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  CustomTextFormField(
                    labelText: Constants.engEmpCode,
                    value: widget.employeeCode,
                    controller: engEmpCodeController,
                    textStyle: const TextStyle(
                        color: AppPallete.label3Color, fontSize: 20),
                    labelStyle: const TextStyle(color: AppPallete.label3Color),
                    fillColor: AppPallete.backgroundClosed,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    editableText: false,
                  ),
                  GenericDropdown(
                    dropDownType: Constants.selectMachine,
                    selectedValue: selectedMachine,
                    onChanged: (value) {
                      setState(() {
                        selectedMachine = value;
                      });
                    },
                    options: machineOptions,
                  ),
                  CustomTextFormField(
                    labelText: Constants.complaintType,
                    value: widget.complaintType,
                    controller: complaintTypeController,
                    textStyle: const TextStyle(
                        color: AppPallete.label3Color, fontSize: 20),
                    labelStyle: const TextStyle(color: AppPallete.label3Color),
                    fillColor: AppPallete.backgroundClosed,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    editableText: false,
                    minLines: 1,
                    maxLines: null,
                  ),
                  GenericDropdown(
                    dropDownType: Constants.natureOfComplaint,
                    selectedValue: natureOfComplaint,
                    onChanged: (value) {
                      setState(() {
                        natureOfComplaint = value;
                      });
                    },
                    options: natureOfCallOptions,
                  ),
                  CustomTextFormField(
                    labelText: Constants.remark,
                    controller: remarkController,
                    textStyle: const TextStyle(
                        color: AppPallete.label3Color, fontSize: 20),
                    labelStyle: const TextStyle(color: AppPallete.label3Color),
                    fillColor: AppPallete.backgroundClosed,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  CustomTextFormField(
                    labelText: Constants.detailsOfAction,
                    controller: correctiveActionController,
                    textStyle: const TextStyle(
                        color: AppPallete.label3Color, fontSize: 20),
                    labelStyle: const TextStyle(color: AppPallete.label3Color),
                    fillColor: AppPallete.backgroundClosed,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    maxLines: null,
                    minLines: 3,
                  ),
                  CustomTextFormField(
                    labelText: Constants.correctiveAction,
                    controller: detailsActionController,
                    textStyle: const TextStyle(
                        color: AppPallete.label3Color, fontSize: 20),
                    labelStyle: const TextStyle(color: AppPallete.label3Color),
                    fillColor: AppPallete.backgroundClosed,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    maxLines: null,
                    minLines: 3,
                  ),
                  GenericDropdown(
                    dropDownType: Constants.status,
                    selectedValue: status,
                    onChanged: (value) {
                      setState(() {
                        status = value;
                      });
                    },
                    options: statusOptions,
                  ),
                  const AddDetailsWidget(),
                  const SizedBox(height: 10),
                  Consumer<TotalAmountProvider>(
                    builder: (context, provider, child) {
                      double totalAmount = provider.getTotalAmount;
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: setTextNormal(
                              '${Constants.totalAmountInclGst}${totalAmount.toString()}/-',
                              1),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AuthGradientButton(
                        buttonText: Constants.employeeSignature,
                        startColor: AppPallete.buttonColor,
                        endColor: AppPallete.gradientColor,
                        fontSize: 13.0,
                        width: MediaQuery.of(context).size.width / 2.2,
                        height: 55,
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return CreateSignatureDialog(
                                appBarTitle: Constants.employeeSignature,
                                onSignatureSubmitTap: (value) => {},
                              );
                            },
                          );
                        },
                      ),
                      AuthGradientButton(
                        buttonText: Constants.customerSignature,
                        startColor: AppPallete.label3Color,
                        endColor: AppPallete.label3Color,
                        fontSize: 13.0,
                        width: MediaQuery.of(context).size.width / 2.2,
                        height: 55,
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return CreateSignatureDialog(
                                appBarTitle: Constants.customerSignature,
                                onSignatureSubmitTap: (value) =>
                                    {debugPrint(value)},
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  AuthGradientButton(
                    buttonText: Constants.submit,
                    startColor: AppPallete.buttonColor,
                    endColor: AppPallete.gradientColor,
                    width: MediaQuery.of(context).size.width * 1,
                    height: 55,
                    onPressed: () {
                      checkLocationPermission();
                    },
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
