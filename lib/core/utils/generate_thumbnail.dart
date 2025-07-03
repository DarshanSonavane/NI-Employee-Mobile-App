import 'dart:convert';

import 'package:flutter/material.dart';

class GenerateThumbnail {
  static Widget buildFileThumbnail(String base64Data, String extension) {
    final lowerExt = extension.toLowerCase();
    final cleanedBase64 =
        base64Data.contains(',') ? base64Data.split(',').last : base64Data;

    final fileBytes = base64Decode(cleanedBase64);

    if (['jpg', 'jpeg', 'png', 'gif', 'jpeg'].contains(lowerExt)) {
      // Handle image or gif
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.memory(
          fileBytes,
          height: 60,
          width: 60,
          fit: BoxFit.cover,
        ),
      );
    } else if (['mp4', 'mov', 'webm'].contains(lowerExt)) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 60,
          width: 60,
          color: Colors.black12,
          child: const Icon(Icons.videocam, size: 32, color: Colors.black54),
        ),
      );
    } else {
      // Default fallback
      return const SizedBox.shrink();
    }
  }
}
