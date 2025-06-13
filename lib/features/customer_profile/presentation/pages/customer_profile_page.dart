import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/utils/app_transition.dart';
import 'package:employee_ni_service/core/common/widgets/app_bar_widget.dart';
import 'package:employee_ni_service/features/customer_profile/presentation/widgets/customer_list_widget.dart';
import 'package:flutter/material.dart';

class CustomerProfilePage extends StatefulWidget {
  static Route route() {
    return createSlideTransitionRoute(const CustomerProfilePage());
  }

  const CustomerProfilePage({super.key});

  @override
  State<CustomerProfilePage> createState() => _CustomerProfilePageState();
}

class _CustomerProfilePageState extends State<CustomerProfilePage> {
  final List<Map<String, String>> customerList = [
    {
      "custCode": "108012",
      "custName": "Asian Petroleum Centre. Thane",
      "city": "CHAROTI",
      "state": "",
      "email": "",
      "mobileNo": "",
      "gstNo": "",
      "amcDue": "",
      "petrolMachNo": "",
      "dieselMachNo": "",
      "comboMachNo": "",
    },
    {
      "custCode": "108013",
      "custName": "Aishwarya PUC Centre",
      "city": "Kalyan",
      "state": "MH",
      "email": "lakeshrid@gmail.com",
      "mobileNo": "9969485454",
      "gstNo": "27ABCDE1234F1Z5",
      "amcDue": "2026-02-06",
      "petrolMachNo": "733",
      "dieselMachNo": "2167",
      "comboMachNo": "",
    },
    {
      "custCode": "108068",
      "custName": "Broadway Automobiles",
      "city": "THANE",
      "state": "MH",
      "email": "dealer@broadwayautomobiles.com",
      "mobileNo": "9320273426",
      "gstNo": "27XYZPQ4567K2Z9",
      "amcDue": "2025-09-18",
      "petrolMachNo": "1276",
      "dieselMachNo": "3048",
      "comboMachNo": "",
    },
    {
      "custCode": "108075",
      "custName": "Velocity Fuel Station",
      "city": "Navi Mumbai",
      "state": "MH",
      "email": "contact@velocityfuel.in",
      "mobileNo": "9867452311",
      "gstNo": "27MNBVC7890L3Z7",
      "amcDue": "2026-01-12",
      "petrolMachNo": "842",
      "dieselMachNo": "3190",
      "comboMachNo": "221",
    },
    {
      "custCode": "108079",
      "custName": "Green Energy Fuel Stop",
      "city": "Pune",
      "state": "MH",
      "email": "greenfuel@gefs.com",
      "mobileNo": "9012345678",
      "gstNo": "27GHJKE4561W8Z2",
      "amcDue": "2025-12-28",
      "petrolMachNo": "953",
      "dieselMachNo": "4102",
      "comboMachNo": "",
    },
    {
      "custCode": "108083",
      "custName": "Orbit Fuel Services",
      "city": "Nashik",
      "state": "MH",
      "email": "orbitfuels@service.in",
      "mobileNo": "8123456789",
      "gstNo": "27QWERT9876Y5Z3",
      "amcDue": "2025-10-15",
      "petrolMachNo": "1021",
      "dieselMachNo": "",
      "comboMachNo": "345",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      appBar: const AppBarWidget(
        title: "Customer Profile",
        isBackButtonVisible: true,
        isFromMoreIcon: true,
        isMoreButtonVisible: false,
        navigateTo: "addCustomer",
      ),
      body: ListView.builder(
        itemCount: customerList.length,
        itemBuilder: (context, index) {
          final item = customerList[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            child: CustomerListWidget(item: item),
          );
        },
      ),
    );
  }
}
