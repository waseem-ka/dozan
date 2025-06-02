import 'package:dozan/Utils/paths.dart';
import 'package:dozan/bloc/customer_register/customer_register_bloc.dart';
import 'package:dozan/bloc/customer_register/customer_register_event.dart';
import 'package:dozan/bloc/customer_register/customer_register_state.dart';
import 'package:dozan/bloc/login/login_bloc.dart';
import 'package:dozan/presentation/screens/auth/login_screen.dart';
import 'package:dozan/presentation/screens/auth/otp.dart';
import 'package:dozan/presentation/widget/custom_button.dart';
import 'package:dozan/presentation/widget/custom_text_field.dart';
import 'package:dozan/presentation/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RegisterCustomer extends StatefulWidget {
  const RegisterCustomer({super.key});

  @override
  State<RegisterCustomer> createState() => _RegisterCustomerState();
}

class _RegisterCustomerState extends State<RegisterCustomer> {
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController birthDateController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CustomerRegisterBloc(),
      child: BlocConsumer<CustomerRegisterBloc, CustomerRegisterState>(
        listener: (context, state) {
          if (state is CustomerRegisterLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => Center(child: SpinningImageLoader()),
            );
          } else if (state is CustomerRegisterLoaded) {
            Navigator.pop(context); // remove loading
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => OtpPage()),
            );
          } else if (state is CustomerRegisterError) {
            Navigator.pop(context); // remove loading
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
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
                    child: SvgPicture.asset(Paths().arrowLeft),
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Center(
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
                            iconPath: Paths().user2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: CustomTextField(
                            controller: lastNameController,
                            labelText: 'Last name',
                            iconPath: Paths().user2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: CustomTextField(
                            controller: userNameController,
                            labelText: 'User name',
                            iconPath: Paths().user1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: CustomTextField(
                            controller: birthDateController,
                            labelText: 'Birth date',
                            iconPath: Paths().birtDate,
                            secure: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: CustomTextField(
                            controller: passwordController,
                            labelText: 'Enter Password',
                            iconPath: Paths().password,
                            secure: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: CustomTextField(
                            controller: rePasswordController,
                            labelText: 'Re-enter Password',
                            iconPath: Paths().password,
                            secure: true,
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
                              final bloc = context.read<CustomerRegisterBloc>();

                              bloc.add(
                                SubmitCustomerRegister(
                                  firstName: firstNameController.text.trim(),
                                  lastName: lastNameController.text.trim(),
                                  userName: userNameController.text.trim(),
                                  phoneNumber:
                                      phoneNumberController.text.trim(),
                                  birthDate:
                                      DateTime.tryParse(
                                        birthDateController.text.trim(),
                                      ) ??
                                      DateTime.now(),
                                  password: passwordController.text,
                                  reEnterPassword: rePasswordController.text,
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
