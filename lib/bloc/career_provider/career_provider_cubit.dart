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
    // قم هنا بإرسال البيانات للسيرفر أو إجراء عملية التسجيل
    debugPrint("Career: ${state.selectedCareer}");
    debugPrint("Skills: ${state.selectedSkills}");
  }
}
