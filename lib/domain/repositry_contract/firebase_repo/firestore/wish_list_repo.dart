import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';

abstract class WishListRepo {
  Future<Result<String>> saveMovieToWishList(Movie movie);
  Future<Result<bool>> isMovieInWishList(int movieId);
  Future<Result<String>> removeMovieToWishList(Movie movie);
}
