import 'package:dozan/Utils/paths.dart';
import 'package:dozan/bloc/customer_register/customer_register_bloc.dart';
import 'package:dozan/bloc/provider_register/provider_register_bloc.dart';
import 'package:dozan/bloc/register_type/register_type_bloc.dart';
import 'package:dozan/presentation/screens/auth/register_screen_customer.dart';
import 'package:dozan/presentation/screens/auth/register_screen_provider.dart';
import 'package:dozan/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterType extends StatelessWidget {
  const RegisterType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterTypeBloc(),
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
                child: SvgPicture.asset(Paths().arrowLeft),
              ),
            ),
          ),
        ),
        body: BlocConsumer<RegisterTypeBloc, RegisterTypeState>(
          listener: (context, state) {
            if (state.selectedType == 'Customer') {
              print("Costumer Type selected");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => BlocProvider(
                        create: (_) => CustomerRegisterBloc(),
                        child: RegisterCustomer(),
                      ),
                ),
              );
            } else if (state.selectedType == 'Provider') {
              print("Provider Type Selected");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => BlocProvider(
                        create: (_) => ProviderRegisterBloc(),
                        child: RegisterProvider(),
                      ),
                ),
              );
            }
          },
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25, top: 70),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Image.asset(
                        Paths().registerTypeImage,
                        width: 270.w,
                        height: 300.h,
                      ),
                    ),
                    Text(
                      "Account Type",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Cairo',
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Choose your role",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Cairo',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: CustomButton(
                        text: "Customer",
                        onPressed: () {
                          context.read<RegisterTypeBloc>().add(
                            RegisterTypeSelected('Customer'),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: CustomButton(
                        text: "Provider",
                        onPressed: () {
                          context.read<RegisterTypeBloc>().add(
                            RegisterTypeSelected('Provider'),
                          );
                        },
                      ),
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
