import 'package:movies_app/domain/result.dart';

abstract class LogoutRepo {
  Future<Result<String>> signOut();
}
