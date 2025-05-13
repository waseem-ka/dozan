import 'package:dozan/Utils/strings.dart';
import 'package:dozan/bloc/otp/otp_cubit.dart';
import 'package:dozan/bloc/otp/otp_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    final defaultTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: CostumColor.darkYallow, width: 2),
        ),
      ),
    );

    final focusedTheme = defaultTheme.copyWith(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: CostumColor.yallow, width: 3)),
      ),
    );
    return BlocProvider(
      create: (_) => OtpCubit(),
      child: BlocConsumer<OtpCubit, OtpState>(
        listener: (context, state) {
          if (state is OtpVerified) {
            Navigator.pushReplacementNamed(context, '/home'); // أو أي اسم صفحة
          } else if (state is OtpError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final cubit = context.read<OtpCubit>();

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
            body: Padding(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      padding: EdgeInsets.only(top: 5),
                      width: 204.w,
                      height: 213.h,
                      child: Image.asset('assets/images/OTP.png'),
                    ),
                  ),
                  Text(
                    "OTP Verification",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "We will send you one-time password to",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "to your mobile number",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Pinput(
                    controller: cubit.otpController,
                    length: 4,
                    defaultPinTheme: defaultTheme,
                    focusedPinTheme: focusedTheme,
                    showCursor: true,
                    cursor: Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: 42,
                      height: 0.5.h,
                      color: CostumColor.yallow,
                    ),
                    onCompleted: (pin) {
                      debugPrint('Entered OTP: $pin');
                      cubit.onOtpChanged(pin);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn’t you receive the OTP?",
                          style: TextStyle(
                            color: CostumColor.grey,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Resend OTP",
                            style: TextStyle(
                              color: CostumColor.yallow,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(342.w, 40.h),
                        backgroundColor:
                            cubit.otpController.text.length == 4
                                ? const Color.fromRGBO(242, 188, 37, 1)
                                : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.r),
                        ),
                      ),
                      child: Text(
                        "Verify",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
