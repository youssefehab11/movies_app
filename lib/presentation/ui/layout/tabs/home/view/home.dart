import 'package:flutter/material.dart';
import 'package:movies_app/presentation/core/components/horizontal_movies_list.dart';
import 'package:movies_app/presentation/core/components/row_title_component.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/widgets/popular_movies.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          PopularMovies(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: RowTitleComponent(
              title: 'New Releases',
            ),
          ),
          HorizontalMoviesList(),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: RowTitleComponent(
              title: 'Top Rated',
            ),
          ),
          HorizontalMoviesList(),
        ],
      ),
    );
  }
}
