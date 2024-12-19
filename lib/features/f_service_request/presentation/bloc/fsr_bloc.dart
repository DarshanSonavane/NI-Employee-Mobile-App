import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fsr_event.dart';
part 'fsr_state.dart';

class FsrBloc extends Bloc<FsrEvent, FsrState> {
  FsrBloc() : super(FsrInitial()) {
    on<FsrEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
