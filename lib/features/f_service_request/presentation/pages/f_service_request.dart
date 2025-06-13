import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:employee_ni_service/core/common/widgets/dialog_helper.dart';
import 'package:employee_ni_service/core/common/widgets/loader.dart';
import 'package:employee_ni_service/core/utils/fetch_user_role.dart';
import 'package:employee_ni_service/core/utils/machine_options.dart';
import 'package:employee_ni_service/core/utils/show_snackbar.dart';
import 'package:employee_ni_service/features/complaint/presentation/bloc/complaint_bloc.dart';
import 'package:employee_ni_service/core/common/widgets/app_bar_widget.dart';
import 'package:employee_ni_service/features/f_service_request/data/model/request_create_fsr_model.dart';
import 'package:employee_ni_service/features/f_service_request/data/model/response_verification_model.dart';
import 'package:employee_ni_service/features/f_service_request/domain/entities/request_create_fsr_entity.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/bloc/fsr_bloc.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/provider/total_amount_provider.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/widgets/create_signature_dialog.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/widgets/otp_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../../../../core/common/widgets/auth_gradient_button.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/permissions.dart';
import '../../../calibration/presentation/widgets/machine_dropdown.dart';
import '../widgets/add_details_widget.dart';
import '../widgets/signature_display.dart';

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
  var contactPersonController = TextEditingController();
  final designationController = TextEditingController();
  final engEmpCodeController = TextEditingController();
  final complaintTypeController = TextEditingController();
  final remarkController = TextEditingController();
  final correctiveActionController = TextEditingController();
  final detailsActionController = TextEditingController();
  double totalAmount = 0.0;
  double totalAmountExclGST = 0.0;
  double gstAmount = 0.0;
  String epochMillisecondsStart = "";
  String epochMillisecondsEnd = "";
  double totalAmountincGST = 0.0;
  double gstPercentage = 18;
  String employeeSign = "";
  String customerSign = "";
  String fsrLocation = "";
  List<ProductUsedEntity> productsUsed = [];

  @override
  void initState() {
    epochMillisecondsStart =
        "${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}";
    contactPersonController = TextEditingController(text: widget.customerName);
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

  void _updateTotalAmountincGST(double newValue) {
    setState(() {
      totalAmountincGST = newValue;
    });
  }

  Future<String> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ));
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      String fullAddress =
          "${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.country}, ${place.postalCode}";
      return fullAddress;
    } catch (e) {
      debugPrint("Error getting location: $e");
      throw Exception("Failed to fetch location: $e");
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

  Future<void> validateAndSubmit() async {
    if (formKey.currentState?.validate() != true) {
      showSnackBar(context, "Please fill in all required fields",
          backgroundColor: AppPallete.errorColor);
      return;
    }

    if (selectedMachine == null || selectedMachine!.isEmpty) {
      showSnackBar(context, Constants.machineDropDown,
          backgroundColor: AppPallete.errorColor);
      return;
    }

    if (natureOfComplaint == null || natureOfComplaint!.isEmpty) {
      showSnackBar(context, 'Please select nature of complaint',
          backgroundColor: AppPallete.errorColor);
      return;
    }

    if (status == null || status!.isEmpty) {
      showSnackBar(context, 'Please select status',
          backgroundColor: AppPallete.errorColor);
      return;
    }

    bool hasZeroQuantity =
        productsUsed.any((product) => product.quantityUsed == 0);
    if (hasZeroQuantity) {
      showSnackBar(context, "You can't add products with 0 quantity",
          backgroundColor: AppPallete.errorColor);
      return;
    }

    bool permissionGranted = await handleLocationPermission();
    if (!permissionGranted) {
      showPermissionDeniedDialog();
      return;
    }

    fsrLocation = await getCurrentLocation();
    epochMillisecondsEnd =
        "${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}";
    _showOtpDialog();
  }

  void _showOtpDialog() {
    OtpDialog.showOtpDialog(
        context: context,
        onSubmitOtp: (String otpValue) {
          context.read<FsrBloc>().add(VerifyOtp(
              customerCode: customerCodeController.text,
              otpValue: otpValue,
              otpType: "complaint"));
        });
    context.read<FsrBloc>().add(
          SendOtpRequest(
              customerCode: customerCodeController.text, otpType: "complaint"),
        );
  }

  void sendRequestForCreatingFSR() {
    gstAmount = (totalAmountincGST * gstPercentage) / 118;
    totalAmountExclGST = totalAmountincGST - gstAmount;
    RequestCreateFSRModel requestCreateFsrModel = RequestCreateFSRModel(
      customerCode: customerCodeController.text,
      contactPerson: contactPersonController.text,
      designation: designationController.text,
      employeeCode: engEmpCodeController.text,
      model: selectedMachine.toString(),
      employeeId: fetchUserId(),
      complaintType: complaintTypeController.text,
      natureOfCompliant: natureOfComplaint.toString(),
      productsUsed: productsUsed.isEmpty ? [] : productsUsed,
      remark: remarkController.text,
      correctiveAction: correctiveActionController.text,
      status: status.toString(),
      serviceDetails: detailsActionController.text,
      employeeSignature: employeeSign,
      customerSignature: customerSign,
      fsrLocation: fsrLocation,
      fstStartTime: epochMillisecondsStart.toString(),
      fsrEndTime: epochMillisecondsEnd.toString(),
      finalTotalAmount: totalAmountExclGST.toString(),
      complaint: widget.complaintId,
      totalGSTAmount: gstAmount.toString(),
    );

    context.read<FsrBloc>().add(
          SendRequestForCreateFSR(
            requestCreateFSRModel: requestCreateFsrModel,
          ),
        );
  }

  void _clearAllFields() {
    setState(() {
      selectedMachine = null;
      natureOfComplaint = null;
      status = null;
      customerCodeController.clear();
      contactPersonController.clear();
      designationController.clear();
      engEmpCodeController.clear();
      complaintTypeController.clear();
      remarkController.clear();
      correctiveActionController.clear();
      detailsActionController.clear();
      totalAmount = 0.0;
      gstAmount = 0.0;
      epochMillisecondsStart = "";
      epochMillisecondsEnd = "";
      totalAmountincGST = 0.00;
      totalAmountExclGST = 0.00;
      employeeSign = "";
      customerSign = "";
      fsrLocation = "";
      productsUsed = [];
    });
  }

  @override
  void dispose() {
    contactPersonController.dispose();
    customerCodeController.dispose();
    designationController.dispose();
    engEmpCodeController.dispose();
    complaintTypeController.dispose();
    remarkController.dispose();
    correctiveActionController.dispose();
    detailsActionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppPallete.screenBackground,
        appBar: const AppBarWidget(
          title: Constants.fsr,
          isBackButtonVisible: true,
          isMoreButtonVisible: false,
        ),
        body: BlocListener<FsrBloc, FsrState>(
          listener: (context, state) {
            if (state is FsrFailure) {
              showSnackBar(context, state.message);
            }
            if (state is FsrSuccess<ResponseVerificationModel>) {
              if (state.type == "sendOTP") {
                sendRequestForCreatingFSR();
              } else if (state.type == "createFSR") {
                showSnackBar(context, state.data.message,
                    backgroundColor: AppPallete.gradientColor);
                context.read<TotalAmountProvider>().resetTotalAmount();
                _clearAllFields();
                context.read<ComplaintBloc>().add(GetAllComplaintList(
                    complaintType: Constants.activeComplaints));
                Navigator.pop(context);
              }
            }
          },
          child: BlocBuilder<FsrBloc, FsrState>(builder: (context, state) {
            if (state is FsrLoader) {
              return const Center(child: Loader());
            }
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        labelText: Constants.customerCode,
                        value: widget.customerCode,
                        controller: customerCodeController,
                        textStyle: const TextStyle(
                            color: AppPallete.label3Color, fontSize: 16),
                        labelStyle: const TextStyle(color: AppPallete.deepNavy),
                        fillColor: AppPallete.backgroundClosed,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        editableText: false,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Customer code is required';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        labelText: Constants.contactPerson,
                        controller: contactPersonController,
                        textStyle: const TextStyle(
                            color: AppPallete.label3Color, fontSize: 16),
                        labelStyle: const TextStyle(color: AppPallete.deepNavy),
                        fillColor: AppPallete.backgroundClosed,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Contact Person is required';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        labelText: Constants.designation,
                        controller: designationController,
                        textStyle: const TextStyle(
                            color: AppPallete.label3Color, fontSize: 16),
                        labelStyle: const TextStyle(color: AppPallete.deepNavy),
                        fillColor: AppPallete.backgroundClosed,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Designation is required';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        labelText: Constants.engEmpCode,
                        value: widget.employeeCode,
                        controller: engEmpCodeController,
                        textStyle: const TextStyle(
                            color: AppPallete.label3Color, fontSize: 16),
                        labelStyle: const TextStyle(color: AppPallete.deepNavy),
                        fillColor: AppPallete.backgroundClosed,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        editableText: false,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Employee Code is required';
                          }
                          return null;
                        },
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
                            color: AppPallete.label3Color, fontSize: 16),
                        labelStyle: const TextStyle(color: AppPallete.deepNavy),
                        fillColor: AppPallete.backgroundClosed,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        editableText: false,
                        minLines: 1,
                        maxLines: null,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Complaint type is required';
                          }
                          return null;
                        },
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
                            color: AppPallete.label3Color, fontSize: 16),
                        labelStyle: const TextStyle(color: AppPallete.deepNavy),
                        fillColor: AppPallete.backgroundClosed,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Remark is required';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        labelText: Constants.detailsOfAction,
                        controller: detailsActionController,
                        textStyle: const TextStyle(
                            color: AppPallete.label3Color, fontSize: 16),
                        labelStyle: const TextStyle(color: AppPallete.deepNavy),
                        fillColor: AppPallete.backgroundClosed,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        maxLines: null,
                        minLines: 3,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Details are required';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        labelText: Constants.correctiveAction,
                        controller: correctiveActionController,
                        textStyle: const TextStyle(
                            color: AppPallete.label3Color, fontSize: 16),
                        labelStyle: const TextStyle(color: AppPallete.deepNavy),
                        fillColor: AppPallete.backgroundClosed,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        maxLines: null,
                        minLines: 3,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Corrective action is required';
                          }
                          return null;
                        },
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
                      const SizedBox(height: 5),
                      AddDetailsWidget(
                        onProductsChanged: (products) {
                          setState(() {
                            productsUsed = products;
                          });
                        },
                      ),
                      Consumer<TotalAmountProvider>(
                        builder: (context, provider, child) {
                          double totalAmountincGST =
                              provider.getTotalAmountInclGst;
                          if (natureOfComplaint == "Service Call") {
                            double gst = 2500 * 0.18;
                            totalAmountincGST += 2500 + gst;
                          }

                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            _updateTotalAmountincGST(totalAmountincGST);
                          });
                          return Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: CustomGlolbalText(
                                text:
                                    '${Constants.totalAmountInclGst}${totalAmountincGST.toStringAsFixed(2)}/-',
                                color: AppPallete.gradientColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
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
                                    onSignatureSubmitTap: (value) {
                                      employeeSign = value;
                                    },
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
                                    onSignatureSubmitTap: (value) {
                                      customerSign = value;
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      (employeeSign.isNotEmpty || customerSign.isNotEmpty)
                          ? Column(
                              spacing: 15,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (employeeSign.isNotEmpty)
                                  SignatureDisplay(
                                    signature: employeeSign,
                                    label: Constants.employeeSignature,
                                    onDelete: () {
                                      setState(() {
                                        employeeSign = "";
                                      });
                                    },
                                  ),
                                if (customerSign.isNotEmpty)
                                  SignatureDisplay(
                                    signature: customerSign,
                                    label: Constants.customerSignature,
                                    onDelete: () {
                                      setState(() {
                                        customerSign = "";
                                      });
                                    },
                                  ),
                              ],
                            )
                          : Container(),
                      const SizedBox(height: 10),
                      AuthGradientButton(
                        buttonText: Constants.submit,
                        startColor: AppPallete.buttonColor,
                        endColor: AppPallete.gradientColor,
                        width: MediaQuery.of(context).size.width * 1,
                        height: 55,
                        onPressed: () => validateAndSubmit(),
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                ),
              ),
            );
          }),
        ));
  }
}
