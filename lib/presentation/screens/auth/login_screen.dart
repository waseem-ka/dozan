import 'package:dozan/bloc/register_type/register_type_bloc.dart';
import 'package:dozan/presentation/routes/app_routes.dart';
import 'package:dozan/presentation/screens/auth/register_type.dart';
import 'package:dozan/presentation/screens/navigation/main_navigation_screen.dart';
import 'package:dozan/presentation/widget/custom_button.dart';
import 'package:dozan/presentation/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dozan/bloc/login/login_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dozan/Utils/paths.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              print("isLoading");
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => Center(child: SpinningImageLoader()),
              );
            } else if (state is LoginSuccess) {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => MainNavigationScreen()),
              );
            } else if (state is LoginError) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder:
              (context, state) => SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(right: 25, left: 25),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80.0, bottom: 55),
                        child: Image.asset(
                          Paths().loginImage,
                          width: 251.w,
                          height: 196.h,
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.sp,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Please sign in to continue",
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
                        child: SizedBox(
                          width: 342.w,
                          height: 43.h,
                          child: TextField(
                            controller: _emailController,
                            cursorColor: Color.fromRGBO(242, 188, 37, 0.4),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(246, 246, 246, 1),
                                ),
                              ),
                              filled: true,
                              hoverColor: Color.fromRGBO(246, 246, 246, 1),
                              fillColor: const Color.fromRGBO(246, 246, 246, 1),
                              labelText: 'Username',
                              prefixIcon: Container(
                                margin: EdgeInsets.all(5),
                                width: 20.w,
                                height: 20.h,
                                child: SvgPicture.asset(
                                  'assets/icons/user1.svg',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 342.w,
                        height: 43.h,
                        child: TextField(
                          controller: _passwordController,
                          cursorColor: Color.fromRGBO(242, 188, 37, 0.4),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(246, 246, 246, 1),
                              ),
                            ),
                            filled: true,
                            hoverColor: Color.fromRGBO(246, 246, 246, 1),
                            fillColor: const Color.fromRGBO(246, 246, 246, 1),
                            labelText: 'Password',
                            prefixIcon: Container(
                              margin: EdgeInsets.all(5),
                              width: 24.w,
                              height: 24.h,
                              child: SvgPicture.asset(
                                'assets/icons/password.svg',
                              ),
                            ),
                          ),
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
                            "Remember me",
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
                        padding: const EdgeInsets.only(top: 40.0),
                        child: CustomButton(
                          text: "Login",
                          onPressed: () {
                            context.read<LoginBloc>().add(
                              LoginSubmitted(
                                email: _emailController.text.trim(),
                                password: _passwordController.text,
                              ),
                            );
                          },
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => BlocProvider(
                                    create: (_) => RegisterTypeBloc(),
                                    child: RegisterType(),
                                  ),
                            ),
                          );
                        },
                        child: Text(
                          "Don't have account?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
