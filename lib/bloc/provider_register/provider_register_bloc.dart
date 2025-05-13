import 'package:flutter_bloc/flutter_bloc.dart';
import 'provider_register_event.dart';
import 'provider_register_state.dart';

class ProviderRegisterBloc
    extends Bloc<ProviderRegisterEvent, ProviderRegisterState> {
  ProviderRegisterBloc() : super(ProviderRegisterInitial()) {
    on<SubmitProviderRegister>(_onSubmitProviderRegister);
  }

  Future<void> _onSubmitProviderRegister(
    SubmitProviderRegister event,
    Emitter<ProviderRegisterState> emit,
  ) async {
    emit(ProviderRegisterLoading());

    try {
      await Future.delayed(
        Duration(seconds: 2),
      ); //  عاساس في باك منحط مؤقت لنضحك عحالنا

      emit(ProviderRegisterLoaded());
    } catch (e) {
      emit(
        ProviderRegisterError('فشل التسجيل: ${e.toString()}'),
      ); // هون عاساس رد الباك وفشلنا بتسجيل
    }
  }
}
