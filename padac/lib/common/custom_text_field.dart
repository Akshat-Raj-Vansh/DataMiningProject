import 'package:flutter/material.dart';
import 'package:padac/utils/constants.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final Color color;
  final Icon icon;
  final double width;
  final TextInputType keyboardType;
  final bool obscureText;
  final Color backgroundColor;
  final String initialValue;
  final TextAlign textAlign;
  final TextInputAction textInputAction;
  final Function(String? value)? onChanged;
  final String? Function(String? value)? validator;
  final Function(String? value)? onSubmitted;

  const CustomTextFormField({
    Key? key,
    required this.hint,
    required this.color,
    required this.icon,
    required this.width,
    required this.keyboardType,
    required this.obscureText,
    required this.backgroundColor,
    required this.textInputAction,
    required this.onChanged,
    required this.initialValue,
    required this.textAlign,
    required this.validator,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        textInputAction: textInputAction,
        validator: validator,
        onFieldSubmitted: onSubmitted,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        initialValue: initialValue,
        textAlign: textAlign,
        cursorColor: color,
        style: Theme.of(context)
            .textTheme
            .overline
            ?.copyWith(color: color, fontSize: 12.sp),
        decoration: InputDecoration(
          labelText: hint,
          errorStyle: Theme.of(context)
              .textTheme
              .overline
              ?.copyWith(color: color, fontSize: 8.sp),
          icon: icon,
          // hintText: hint,
          // hintStyle: TextStyle(color: color, fontSize :12.sp),
          labelStyle: Theme.of(context)
              .textTheme
              .overline
              ?.copyWith(color: color, fontSize: 12.sp),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
        ),
      ),
    );
  }
}
