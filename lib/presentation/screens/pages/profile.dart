import 'package:dozan/bloc/login/login_bloc.dart';
import 'package:dozan/presentation/screens/auth/login_screen.dart';
import 'package:dozan/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
          text: "Logout",
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('isLoggedIn', false);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder:
                    (context) => BlocProvider(
                      create: (_) => LoginBloc(),
                      child: LoginScreen(),
                    ),
              ),
              (route) => false,
            );
          },
        ),
      ),
    );
  }
}
