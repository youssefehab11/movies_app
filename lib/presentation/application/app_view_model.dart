import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/use_cases/auth/get_cached_user.dart';
import 'package:movies_app/domain/use_cases/shared_preferences/get_onboarding_bool.dart';
import 'package:movies_app/domain/use_cases/shared_preferences/save_onboarding_bool.dart';
import 'package:movies_app/presentation/application/app_state.dart';
import 'package:movies_app/presentation/core/router/routes.dart';

@injectable
class AppViewModel extends Cubit<AppState> {
  User? firebaseUser;
  bool? isOnboarding;
  GetCachedFirebaseUserUseCase getCachedFirebaseUserUseCase;
  SaveOnboardingBoolUseCase saveOnboardingBoolUseCase;
  GetOnboardingBoolUseCase getOnboardingBoolUseCase;

  @factoryMethod
  AppViewModel({
    required this.getCachedFirebaseUserUseCase,
    required this.getOnboardingBoolUseCase,
    required this.saveOnboardingBoolUseCase,
  }) : super(AppInitialState()) {
    firebaseUser = getCachedFirebaseUserUseCase.execute();
    isOnboarding = getOnboardingBoolUseCase.execute('isOnboarding');
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

  void saveOnboardingToSharedPref(String key, bool value) {
    saveOnboardingBoolUseCase.execute(key, value);
  }
}
