part of 'register_type_bloc.dart';

abstract class RegisterTypeEvent {}

class RegisterTypeSelected extends RegisterTypeEvent {
  final String selectedType; // 'Customer' or 'Provider'

  RegisterTypeSelected(this.selectedType);
}
