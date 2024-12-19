import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/firebase_data_source/firestore/wish_list_data_source.dart';
import 'package:movies_app/data/services/firebase/firestore_service.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';

@Injectable(as: WishListDataSource)
class WishListDataSourceImpl extends WishListDataSource {
  FireStoreServies fireStoreServies;

  @factoryMethod
  WishListDataSourceImpl({required this.fireStoreServies});

  @override
  Future<Result<String>> saveMovieToWishList(Movie movie) {
    return fireStoreServies.saveMovieToWishList(movie);
  }

  @override
  Future<Result<bool>> isMovieInWishList(int movieId) {
    return fireStoreServies.isMovieInWishList(movieId);
  }

  @override
  Future<Result<String>> removeFromWishList(Movie movie) {
    return fireStoreServies.removeMovieFromWishList(movie);
  }

  @override
  Future<Result<List<Movie>>> getWishList() {
    return fireStoreServies.getWishList();
  }
}
