import 'package:flutter/material.dart';
import 'package:movies_app/presentation/core/components/app_text_field.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';

class SearchBox extends StatelessWidget {
  final void Function(String) onChanged;
  final TextEditingController searchController;
  const SearchBox(
      {super.key, required this.onChanged, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: AppTextField(
          controller: searchController,
          hintText: StringsManager.search,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          prefixSvg: AssetsManager.searchIc,
          onChanged: (input) => onChanged(input),
        ),
      ),
    );
  }
}
