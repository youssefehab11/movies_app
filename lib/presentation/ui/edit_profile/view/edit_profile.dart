import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app/di/di.dart';
import 'package:movies_app/domain/entities/user.dart';
import 'package:movies_app/presentation/core/components/app_button.dart';
import 'package:movies_app/presentation/core/components/app_text_field.dart';
import 'package:movies_app/presentation/core/components/default_app_bar.dart';
import 'package:movies_app/presentation/core/utils/app_dialogs.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/helper_functions.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/core/utils/validator.dart';
import 'package:movies_app/presentation/ui/edit_profile/view_model/edit_profile_state.dart';
import 'package:movies_app/presentation/ui/edit_profile/view_model/view_model.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/view_model/profile_view_model.dart';

class EditProfile extends StatefulWidget {
  final ProfileViewModel profileViewModel;
  const EditProfile({
    super.key,
    required this.profileViewModel,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late EditProfileViewModel editProfileViewModel;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    editProfileViewModel = getIt<EditProfileViewModel>();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    nameController.text = widget.profileViewModel.user?.name ?? '';
    phoneController.text = widget.profileViewModel.user?.phoneNumber ?? '';
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.profileViewModel),
        BlocProvider(
          create: (context) => editProfileViewModel,
        )
      ],
      child: BlocListener<EditProfileViewModel, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileLoadingState) {
            AppDialogs.showLoadingDialog(context);
          }
          if (state is EditProfileErrorState) {
            AppDialogs.hideLoading(context);
            Fluttertoast.showToast(
              msg: extractErrorMessage(state.serverError, state.error),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: ColorsManager.mainGrey.withOpacity(1),
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
          if (state is EditProfileSuccessState) {
            AppDialogs.hideLoading(context);
            Fluttertoast.showToast(
              msg: state.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: ColorsManager.mainGrey.withOpacity(1),
              textColor: Colors.white,
              fontSize: 16.0,
            );
            widget.profileViewModel.refreshProfile();
            Navigator.of(context).pop();
          }
        },
        child: GestureDetector(
          onTap: () => clearFocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: const DefaultAppBar(title: StringsManager.editProfile),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 35.h),
                            CircleAvatar(
                              radius: 60,
                              child:
                                  Image.asset('assets/images/profile_test.png'),
                            ),
                            SizedBox(height: 35.h),
                            AppTextField(
                              controller: nameController,
                              hintText: StringsManager.name,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              prefixSvg: AssetsManager.nameIc,
                              validator: (input) =>
                                  NameValidator(fieldName: StringsManager.name)
                                      .validate(input),
                            ),
                            const SizedBox(height: 16.0),
                            AppTextField(
                              controller: phoneController,
                              hintText: StringsManager.phone,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              prefixSvg: AssetsManager.phoneIc,
                              validator: (input) => PhoneValidator(
                                      fieldName: StringsManager.phone)
                                  .validate(input),
                            ),
                            //const Spacer(),
                            // SizedBox(
                            //   width: double.infinity,
                            //   child: AppButton(
                            //     btnLabel: StringsManager.deleteAccount,
                            //     color: ColorsManager.red,
                            //     labelStyle: DarkStyles.robotW400F18,
                            //     onBtnPressed: () {},
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: double.infinity,
                    child: AppButton(
                      btnLabel: StringsManager.updateData,
                      onBtnPressed: () => onUpdateDataPressed(),
                    ),
                  ),
                  const SafeArea(
                    top: false,
                    child: SizedBox.shrink(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onUpdateDataPressed() {
    clearFocus();
    if (formKey.currentState?.validate() ?? false) {
      UserEntity? user = widget.profileViewModel.user;
      if (nameController.text.trim().isEmpty == true ||
          phoneController.text.trim().isEmpty == true) {}
      if (nameController.text != user?.name ||
          phoneController.text != user?.phoneNumber) {
        editProfileViewModel.editProfile(
            nameController.text, phoneController.text);
      }
    }
  }
}
