import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dozan/services/auth_local_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthLocalService _authLocalService = AuthLocalService();

  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    await Future.delayed(Duration(seconds: 2)); // محاكاة API

    if (event.email == "waseem" && event.password == "123456") {
      await _authLocalService.saveLogin(event.email);
      emit(LoginSuccess());
    } else {
      emit(LoginError("البريد الإلكتروني أو كلمة المرور غير صحيحة."));
    }
  }
}
