import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';

class NoProductAvailable extends StatelessWidget {
  const NoProductAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(20), // Adjust the radius as needed
          child: Image.asset(
            Constants.nodatafound,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
