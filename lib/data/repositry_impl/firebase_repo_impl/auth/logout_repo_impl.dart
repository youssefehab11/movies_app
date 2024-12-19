import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/firebase_data_source/auth/logout_data_source.dart';
import 'package:movies_app/domain/repositry_contract/firebase_repo/auth/logout_repo.dart';
import 'package:movies_app/domain/result.dart';

@Injectable(as: LogoutRepo)
class LogoutRepoImpl extends LogoutRepo {
  LogoutDataSource logoutDataSource;

  @factoryMethod
  LogoutRepoImpl({required this.logoutDataSource});

  @override
  Future<Result<String>> signOut() {
    return logoutDataSource.signOut();
  }
}
