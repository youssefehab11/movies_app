import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/firebase_data_source/auth/login_data_source.dart';
import 'package:movies_app/data/models/user/user_dto.dart';
import 'package:movies_app/domain/entities/user.dart';
import 'package:movies_app/domain/repositry_contract/firebase_repo/auth/login_repo.dart';
import 'package:movies_app/domain/result.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl extends LoginRepo {
  LoginDataSource loginDataSource;

  @factoryMethod
  LoginRepoImpl({required this.loginDataSource});

  @override
  Future<Result<UserEntity?>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    Result<UserDto?> result = await loginDataSource.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    switch (result) {
      case Success<UserDto?>():
        UserEntity? userEntity = result.data?.toUser();
        return Success(data: userEntity);
      case ServerError<UserDto?>():
        return ServerError(success: false, statusMessage: result.statusMessage);
      case Error<UserDto?>():
        return Error(exception: result.exception);
    }
  }
}
