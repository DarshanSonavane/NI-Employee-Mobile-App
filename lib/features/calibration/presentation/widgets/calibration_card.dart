import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/set_text_normal.dart';
import 'package:employee_ni_service/core/utils/fetch_user_role.dart';
import 'package:employee_ni_service/core/utils/fuel_utiles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/common/widgets/animated_fab.dart';
import '../../../../core/common/widgets/build_legends.dart';
import '../../../../core/common/widgets/set_heading_text.dart';
import '../../../../core/constants/constants.dart';

class CalibrationCard extends StatefulWidget {
  final String? name;
  final String? customerCode;
  final String? date;
  final String? fuelType;
  final String? location;
  final String? state;
  final String? status;
  final String? calibrationId;
  final String? assignedTo;
  final Function(String) onDelete;
  final Function(String)? onGenerateAndSend;

  const CalibrationCard({
    required this.name,
    required this.customerCode,
    required this.date,
    required this.fuelType,
    required this.location,
    required this.state,
    required this.status,
    required this.assignedTo,
    required this.calibrationId,
    required this.onDelete,
    this.onGenerateAndSend,
    super.key,
  });

  @override
  State<CalibrationCard> createState() => _CalibrationCardState();
}

class _CalibrationCardState extends State<CalibrationCard> {
  String setDateFormat(String dateString) {
    final DateTime parsedDate = DateTime.parse(dateString);
    final DateFormat formatter = DateFormat('dd-MMM-yyyy');
    return formatter.format(parsedDate);
  }

  setComplaintStatus(String? status) {
    if (status == '1') {
      return const BuildLegends(Constants.open, AppPallete.pieCharOpen);
    } else if (status == '2') {
      return const BuildLegends(
          Constants.assigned, AppPallete.pieCharInProcess);
    } else {
      return const BuildLegends(Constants.close, AppPallete.pieCharInProcess);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scalingFactor = screenWidth < 600 ? 0.75 : 1.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        color: AppPallete.backgroundColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(25.0 * scalingFactor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name ?? "",
                          style: TextStyle(
                            color: AppPallete.label3Color,
                            fontSize: 22 * scalingFactor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16 * scalingFactor),
                        Row(
                          children: [
                            setComplaintStatus(widget.status),
                            SizedBox(width: 8 * scalingFactor),
                            fuelUtils(widget.fuelType),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        setTextNormal('Code : ${widget.customerCode ?? ""}',
                            scalingFactor),
                        SizedBox(height: 4 * scalingFactor),
                        setTextNormal(
                            setDateFormat(widget.date!.substring(0, 10)),
                            scalingFactor),
                        SizedBox(height: 4 * scalingFactor),
                        setTextNormal(
                            '${widget.location ?? ""}, ${widget.state ?? ""}',
                            scalingFactor),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8 * scalingFactor),
              const Divider(),
              SizedBox(height: 8 * scalingFactor),
              setHeadingText(
                  null,
                  widget.assignedTo.toString().trim(),
                  Constants.assignedTo,
                  scalingFactor,
                  22,
                  AppPallete.label2Color,
                  AppPallete.label3Color),
              SizedBox(height: 8 * scalingFactor),
              Visibility(
                visible: (fetchUserRole() == '0') ||
                    (fetchUserRole() == '1' && widget.status != '0'),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: AnimatedFabMenu(
                    onGenerateSend: () {
                      widget.onGenerateAndSend!(widget.calibrationId!);
                    },
                    onDelete: () {
                      widget.onDelete(widget.calibrationId!);
                    },
                    status: widget.status!,
                    userStatus: fetchUserRole(),
                    tag: '_calibration',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
