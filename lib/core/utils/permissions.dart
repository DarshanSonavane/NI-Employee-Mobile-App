import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> handleLocationPermission() async {
  LocationPermission permission;
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
    return false;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return false;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    await Geolocator.openAppSettings();
    return false;
  }

  return true;
}

Future<bool> handleGalleryPermission() async {
  Permission permission;

  if (Platform.isIOS) {
    permission = Permission.photos;
  } else if (Platform.isAndroid) {
    permission = Permission.photos;
  } else {
    return false;
  }

  final status = await permission.status;

  debugPrint('Current permission status: $status');

  if (status.isGranted) {
    return true;
  }

  if (status.isDenied) {
    final result = await permission.request();
    debugPrint('Permission request result: $result');
    return result.isGranted;
  }

  if (status.isPermanentlyDenied) {
    await openAppSettings();
    return false;
  }

  if (status.isRestricted) {
    debugPrint('Photo access is restricted by parental controls');
    return false;
  }

  return false;
}

Future<File?> pickImageWithBuiltInPermissions() async {
  try {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxWidth: 1024,
      maxHeight: 1024,
    );

    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  } catch (e) {
    debugPrint('Error picking image: $e');
    return null;
  }
}
