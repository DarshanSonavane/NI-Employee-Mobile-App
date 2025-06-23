import 'package:flutter/material.dart';

DateTime? parseDate(String? dateString) {
  if (dateString == null || dateString.isEmpty) {
    return null;
  }

  try {
    // Format: yyyy-MM-dd
    if (dateString.contains('-') && dateString.length >= 10) {
      return DateTime.parse(dateString);
    }

    // Format: dd/MM/yyyy
    if (dateString.contains('/')) {
      final parts = dateString.split('/');
      if (parts.length == 3) {
        final day = int.parse(parts[0]);
        final month = int.parse(parts[1]);
        final year = int.parse(parts[2]);
        return DateTime(year, month, day);
      }
    }

    // Format: dd-MM-yyyy
    if (dateString.contains('-') && dateString.split('-').length == 3) {
      final parts = dateString.split('-');
      if (parts[0].length <= 2) {
        // Day first format
        final day = int.parse(parts[0]);
        final month = int.parse(parts[1]);
        final year = int.parse(parts[2]);
        return DateTime(year, month, day);
      }
    }
  } catch (e) {
    debugPrint('Error parsing date: $dateString, Error: $e');
  }

  return null;
}
