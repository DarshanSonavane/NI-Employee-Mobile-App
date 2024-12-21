import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/set_text_normal.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

import '../../../../core/constants/constants.dart';

class CreateSignatureDialog extends StatefulWidget {
  final Function(dynamic) onSignatureSubmitTap;
  const CreateSignatureDialog({super.key, required this.onSignatureSubmitTap});

  @override
  State<CreateSignatureDialog> createState() => _CreateSignatureDialogState();
}

class _CreateSignatureDialogState extends State<CreateSignatureDialog> {
  final SignatureController controller = SignatureController(
    penStrokeWidth: 3,
    penColor: AppPallete.labelColor,
    exportBackgroundColor: AppPallete.backgroundColor,
    exportPenColor: AppPallete.label3Color,
    onDrawStart: () => log("drwaing started"),
    onDrawEnd: () => log('Drawing end'),
  );

  @override
  void initState() {
    controller.addListener(() => log('Signature value changed!'));
    super.initState();
  }

  Future<void> exportImage(BuildContext context) async {
    if (controller.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No content to export!'),
        ),
      );
      return;
    }
    final Uint8List? data =
        await controller.toPngBytes(height: 1000, width: 1000);
    if (data == null) return;
    final base64Signature = base64Encode(data);
    widget.onSignatureSubmitTap(base64Signature);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppPallete.backgroundColor,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            setTextNormal(Constants.addYourSign, 1),
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: AppPallete.gradientColor,
                  width: 2,
                ),
                color: Colors.white,
              ),
              child: Signature(
                controller: controller,
                backgroundColor: AppPallete.backgroundColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => exportImage(context),
                  child: setTextNormal(Constants.submit, 1),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: setTextNormal(Constants.close, 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
