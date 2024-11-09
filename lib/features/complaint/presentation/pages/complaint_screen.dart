import 'package:employee_ni_service/features/complaint/data/models/response_complaint_details.dart';
import 'package:employee_ni_service/features/complaint/presentation/bloc/complaint_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../widgets/complaint_card.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen>
    with SingleTickerProviderStateMixin {
  ResponseComplaintDetails? complaintDetails;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    context.read<ComplaintBloc>().add(GetAllComplaintList());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      body: Column(
        children: [
          Container(
            color: AppPallete.gradientColor,
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white60,
              tabs: const [
                Tab(text: 'Active Complaints'),
                Tab(text: 'Closed Complaints'),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: BlocConsumer<ComplaintBloc, ComplaintState>(
                listener: (context, state) {
                  if (state is ComplaintFailure) {
                    showSnackBar(context, state.errorMessage);
                  } else if (state is ComplaintSuccess) {
                    complaintDetails = state.complaintDetails;
                  }
                },
                builder: (context, state) {
                  if (state is ComplaintLoader) {
                    return const Loader();
                  } else if (state is ComplaintSuccess &&
                      complaintDetails != null) {
                    // Filter complaints based on status
                    final statusZeroComplaints = complaintDetails!.data
                        .where((complaint) => complaint.status == '0')
                        .toList();
                    final otherStatusComplaints = complaintDetails!.data
                        .where((complaint) => complaint.status != '0')
                        .toList();

                    return TabBarView(
                      controller: _tabController,
                      children: [
                        // Open Tab
                        otherStatusComplaints.isEmpty
                            ? const Center(
                                child: Text(
                                  'No open complaints',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount: otherStatusComplaints.length,
                                itemBuilder: (context, index) {
                                  final complaint =
                                      otherStatusComplaints[index];
                                  return ComplaintCard(
                                    name: complaint.customerId.customerName,
                                    customerCode:
                                        complaint.customerId.customerCode,
                                    date: complaint.createdAt.toString(),
                                    fuelType: complaint.machineType,
                                    location: complaint.customerId.city,
                                    state: complaint.customerId.stateCode,
                                    complaintType: complaint.complaintType.name,
                                    additionalRequest: complaint.additionalReq,
                                    feedback: complaint.employeeFeedback,
                                    status: complaint.status,
                                  );
                                },
                              ),
                        // Closed Tab
                        statusZeroComplaints.isEmpty
                            ? const Center(
                                child: Text(
                                  'No closed complaints',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount: statusZeroComplaints.length,
                                itemBuilder: (context, index) {
                                  final complaint = statusZeroComplaints[index];
                                  return ComplaintCard(
                                    name: complaint.customerId.customerName,
                                    customerCode:
                                        complaint.customerId.customerCode,
                                    date: complaint.createdAt.toString(),
                                    fuelType: complaint.machineType,
                                    location: complaint.customerId.city,
                                    state: complaint.customerId.stateCode,
                                    complaintType: complaint.complaintType.name,
                                    additionalRequest: complaint.additionalReq,
                                    feedback: complaint.employeeFeedback,
                                    status: complaint.status,
                                  );
                                },
                              ),
                      ],
                    );
                  }
                  return const Center(
                    child: Text(
                      "No data available",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}








// import 'package:employee_ni_service/features/complaint/data/models/response_complaint_details.dart';
// import 'package:employee_ni_service/features/complaint/presentation/bloc/complaint_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/app_theme/app_pallete.dart';
// import '../../../../core/common/widgets/loader.dart';
// import '../../../../core/utils/show_snackbar.dart';
// import '../widgets/complaint_card.dart';

// class ComplaintScreen extends StatefulWidget {
//   const ComplaintScreen({super.key});

//   @override
//   State<ComplaintScreen> createState() => _ComplaintScreenState();
// }

// class _ComplaintScreenState extends State<ComplaintScreen>
//     with SingleTickerProviderStateMixin {
//   ResponseComplaintDetails? complaintDetails;
//   late TabController _tabController;

//   @override
//   void initState() {
//     _tabController = TabController(length: 2, vsync: this);
//     super.initState();
//     context.read<ComplaintBloc>().add(GetAllComplaintList());
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppPallete.screenBackground,
//       body: Padding(
//         padding: const EdgeInsets.all(14.0),
//         child: BlocConsumer<ComplaintBloc, ComplaintState>(
//           listener: (context, state) {
//             if (state is ComplaintFailure) {
//               showSnackBar(context, state.errorMessage);
//             } else if (state is ComplaintSuccess) {
//               complaintDetails = state.complaintDetails;
//             }
//           },
//           builder: (context, state) {
//             if (state is ComplaintLoader) {
//               return const Loader();
//             } else if (state is ComplaintSuccess && complaintDetails != null) {
//               // Filter complaints based on status
//               final statusZeroComplaints = complaintDetails!.data
//                   .where((complaint) => complaint.status == '0')
//                   .toList();
//               final otherStatusComplaints = complaintDetails!.data
//                   .where((complaint) => complaint.status != '0')
//                   .toList();

//               return TabBarView(
//                 controller: _tabController,
//                 children: [
//                   // Open Tab
//                   ListView.builder(
//                     itemCount: otherStatusComplaints.length,
//                     itemBuilder: (context, index) {
//                       final complaint = otherStatusComplaints[index];
//                       return ComplaintCard(
//                         name: complaint.customerId.customerName,
//                         customerCode: complaint.customerId.customerCode,
//                         date: complaint.createdAt.toString(),
//                         fuelType: complaint.machineType,
//                         location: complaint.customerId.city,
//                         state: complaint.customerId.stateCode,
//                         complaintType: complaint.complaintType.name,
//                         additionalRequest: complaint.additionalReq,
//                         feedback: complaint.employeeFeedback,
//                         status: complaint.status,
//                       );
//                     },
//                   ),
//                   // Closed Tab
//                   ListView.builder(
//                     itemCount: statusZeroComplaints.length,
//                     itemBuilder: (context, index) {
//                       final complaint = statusZeroComplaints[index];
//                       return ComplaintCard(
//                         name: complaint.customerId.customerName,
//                         customerCode: complaint.customerId.customerCode,
//                         date: complaint.createdAt.toString(),
//                         fuelType: complaint.machineType,
//                         location: complaint.customerId.city,
//                         state: complaint.customerId.stateCode,
//                         complaintType: complaint.complaintType.name,
//                         additionalRequest: complaint.additionalReq,
//                         feedback: complaint.employeeFeedback,
//                         status: complaint.status,
//                       );
//                     },
//                   ),
//                 ],
//               );
//             }
//             return const Text("No data available");
//           },
//         ),
//       ),
//     );
//   }
// }




// import 'package:employee_ni_service/features/complaint/data/models/response_complaint_details.dart';
// import 'package:employee_ni_service/features/complaint/presentation/bloc/complaint_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/app_theme/app_pallete.dart';
// import '../../../../core/common/widgets/loader.dart';
// import '../../../../core/utils/show_snackbar.dart';
// import '../widgets/complaint_card.dart';

// class ComplaintScreen extends StatefulWidget {
//   const ComplaintScreen({super.key});

//   @override
//   State<ComplaintScreen> createState() => _ComplaintScreenState();
// }

// class _ComplaintScreenState extends State<ComplaintScreen> {
//   ResponseComplaintDetails? complaintDetails;
//   @override
//   void initState() {
//     context.read<ComplaintBloc>().add(GetAllComplaintList());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppPallete.screenBackground,
//       body: Padding(
//         padding: const EdgeInsets.all(14.0),
//         child: BlocConsumer<ComplaintBloc, ComplaintState>(
//           listener: (context, state) {
//             if (state is ComplaintFailure) {
//               showSnackBar(context, state.errorMessage);
//             } else if (state is ComplaintSuccess) {
//               complaintDetails = state.complaintDetails;
//             }
//           },
//           builder: (context, state) {
//             if (state is ComplaintLoader) {
//               return const Loader();
//             } else if (state is ComplaintSuccess && complaintDetails != null) {
//               return ListView.builder(
//                 itemCount: complaintDetails!.data.length,
//                 itemBuilder: (context, index) {
//                   final complaint = complaintDetails!.data[index];
//                   return ComplaintCard(
//                       name: complaint.customerId.customerName,
//                       customerCode: complaint.customerId.customerCode,
//                       date: complaint.createdAt.toString(),
//                       fuelType: complaint.machineType,
//                       location: complaint.customerId.city,
//                       state: complaint.customerId.stateCode,
//                       complaintType: complaint.complaintType.name,
//                       additionalRequest: complaint.additionalReq,
//                       feedback: complaint.employeeFeedback,
//                       status: complaint.status);
//                 },
//               );
//             }
//             return const Text("No data available");
//           },
//         ),
//       ),
//     );
//   }
// }
