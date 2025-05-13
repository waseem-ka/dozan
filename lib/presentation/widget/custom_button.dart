import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(342.w, 40.h),
        backgroundColor: const Color.fromRGBO(242, 188, 37, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.r)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.sp,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
