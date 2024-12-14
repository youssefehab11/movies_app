import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';

typedef Validator = String? Function(String?)?;

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Validator validator;
  final VoidCallback? onSuffixIconPressed;
  final String? prefixSvg;
  final IconData? suffixIcon;
  final bool isObsecure;
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    this.onSuffixIconPressed,
    this.isObsecure = false,
    this.prefixSvg,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: const TextStyle(color: ColorsManager.white),
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: ColorsManager.greyText,
        ),
        fillColor: ColorsManager.mainGrey,
        filled: true,
        focusedBorder: TextFieldBorder(borderColor: ColorsManager.white),
        border: TextFieldBorder(borderColor: ColorsManager.mainGrey),
        errorBorder: TextFieldBorder(borderColor: ColorsManager.red),
        prefixIcon: prefixSvg != null
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  prefixSvg!,
                  height: 24.w,
                  width: 24.w,
                ),
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () => onSuffixIconPressed?.call(),
                  child: Icon(
                    suffixIcon,
                    size: 24,
                    color: ColorsManager.white,
                  ),
                ),
              )
            : null,
      ),
      obscureText: isObsecure,
    );
  }
}

class TextFieldBorder extends OutlineInputBorder {
  TextFieldBorder({required Color borderColor})
      : super(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: borderColor,
          ),
        );
}
