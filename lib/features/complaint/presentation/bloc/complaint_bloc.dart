import 'package:employee_ni_service/features/complaint/data/models/response_complaint_details.dart';
import 'package:employee_ni_service/features/complaint/domain/usecases/fetch_complaint_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator_dependecies.dart';
part 'complaint_event.dart';
part 'complaint_state.dart';

class ComplaintBloc extends Bloc<ComplaintEvent, ComplaintState> {
  ComplaintBloc({
    required FetchComplaintData fetchComplaintData,
  }) : super(ComplaintInitial()) {
    on<ComplaintEvent>((_, emit) => emit((ComplaintLoader())));
    on<GetAllComplaintList>(_onFetchComplaintDetails);
  }

  void _onFetchComplaintDetails(
    GetAllComplaintList event,
    Emitter<ComplaintState> emit,
  ) async {
    final res = await sl<FetchComplaintData>().call();
    res.fold(
      (l) => emit(ComplaintFailure(l.message)),
      (r) => emit(ComplaintSuccess(r)),
    );
  }
}
