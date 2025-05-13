abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpVerified extends OtpState {}

class OtpCodeChanged extends OtpState {
  final String code;
  OtpCodeChanged(this.code);
}

class OtpError extends OtpState {
  final String message;
  OtpError(this.message);
}

class OtpResent extends OtpState {}
