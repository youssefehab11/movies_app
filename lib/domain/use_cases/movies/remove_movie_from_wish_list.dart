import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repositry_contract/firebase_repo/firestore/wish_list_repo.dart';
import 'package:movies_app/domain/result.dart';

@injectable
class RemoveMovieFromWishListUseCase {
  WishListRepo wishListRepo;

  @factoryMethod
  RemoveMovieFromWishListUseCase({required this.wishListRepo});

  Future<Result<String>> execute(Movie movie) {
    return wishListRepo.removeMovieToWishList(movie);
  }
}
