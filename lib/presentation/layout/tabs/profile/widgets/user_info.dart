import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/components/column_component.dart';
import 'package:movies_app/core/utils/styles_manager.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

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
          tailLabel: 'John Safwat',
          tailStyle: DarkStyles.interW700F16,
        ),
        ColumnComponent(
          head: Text(
            '12',
            style: DarkStyles.interW700F36,
          ),
          tailLabel: 'Wish List',
          tailStyle: DarkStyles.interW700F24,
        ),
        ColumnComponent(
          head: Text(
            '10',
            style: DarkStyles.interW700F36,
          ),
          tailLabel: 'History',
          tailStyle: DarkStyles.interW700F24,
        )
      ],
    );
  }
}
