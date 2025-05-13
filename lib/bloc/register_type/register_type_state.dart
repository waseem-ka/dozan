part of 'register_type_bloc.dart';

class RegisterTypeState {
  final String selectedType;

  RegisterTypeState({required this.selectedType});

  RegisterTypeState copyWith({String? selectedType}) {
    return RegisterTypeState(selectedType: selectedType ?? this.selectedType);
  }
}
