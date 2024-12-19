import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/use_cases/auth/get_cached_user.dart';
import 'package:movies_app/presentation/application/app_state.dart';
import 'package:movies_app/presentation/core/router/routes.dart';

@injectable
class AppViewModel extends Cubit<AppState> {
  User? firebaseUser;
  //UserEntity? appUser;
  GetCachedFirebaseUserUseCase getCachedFirebaseUserUseCase;

  @factoryMethod
  AppViewModel({required this.getCachedFirebaseUserUseCase})
      : super(AppInitialState()) {
    firebaseUser = getCachedFirebaseUserUseCase.execute();
  }

  String checkAutoLogin() {
    if (firebaseUser != null) {
      return Routes.home;
    }
    return Routes.login;
  }

  void clearUser() {
    firebaseUser = null;
    //appUser = null;
  }
}
