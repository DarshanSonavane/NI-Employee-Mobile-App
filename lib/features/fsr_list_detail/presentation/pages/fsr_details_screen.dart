import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_transition.dart';
import '../../../../core/common/widgets/app_bar_widget.dart';
import '../../../home/data/model/response_fsr_model.dart';
import '../../../home/presentation/widgets/fsr_details_card.dart';

class FsrDetailsScreen extends StatefulWidget {
  final ResponseFsrModel? fsrList;
  const FsrDetailsScreen({super.key, this.fsrList});

  static Route route(ResponseFsrModel? fsrList) {
    return createSlideTransitionRoute(
      FsrDetailsScreen(fsrList: fsrList),
      arguments: fsrList,
    );
  }

  @override
  State<FsrDetailsScreen> createState() => _FsrDetailsScreenState();
}

class _FsrDetailsScreenState extends State<FsrDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      appBar: const AppBarWidget(
        title: "FSR Details",
        isBackButtonVisible: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: ListView.builder(
          itemCount: widget.fsrList!.fsrData.length,
          itemBuilder: (context, index) {
            final fsr = widget.fsrList!.fsrData[index];
            return FSRDetailsCard(
              fsr: fsr,
              isDetailsScreen: true,
            );
          },
        )),
      ),
    );
  }
}
