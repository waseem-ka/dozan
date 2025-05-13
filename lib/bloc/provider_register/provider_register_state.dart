import 'package:equatable/equatable.dart';

abstract class ProviderRegisterState extends Equatable {
  const ProviderRegisterState();

  @override
  List<Object?> get props => [];
}

class ProviderRegisterInitial extends ProviderRegisterState {}

class ProviderRegisterLoading extends ProviderRegisterState {}

class ProviderRegisterLoaded extends ProviderRegisterState {}

class ProviderRegisterError extends ProviderRegisterState {
  final String message;

  const ProviderRegisterError(this.message);

  @override
  List<Object?> get props => [message];
}
