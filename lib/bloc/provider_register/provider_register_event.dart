import 'package:equatable/equatable.dart';

abstract class ProviderRegisterEvent extends Equatable {
  const ProviderRegisterEvent();

  @override
  List<Object?> get props => [];
}

class SubmitProviderRegister extends ProviderRegisterEvent {
  final String firstName;
  final String lastName;
  final String userName;
  final String phoneNumber;
  final DateTime birthDate;
  final String password;
  final String reEnterPassword;
  final String address;

  const SubmitProviderRegister({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.phoneNumber,
    required this.birthDate,
    required this.password,
    required this.reEnterPassword,
    required this.address,
  });

  @override
  List<Object?> get props => [
    firstName,
    lastName,
    userName,
    phoneNumber,
    birthDate,
    password,
    reEnterPassword,
    address,
  ];
}
