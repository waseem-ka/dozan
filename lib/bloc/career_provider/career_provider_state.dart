part of 'career_provider_cubit.dart';

class ProviderRegisterState extends Equatable {
  final String? selectedCareer;
  final List<String> selectedSkills;

  const ProviderRegisterState({
    this.selectedCareer,
    this.selectedSkills = const [],
  });

  @override
  List<Object?> get props => [selectedCareer, selectedSkills];

  ProviderRegisterState copyWith({
    String? selectedCareer,
    List<String>? selectedSkills,
  }) {
    return ProviderRegisterState(
      selectedCareer: selectedCareer ?? this.selectedCareer,
      selectedSkills: selectedSkills ?? this.selectedSkills,
    );
  }
}

class RegisterSuccessState extends ProviderRegisterState {
  final String
  message; // يمكنك إضافة رسالة أو معلومات إضافية إذا كنت بحاجة إليها.

  const RegisterSuccessState({required this.message});

  @override
  List<Object?> get props => [message];
}

class RegisterErrorState extends ProviderRegisterState {
  final String errorMessage; // رسالة الخطأ التي سيتم عرضها

  const RegisterErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
