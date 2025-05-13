import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'career_provider_state.dart';

class ProviderRegisterCubit extends Cubit<ProviderRegisterState> {
  ProviderRegisterCubit() : super(ProviderRegisterState());

  void selectCareer(String career) {
    emit(state.copyWith(selectedCareer: career));
  }

  void toggleSkill(String skill) {
    final updatedSkills = [...state.selectedSkills];
    if (updatedSkills.contains(skill)) {
      updatedSkills.remove(skill);
    } else {
      updatedSkills.add(skill);
    }
    emit(state.copyWith(selectedSkills: updatedSkills));
  }

  void register() {
    try {
      // حاول تنفيذ عملية التسجيل هنا (مثل إرسال البيانات إلى السيرفر)
      debugPrint("Career: ${state.selectedCareer}");
      debugPrint("Skills: ${state.selectedSkills}");

      // إذا كانت العملية ناجحة:
      emit(RegisterSuccessState(message: 'Registration successful.'));
    } catch (e) {
      // إذا حدث خطأ:
      emit(RegisterErrorState(errorMessage: 'Registration failed: $e'));
    }
  }
}
