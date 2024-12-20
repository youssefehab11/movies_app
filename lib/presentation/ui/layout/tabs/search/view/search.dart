import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/di/di.dart';
import 'package:movies_app/domain/end_points.dart';
import 'package:movies_app/presentation/core/utils/helper_functions.dart';
import 'package:movies_app/presentation/ui/layout/tabs/search/view_model/search_view_model.dart';
import 'package:movies_app/presentation/ui/layout/tabs/search/widgets/search_box.dart';
import 'package:movies_app/presentation/ui/layout/tabs/search/widgets/search_content.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController searchController;
  late SearchViewModel viewModel;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    viewModel = getIt<SearchViewModel>();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        viewModel.searchMovies(
          endPoint: EndPoints.searchMovies,
          queryParameters: {
            'query': searchController.text,
            'page': ++viewModel.page,
          },
          input: searchController.text,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.removeListener(() {});
    searchController.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => clearFocus(),
      child: Column(
        children: [
          SearchBox(
            onChanged: onChange,
            searchController: searchController,
          ),
          const SizedBox(height: 4),
          BlocProvider(
            create: (context) => viewModel,
            child: Expanded(
                child: SearchContent(
              movies: viewModel.movies,
              scrollController: scrollController,
            )),
          ),
          const SafeArea(
            top: false,
            child: SizedBox.shrink(),
          )
        ],
      ),
    );
  }

  onChange(String input) {
    viewModel.page = 1;
    viewModel.movies.clear();
    viewModel.searchMovies(
      endPoint: EndPoints.searchMovies,
      queryParameters: {'query': input},
      input: input,
    );
  }
}
