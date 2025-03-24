import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:employee_ni_service/features/fsr_list_detail/presentation/pages/fsr_details_screen.dart';
import 'package:employee_ni_service/features/home/data/model/response_fsr_model.dart';
import 'package:employee_ni_service/features/products/presentation/widgets/no_product_available.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_theme/app_pallete.dart';
import 'fsr_details_card.dart';

class BuildFsrListCard extends StatelessWidget {
  final ResponseFsrModel? fsrList;
  const BuildFsrListCard(
    this.fsrList, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppPallete.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            if (fsrList != null && fsrList!.fsrData.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    fsrList!.fsrData.length > 3 ? 3 : fsrList!.fsrData.length,
                itemBuilder: (context, index) {
                  final reversedIndex = fsrList!.fsrData.length - 1 - index;
                  final fsr = fsrList!.fsrData[reversedIndex];
                  return FSRDetailsCard(fsr: fsr);
                },
              )
            else
              const SizedBox(
                height: 200,
                child: Center(
                  child: NoProductAvailable(),
                ),
              ),
            const SizedBox(height: 20),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    FsrDetailsScreen.route(fsrList),
                  );
                },
                child: Center(
                  child: fsrList != null && fsrList!.fsrData.isNotEmpty
                      ? const CustomGlolbalText(
                          text: "View FSR's in Detail",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          color: AppPallete.errorColor,
                        )
                      : null,
                )),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
