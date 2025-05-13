import 'package:dozan/Utils/strings.dart';
import 'package:dozan/bloc/customer_register/customer_register_bloc.dart';
import 'package:dozan/bloc/login/login_bloc.dart';
import 'package:dozan/bloc/provider_register/provider_register_bloc.dart';
import 'package:dozan/bloc/provider_register/provider_register_event.dart';
import 'package:dozan/bloc/provider_register/provider_register_state.dart';
import 'package:dozan/presentation/screens/auth/login_screen.dart';
import 'package:dozan/presentation/screens/auth/provider_career.dart';
import 'package:dozan/presentation/widget/custom_button.dart';
import 'package:dozan/presentation/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RegisterProvider extends StatelessWidget {
  RegisterProvider({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: BlocConsumer<ProviderRegisterBloc, ProviderRegisterState>(
          listener: (context, state) {
            if (state is ProviderRegisterLoaded) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('تم التسجيل بنجاح!')));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => BlocProvider(
                        create: (_) => CustomerRegisterBloc(),
                        child: ProviderRegisterPage(),
                      ),
                ),
              );
            } else if (state is ProviderRegisterError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Customer registration ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.sp,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Please register to login.",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: CustomTextField(
                        controller: firstNameController,
                        labelText: 'First name',
                        iconPath: 'assets/icons/user2.svg',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: CustomTextField(
                        controller: lastNameController,
                        labelText: 'Last name',
                        iconPath: 'assets/icons/user2.svg',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: CustomTextField(
                        controller: userNameController,
                        labelText: 'User name',
                        iconPath: 'assets/icons/user1.svg',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: CustomTextField(
                        controller: phoneNumberController,
                        labelText: 'Phone Number',
                        iconPath: 'assets/icons/call.svg',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: CustomTextField(
                        controller: birthDateController,
                        labelText: 'Birth date',
                        iconPath: 'assets/icons/birtDate.svg',
                        secure: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: CustomTextField(
                        controller: passwordController,
                        labelText: 'Enter Password',
                        iconPath: 'assets/icons/password.svg',
                        secure: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: CustomTextField(
                        controller: rePasswordController,
                        labelText: 'Re-enter Password',
                        iconPath: 'assets/icons/password.svg',
                        secure: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: CustomTextField(
                        controller: locationController,
                        labelText: 'Address Title',
                        iconPath: 'assets/icons/location.svg',
                        secure: false,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          activeColor: Color.fromRGBO(143, 106, 1, 1),
                          value: (true),
                          onChanged: (value) {},
                        ),
                        Text(
                          "I agree to terms of use",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: CustomButton(
                        text: "Register",
                        onPressed: () {
                          if (firstNameController.text.isEmpty ||
                              lastNameController.text.isEmpty ||
                              userNameController.text.isEmpty ||
                              phoneNumberController.text.isEmpty ||
                              birthDateController.text.isEmpty ||
                              passwordController.text.isEmpty ||
                              rePasswordController.text.isEmpty ||
                              locationController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: CustomColor.darkYallow,
                                content: Text(
                                  'Please fill in all the fields.',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            );
                            return;
                          }

                          // كلمات السر غير متطابقة
                          if (passwordController.text !=
                              rePasswordController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Passwords do not match.'),
                              ),
                            );
                            return;
                          }

                          BlocProvider.of<ProviderRegisterBloc>(context).add(
                            SubmitProviderRegister(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              userName: userNameController.text,
                              phoneNumber: phoneNumberController.text,
                              birthDate:
                                  DateTime.tryParse(birthDateController.text) ??
                                  DateTime(2000),
                              password: passwordController.text,
                              reEnterPassword: rePasswordController.text,
                              address: locationController.text,
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Registered already?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => BlocProvider(
                                      create: (_) => LoginBloc(),
                                      child: LoginScreen(),
                                    ),
                              ),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Color(0xFFE6AA00),
                              fontSize: 12.sp,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
