import 'package:employee_ni_service/features/complaint/data/models/common_response_model/common_response_complaint_model.dart';
import 'package:employee_ni_service/features/complaint/data/models/model_close_complaint/request_close_complaint_model.dart';
import 'package:employee_ni_service/features/complaint/data/models/model_complaint_list/response_complaint_details.dart';
import 'package:employee_ni_service/features/complaint/domain/usecases/fetch_complaint_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator_dependecies.dart';
import '../../data/models/model_fetch_employee/response_employee_model.dart';
import '../../domain/usecases/close_complaint_data.dart';
import '../../domain/usecases/fetch_employee_data.dart';
part 'complaint_event.dart';
part 'complaint_state.dart';

class ComplaintBloc extends Bloc<ComplaintEvent, ComplaintState> {
  ComplaintBloc({
    required FetchComplaintData fetchComplaintData,
    required CloseComplaintData closeComplaintData,
    required FetchEmployeeData fetchEmployeeData,
  }) : super(ComplaintInitial()) {
    on<ComplaintEvent>((_, emit) => emit((ComplaintLoader())));
    on<GetAllComplaintList>(_onFetchComplaintDetails);
    on<CloseComplaintsItem>(_onCloseComplaintItem);
    on<GetAllEmployeesList>(_onFetchEmployeeDetails);
  }

  void _onFetchComplaintDetails(
    GetAllComplaintList event,
    Emitter<ComplaintState> emit,
  ) async {
    final res = await sl<FetchComplaintData>().call();
    res.fold(
      (l) => emit(ComplaintFailure(l)),
      (r) => emit(ComplaintSuccess<ResponseComplaintDetails>(r)),
    );
  }

  void _onFetchEmployeeDetails(
    GetAllEmployeesList event,
    Emitter<ComplaintState> emit,
  ) async {
    final res = await sl<FetchEmployeeData>().call();
    res.fold(
      (l) => emit(ComplaintFailure(l)),
      (r) => emit(
        ComplaintSuccess<ResponseEmployeeModel>(r,
            complaintId: event.complaintId),
      ),
    );
  }

  void _onCloseComplaintItem(
    CloseComplaintsItem event,
    Emitter<ComplaintState> emit,
  ) async {
    final res = await sl<CloseComplaintData>().call(
        params: RequestCloseComplaintModel(
          complaintId: event.complaintId,
          employeeId: event.employeeId!,
        ),
        source: event.source);
    res.fold(
      (l) => emit(ComplaintFailure(l)),
      (r) => emit(ComplaintSuccess<CommonResponseComplaintModel>(
        r,
        source: event.source,
      )),
    );
  }
}
