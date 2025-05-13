import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String iconPath;
  final bool secure;
  final Function(String)? onChanged;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.iconPath,
    this.secure = false,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.secure;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 342.w,
      height: 43.h,
      child: TextField(
        controller: widget.controller,
        obscureText: widget.secure ? _obscureText : false,
        cursorColor: const Color.fromRGBO(242, 188, 37, 0.4),
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(246, 246, 246, 1)),
          ),
          filled: true,
          hoverColor: const Color.fromRGBO(246, 246, 246, 1),
          fillColor: const Color.fromRGBO(246, 246, 246, 1),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: Color.fromRGBO(230, 170, 0, 1),
            fontFamily: 'Cairo',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Container(
            margin: EdgeInsets.all(5),
            width: 20.w,
            height: 20.h,
            child: SvgPicture.asset(widget.iconPath),
          ),
          suffixIcon:
              widget.secure
                  ? GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: 20.w,
                      height: 20.h,
                      child: SvgPicture.asset("assets/icons/eye-slash.svg"),
                    ),
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                  : null,
        ),
      ),
    );
  }
}
