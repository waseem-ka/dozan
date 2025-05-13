import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  TextEditingController otpController = TextEditingController();
  OtpCubit() : super(OtpInitial());

  void onOtpChanged(String code) {
    emit(OtpCodeChanged(code));
  }

  void verifyOtp(String enteredCode) {
    emit(OtpLoading());

    // افتراضياً، الكود الصح هو "1234" للتجريب
    Future.delayed(Duration(seconds: 2), () {
      if (enteredCode == '1234') {
        print("Verified");
        emit(OtpVerified());
      } else {
        emit(OtpError('Invalid verification code'));
      }
    });
  }

  void resendOtp() {
    emit(OtpResent());
  }
}
