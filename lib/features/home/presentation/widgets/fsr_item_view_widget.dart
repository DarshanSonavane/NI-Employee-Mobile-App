import 'package:flutter/material.dart';

class FsrItemViewWidget extends StatelessWidget {
  final Map<String, dynamic> fsrData;

  const FsrItemViewWidget({super.key, required this.fsrData});

  @override
  Widget build(BuildContext context) {
    final customerName = fsrData['customerInfo']['customerName'] ?? 'N/A';
    final customerCode = fsrData['customerCode'] ?? 'N/A';
    final employeeName =
        "${fsrData['employeeInfo']['firstName']} ${fsrData['employeeInfo']['lastName']}";
    final employeeCode = fsrData['employeeCode'] ?? 'N/A';
    final location = fsrData['fsrLocation'] ?? 'N/A';
    final complaintType = fsrData['complaintType'] ?? 'N/A';
    final natureOfComplaint = fsrData['natureOfCompliant'] ?? 'N/A';

    final productNames = fsrData['productsUsed'] != null
        ? (fsrData['productsUsed'] as List)
            .map((product) => product['productName'])
            .join(", ")
        : 'N/A';

    final totalGstAmount = fsrData['productsUsed'] != null
        ? (fsrData['productsUsed'] as List)
            .map((product) =>
                double.tryParse(product['gstAmount'].toString()) ?? 0.0)
            .reduce((a, b) => a + b)
        : 0.0;

    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Customer: $customerName ($customerCode)",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text("FSR Done By: $employeeName ($employeeCode)",
                style: const TextStyle(fontSize: 14)),
            Text("Location: $location", style: const TextStyle(fontSize: 14)),
            Text("Complaint Type: $complaintType",
                style: const TextStyle(fontSize: 14)),
            Text("Nature of Complaint: $natureOfComplaint",
                style: const TextStyle(fontSize: 14)),
            Text("Products Used: $productNames",
                style: const TextStyle(fontSize: 14)),
            Text("Total GST Amount: ₹${totalGstAmount.toStringAsFixed(2)}",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
