import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/firebase_data_source/auth/logout_data_source.dart';
import 'package:movies_app/data/services/firebase/auth_services.dart';
import 'package:movies_app/domain/result.dart';

@Injectable(as: LogoutDataSource)
class LogoutDataSourceImpl extends LogoutDataSource {
  AuthServices authServices;

  LogoutDataSourceImpl({required this.authServices});
  @override
  Future<Result<String>> signOut() {
    return authServices.signOut();
  }
}
