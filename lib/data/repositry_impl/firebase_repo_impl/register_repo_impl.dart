import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/firebase_data_source/register_data_source.dart';
import 'package:movies_app/data/models/user/user_dto.dart';
import 'package:movies_app/domain/entities/user.dart';
import 'package:movies_app/domain/repositry_contract/firebase_repo/register_repo.dart';
import 'package:movies_app/domain/result.dart';

@Injectable(as: RegisterRepo)
class RegisterRepoImpl extends RegisterRepo {
  RegisterDataSource authDataSource;

  @factoryMethod
  RegisterRepoImpl({required this.authDataSource});

  @override
  Future<Result<UserEntity>> createAccountWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
  }) async {
    Result<UserDto> result =
        await authDataSource.createUserWithEmailAndPassword(
      email: email,
      name: name,
      password: password,
      phoneNumber: phoneNumber,
    );
    switch (result) {
      case Success<UserDto>():
        UserEntity user = result.data.toUser();
        return Success(data: user);
      case ServerError<UserDto>():
        return ServerError(
          success: result.success,
          statusCode: result.statusCode,
          statusMessage: result.statusMessage,
        );
      case Error<UserDto>():
        return Error(exception: result.exception);
    }
  }
}
