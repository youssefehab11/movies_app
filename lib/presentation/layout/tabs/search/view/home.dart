import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/strings_manager.dart';

import '../../../../../core/components/movie_cover.dart';
import '../../../../../core/components/text_field_item.dart';
import '../../../../../core/utils/assets_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatefulWidget {
  Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();

  @override
  bool isEmpty = true;

  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 25),
        child: Column(
          children: [
            TextFieldItem(text: StringsManager.searchText,searchController: searchController),

            isEmpty?
                Column(
                  children: [
                    SizedBox(height: 280.h,),
                    Image(image: AssetImage(AssetsManager.empty1))
                  ],
                )

                :Expanded(
              child: Container(
                child: Column(
                 // mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: GridView.builder(

                        padding: EdgeInsets.zero,
                        itemCount: 20,

                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 5 / 7), itemBuilder: (context, index) => MovieCover(),)
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}
