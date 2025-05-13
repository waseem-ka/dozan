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
