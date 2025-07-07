import 'dart:convert';
import 'dart:io';

import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:employee_ni_service/core/common/widgets/dialog_helper.dart';
import 'package:employee_ni_service/core/utils/show_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageChooserWidget extends StatefulWidget {
  final void Function(File file, String base64, String extension)
      onFileSelected;
  const ImageChooserWidget({super.key, required this.onFileSelected});

  @override
  State<ImageChooserWidget> createState() => _ImageChooserWidgetState();
}

class _ImageChooserWidgetState extends State<ImageChooserWidget> {
  File? selectedFile;
  bool isLoading = false;

  Future<void> pickMedia() async {
    setState(() {
      isLoading = true;
    });

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'jpeg', 'gif', 'mp4', 'mov'],
      );

      if (result != null && result.files.single.path != null) {
        File file = File(result.files.single.path!);
        final extension = file.path.split('.').last.toLowerCase();

        final bytes = await file.readAsBytes();
        final base64 = base64Encode(bytes);

        if (mounted) {
          setState(() {
            selectedFile = file;
          });
          widget.onFileSelected(file, base64, extension);
        }
      } else if (mounted) {
        const permission = Permission.photos;
        final status = await permission.status;
        if (status.isDenied || status.isPermanentlyDenied) {
          if (mounted) {
            DialogHelper.showPermissionDialog(context: context);
          }
        }
      }
    } catch (e) {
      if (mounted) {
        showSnackBar(context, "Error selecting file. Try again.");
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void removeFile() {
    setState(() {
      selectedFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final fileExtension = selectedFile?.path.split('.').last.toLowerCase();
    final isImage = ['jpg', 'jpeg', 'png', 'gif'].contains(fileExtension);
    final isVideo = ['mp4', 'mov'].contains(fileExtension);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        color: AppPallete.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: const BorderSide(
            color: AppPallete.gradientColor,
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              const CustomGlolbalText(
                text: "Choose Image, GIF or Video",
                color: AppPallete.label3Color,
              ),
              const SizedBox(height: 12),
              Center(
                child: GestureDetector(
                  onTap: selectedFile == null && !isLoading ? pickMedia : null,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: AppPallete.buttonColor,
                          border: Border.all(
                            color: AppPallete.buttonColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(18),
                          // Only show image preview for actual images
                          image: selectedFile != null && isImage
                              ? DecorationImage(
                                  image: FileImage(selectedFile!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: selectedFile == null
                            ? isLoading
                                ? const Center(
                                    child: CupertinoActivityIndicator(
                                      radius: 12,
                                      color: Colors.white,
                                    ),
                                  )
                                : const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 30,
                                  )
                            : (isVideo
                                ? const Icon(
                                    Icons.videocam,
                                    color: Colors.white,
                                    size: 30,
                                  )
                                : null),
                      ),
                      if (selectedFile != null)
                        Positioned(
                          top: -20,
                          right: -17,
                          child: IconButton(
                            icon: const CircleAvatar(
                              radius: 12,
                              backgroundColor: AppPallete.backgroundColor,
                              child: Icon(
                                Icons.close,
                                size: 16,
                                color: AppPallete.errorColor,
                                weight: 800,
                              ),
                            ),
                            padding: EdgeInsets.zero,
                            onPressed: removeFile,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
