import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repositry_contract/firebase_repo/firestore/wish_list_repo.dart';
import 'package:movies_app/domain/result.dart';

@injectable
class CheckMovieInWishListUseCase {
  WishListRepo wishListRepo;

  @factoryMethod
  CheckMovieInWishListUseCase({required this.wishListRepo});

  Future<Result<bool>> execute(int movieId) {
    return wishListRepo.isMovieInWishList(movieId);
  }
}
