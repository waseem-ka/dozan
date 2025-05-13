import 'package:equatable/equatable.dart';

abstract class CustomerRegisterState extends Equatable {
  const CustomerRegisterState();

  @override
  List<Object?> get props => [];
}

class CustomerRegisterInitial extends CustomerRegisterState {}

class CustomerRegisterLoading extends CustomerRegisterState {}

class CustomerRegisterLoaded extends CustomerRegisterState {}

class CustomerRegisterError extends CustomerRegisterState {
  final String message;

  const CustomerRegisterError(this.message);

  @override
  List<Object?> get props => [message];
}
