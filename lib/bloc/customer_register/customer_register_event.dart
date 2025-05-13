import 'package:equatable/equatable.dart';

abstract class CustomerRegisterEvent extends Equatable {
  const CustomerRegisterEvent();

  @override
  List<Object?> get props => [];
}

class SubmitCustomerRegister extends CustomerRegisterEvent {
  final String firstName;
  final String lastName;
  final String userName;
  final String phoneNumber;
  final DateTime birthDate;
  final String password;
  final String reEnterPassword;

  const SubmitCustomerRegister({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.phoneNumber,
    required this.birthDate,
    required this.password,
    required this.reEnterPassword,
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
  ];
}
