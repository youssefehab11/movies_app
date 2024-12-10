import 'package:flutter/material.dart';
import 'package:movies_app/presentation/core/components/movies_grid.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';

import '../../../../../core/components/text_field_item.dart';
import '../../../../../core/utils/assets_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();

  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          TextFieldItem(
            hintText: StringsManager.searchText,
            searchController: searchController,
          ),
          isEmpty
              ? Column(
                  children: [
                    SizedBox(
                      height: 280.h,
                    ),
                    const Image(image: AssetImage(AssetsManager.empty1))
                  ],
                )
              : const Expanded(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: MoviesDefaultGrid(
                          crossAxisCount: 2,
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
