import 'package:movies_app/domain/result.dart';

abstract class LogoutDataSource {
  Future<Result<String>> signOut();
}
