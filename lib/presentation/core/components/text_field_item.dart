import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/assets_manager.dart';
import '../utils/colors_manager.dart';

class TextFieldItem extends StatelessWidget {
  const TextFieldItem({
    super.key,
    required this.searchController,
    required this.hintText,
  });
  final TextEditingController searchController;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: ColorsManager.white,
        ),
        fillColor: ColorsManager.mainGrey,
        filled: true,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorsManager.mainGrey)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            AssetsManager.searchIc,
            height: 24.w,
            width: 24.w,
          ),
        ),
      ),
    );
  }
}
