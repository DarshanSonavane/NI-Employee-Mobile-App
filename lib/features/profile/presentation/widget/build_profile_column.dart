import 'package:flutter/material.dart';

class BuildProfileColumn extends StatelessWidget {
  final String labelName;
  final String labelValue;
  const BuildProfileColumn(
      {super.key, required this.labelName, required this.labelValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            labelValue,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
