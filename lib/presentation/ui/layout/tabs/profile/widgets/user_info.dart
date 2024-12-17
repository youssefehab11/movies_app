import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/domain/entities/user.dart';
import 'package:movies_app/presentation/core/components/column_component.dart';
import 'package:movies_app/presentation/core/utils/extensions.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/core/utils/styles_manager.dart';

class UserInfo extends StatelessWidget {
  final UserEntity? user;
  const UserInfo({
    super.key,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ColumnComponent(
          head: CircleAvatar(
            radius: 48.r,
            child: Image.asset('assets/images/profile_test.png'),
          ),
          tailLabel: user?.name?.formatProfileName ?? '',
          tailStyle: DarkStyles.interW700F16,
        ),
        ColumnComponent(
          head: Text(
            user?.wishListCount.toString() ?? '',
            style: DarkStyles.interW700F24,
          ),
          tailLabel: StringsManager.wishList,
          tailStyle: DarkStyles.interW700F18,
        ),
        ColumnComponent(
          head: Text(
            user?.historyCount.toString() ?? '',
            style: DarkStyles.interW700F24,
          ),
          tailLabel: StringsManager.history,
          tailStyle: DarkStyles.interW700F18,
        )
      ],
    );
  }
}
