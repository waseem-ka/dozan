import 'package:flutter_bloc/flutter_bloc.dart';
part 'register_type_event.dart';
part 'register_type_state.dart';

class RegisterTypeBloc extends Bloc<RegisterTypeEvent, RegisterTypeState> {
  RegisterTypeBloc() : super(RegisterTypeState(selectedType: 'Customer')) {
    on<RegisterTypeSelected>((event, emit) {
      emit(state.copyWith(selectedType: event.selectedType));
    });
  }
}
