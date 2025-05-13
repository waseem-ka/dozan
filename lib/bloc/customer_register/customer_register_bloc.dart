import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_register_event.dart';
import 'customer_register_state.dart';

class CustomerRegisterBloc
    extends Bloc<CustomerRegisterEvent, CustomerRegisterState> {
  CustomerRegisterBloc() : super(CustomerRegisterInitial()) {
    on<SubmitCustomerRegister>(_onSubmitCustomerRegister);
  }

  Future<void> _onSubmitCustomerRegister(
    SubmitCustomerRegister event,
    Emitter<CustomerRegisterState> emit,
  ) async {
    emit(CustomerRegisterLoading());

    try {
      await Future.delayed(Duration(seconds: 2)); // مؤقت لتجربة التحميل

      emit(CustomerRegisterLoaded());
    } catch (e) {
      emit(CustomerRegisterError('فشل التسجيل: ${e.toString()}'));
    }
  }
}
