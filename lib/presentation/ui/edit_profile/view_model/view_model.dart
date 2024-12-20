import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/use_cases/auth/edit_profile.dart';
import 'package:movies_app/presentation/ui/edit_profile/view_model/edit_profile_state.dart';

@injectable
class EditProfileViewModel extends Cubit<EditProfileState> {
  EditProfileUseCase editProfileUseCase;

  @factoryMethod
  EditProfileViewModel({
    required this.editProfileUseCase,
  }) : super(EditProfileInitialState());

  void editProfile(String newName, String newPhone) async {
    emit(EditProfileLoadingState());
    Result<String> result = await editProfileUseCase.execute(newName, newPhone);

    switch (result) {
      case Success<String>():
        emit(EditProfileSuccessState(message: result.data));
      case ServerError<String>():
        emit(EditProfileErrorState(serverError: result));
      case Error<String>():
        emit(EditProfileErrorState(error: result));
    }
  }
}
