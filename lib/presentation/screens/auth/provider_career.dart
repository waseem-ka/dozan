import 'package:dozan/Utils/strings.dart';
import 'package:dozan/bloc/career_provider/career_provider_cubit.dart';
import 'package:dozan/presentation/screens/auth/otp.dart';
import 'package:dozan/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProviderRegisterPage extends StatelessWidget {
  final List<String> careers = ['Joiner', 'Painter', 'Plumber'];
  final List<String> skills = [
    'Furniture carpenter',
    'Door carpenter',
    'Interior carpenter',
    'Commercial carpenter',
    'kitchen carpenter',
    'Maintenance carpenter',
    'Commercial carpenter',
    'Interior carpenter',
  ];

  ProviderRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProviderRegisterCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop(); // Go back
              },
              child: Container(
                margin: EdgeInsets.all(5),
                width: 24.w,
                height: 24.h,
                child: SvgPicture.asset("assets/icons/arrow-left.svg"),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: BlocConsumer<ProviderRegisterCubit, ProviderRegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccessState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OtpPage()),
                );
              } else if (state is RegisterErrorState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            builder: (context, state) {
              final cubit = context.read<ProviderRegisterCubit>();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Provider registration ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  Text(
                    'Please choose your career',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  DropdownButton<String>(
                    icon: SvgPicture.asset("assets/icons/arrow-right.svg"),
                    value: state.selectedCareer,
                    hint: Text('Select career'),
                    isExpanded: true,
                    onChanged: (value) {
                      if (value != null) {
                        cubit.selectCareer(value);
                      }
                    },
                    items:
                        careers.map((career) {
                          return DropdownMenuItem(
                            value: career,
                            child: Text(career),
                          );
                        }).toList(),
                  ),
                  const SizedBox(height: 20),
                  Text('Select what you are proficient in.'),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 3.0,
                    children:
                        skills.map((skill) {
                          final selected = state.selectedSkills.contains(skill);
                          return ChoiceChip(
                            label: Text(skill),
                            selected: selected,
                            onSelected: (_) => cubit.toggleSkill(skill),
                            selectedColor: Colors.amber,
                            backgroundColor: Colors.white,
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight:
                                  selected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                            shape: StadiumBorder(
                              side: BorderSide(
                                color: CustomColor.darkYallow,
                                width: 1.0,
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 90.0),
                    child: CustomButton(
                      text: 'Register',
                      onPressed: () {
                        if (state.selectedCareer == null ||
                            state.selectedSkills.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Please select a career and at least one skill.",
                              ),
                            ),
                          );
                        } else {
                          cubit.register();
                        }
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
