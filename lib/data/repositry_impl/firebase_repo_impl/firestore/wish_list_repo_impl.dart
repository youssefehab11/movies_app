import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/firebase_data_source/firestore/wish_list_data_source.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repositry_contract/firebase_repo/firestore/wish_list_repo.dart';
import 'package:movies_app/domain/result.dart';

@Injectable(as: WishListRepo)
class WishListRepoImpl extends WishListRepo {
  WishListDataSource wishListDataSource;

  @factoryMethod
  WishListRepoImpl({required this.wishListDataSource});

  @override
  Future<Result<String>> saveMovieToWishList(Movie movie) {
    return wishListDataSource.saveMovieToWishList(movie);
  }

  @override
  Future<Result<bool>> isMovieInWishList(int movieId) {
    return wishListDataSource.isMovieInWishList(movieId);
  }

  @override
  Future<Result<String>> removeMovieToWishList(Movie movie) {
    return wishListDataSource.removeFromWishList(movie);
  }

  @override
  Future<Result<List<Movie>>> getWishList() {
    return wishListDataSource.getWishList();
  }
}
