import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/loader.dart';
import 'package:employee_ni_service/features/home/data/model/response_home_details.dart';
import 'package:employee_ni_service/features/home/presentation/bloc/home_bloc.dart';
import 'package:employee_ni_service/features/home/presentation/widgets/pie_chart_card.dart';
import 'package:employee_ni_service/features/home/presentation/widgets/total_visit_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/show_snackbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ResponseHomeDetails? homeDetailsValue;
  @override
  void initState() {
    context.read<HomeBloc>().add(GetAllHomeDetails());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeBlocFailure) {
              showSnackBar(context, state.error);
            } else if (state is HomeBlocSuccess) {
              homeDetailsValue = state.homeDetails;
            }
          },
          builder: (context, state) {
            if (state is HomeBlocLoader) {
              return const Loader();
            }

            if (homeDetailsValue != null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 15,
                    child: Card(
                      color: AppPallete.backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TotalVisitRow(homeDetailsValue),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Flexible(
                    flex: 70,
                    child: PieChartCard(
                      homeDetailsValue: homeDetailsValue!,
                    ),
                  ),
                  const Spacer(
                    flex: 15,
                  )
                ],
              );
            }

            return const Center(
              child: Text('No data available'),
            );
          },
        ),
      ),
    );
  }
}
