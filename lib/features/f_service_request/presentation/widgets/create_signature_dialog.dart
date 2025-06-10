import 'dart:convert';
import 'dart:typed_data';
import 'package:employee_ni_service/core/common/widgets/set_text_normal.dart';
import 'package:employee_ni_service/core/utils/show_snackbar.dart';
import 'package:flutter/material.dart';

import 'package:signature/signature.dart';

import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/constants/constants.dart';

class CreateSignatureDialog extends StatefulWidget {
  final String appBarTitle;
  final Function(dynamic) onSignatureSubmitTap;
  const CreateSignatureDialog(
      {super.key,
      required this.onSignatureSubmitTap,
      required this.appBarTitle});

  @override
  State<CreateSignatureDialog> createState() => _CreateSignatureDialogState();
}

class _CreateSignatureDialogState extends State<CreateSignatureDialog> {
  final SignatureController controller = SignatureController(
    penStrokeWidth: 8,
    penColor: AppPallete.backgroundColor,
    exportBackgroundColor: AppPallete.backgroundColor,
    exportPenColor: AppPallete.label3Color,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> exportImage(BuildContext context) async {
    if (controller.isEmpty) {
      showSnackBar(context, Constants.noImageToExport);
      return;
    }
    final Uint8List? data =
        await controller.toPngBytes(height: 1000, width: 1000);
    if (data == null) return;
    final base64Signature = base64Encode(data);
    widget.onSignatureSubmitTap(base64Signature);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      appBar: AppBar(
        title: setTextNormal(widget.appBarTitle, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: AppPallete.gradientColor,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        // Center widget to center the signature box
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Signature(
            key: const Key(Constants.signatureKey),
            controller: controller,
            height: MediaQuery.of(context).size.height * 0.6,
            backgroundColor: AppPallete.label2Color,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppPallete.gradientColor,
        child: Container(
          decoration: const BoxDecoration(color: AppPallete.gradientColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                key: const Key(Constants.clearKey),
                icon: const Icon(Icons.clear),
                color: AppPallete.backgroundOpen,
                onPressed: () {
                  setState(() => controller.clear());
                },
                tooltip: Constants.clearKey,
              ),
              IconButton(
                key: const Key(Constants.undoKey),
                icon: const Icon(Icons.undo),
                color: AppPallete.backgroundOpen,
                onPressed: () {
                  setState(() => controller.undo());
                },
                tooltip: Constants.undoKey,
              ),
              IconButton(
                key: const Key(Constants.redoKey),
                icon: const Icon(Icons.redo),
                color: AppPallete.backgroundOpen,
                onPressed: () {
                  setState(() => controller.redo());
                },
                tooltip: Constants.redoKey,
              ),
              IconButton(
                key: const Key(Constants.exportKey),
                icon: const Icon(Icons.check_circle),
                color: AppPallete.backgroundOpen,
                onPressed: () {
                  exportImage(context);
                  Navigator.of(context).pop();
                },
                tooltip: Constants.exportImage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
