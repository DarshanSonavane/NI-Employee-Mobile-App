import 'dart:io';

import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:employee_ni_service/core/common/widgets/dialog_helper.dart';
import 'package:employee_ni_service/core/utils/show_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageChooserWidget extends StatefulWidget {
  const ImageChooserWidget({super.key});

  @override
  State<ImageChooserWidget> createState() => _ImageChooserWidgetState();
}

class _ImageChooserWidgetState extends State<ImageChooserWidget> {
  File? selectedImage;
  bool isLoading = false;

  Future<void> pickImage() async {
    setState(() {
      isLoading = true;
    });

    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      if (pickedFile != null && mounted) {
        setState(() {
          selectedImage = File(pickedFile.path);
        });
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
        if (e.toString().contains('permission') ||
            e.toString().contains('denied')) {
          DialogHelper.showPermissionDialog(context: context);
        } else {
          showSnackBar(context, "Error selecting image: Please try again");
        }
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void removeImage() {
    setState(() {
      selectedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                text: "Choose an Image",
                color: AppPallete.label3Color,
              ),
              const SizedBox(height: 12),
              Center(
                child: GestureDetector(
                  onTap: selectedImage == null && !isLoading ? pickImage : null,
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
                          image: selectedImage != null
                              ? DecorationImage(
                                  image: FileImage(selectedImage!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: selectedImage == null
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
                            : null,
                      ),
                      if (selectedImage != null)
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
                                color: Colors.red,
                                weight: 800,
                              ),
                            ),
                            padding: EdgeInsets.zero,
                            onPressed: removeImage,
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
