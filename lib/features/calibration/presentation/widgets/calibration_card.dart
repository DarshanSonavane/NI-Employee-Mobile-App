import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/set_text_normal.dart';
import 'package:employee_ni_service/features/complaint/presentation/widgets/show_take_action_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/common/widgets/animated_fab.dart';
import '../../../../core/common/widgets/build_legends.dart';
import '../../../../core/common/widgets/set_heading_text.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/database/hive_storage_service.dart';
import '../../../../service_locator_dependecies.dart';

class CalibrationCard extends StatefulWidget {
  final String? name;
  final String? customerCode;
  final String? date;
  final String? fuelType;
  final String? location;
  final String? state;
  final String? status;
  final String? assignedTo;

  const CalibrationCard({
    required this.name,
    required this.customerCode,
    required this.date,
    required this.fuelType,
    required this.location,
    required this.state,
    required this.status,
    required this.assignedTo,
    super.key,
  });

  @override
  State<CalibrationCard> createState() => _CalibrationCardState();
}

class _CalibrationCardState extends State<CalibrationCard> {
  final hiveStorageService = sl<HiveStorageService>();
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

  setFuelType(String? fuelType) {
    if (fuelType == '1') {
      return const BuildLegends(Constants.diesel, AppPallete.errorColor);
    } else {
      return const BuildLegends(Constants.petrol, AppPallete.gradientColor);
    }
  }

  String fetchUserStatus() {
    var fetchuser = hiveStorageService.getUser();
    debugPrint("FetchUser ${fetchuser?.role}");
    return fetchuser!.role;
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
                          widget.name!,
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
                            setFuelType(widget.fuelType),
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
                        setTextNormal(
                            'Code : ${widget.customerCode}', scalingFactor),
                        SizedBox(height: 4 * scalingFactor),
                        setTextNormal(
                            setDateFormat(widget.date!.substring(0, 10)),
                            scalingFactor),
                        SizedBox(height: 4 * scalingFactor),
                        setTextNormal('${widget.location!}, ${widget.state}',
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
                Icons.person,
                widget.assignedTo.toString().trim(),
                Constants.assignedTo,
                scalingFactor,
              ),
              SizedBox(height: 8 * scalingFactor),
              if (widget.state != '0')
                Align(
                  alignment: Alignment.bottomRight,
                  child: AnimatedFabMenu(
                    onGenerateSend: () {
                      debugPrint('Generate and send tapped');
                    },
                    status: widget.status!,
                    userStatus: fetchUserStatus(),
                    heroTag:
                        'unique_hero_tag_2', // unique heroTag for state != '0'
                  ),
                )
              else
                Align(
                  alignment: Alignment.bottomRight,
                  child: AnimatedFabMenu(
                    onCloseTap: () {
                      debugPrint('Close tapped');
                    },
                    status: widget.status!,
                    userStatus: fetchUserStatus(),
                    heroTag:
                        'unique_hero_tag_3', // unique heroTag for state == '0'
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
