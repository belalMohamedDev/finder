import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/utils/app_regex.dart';
import 'package:finder/feature/updateUserData/logic/cubit/update_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstAndLastNameFieldUserDataScreen extends StatelessWidget {
  const FirstAndLastNameFieldUserDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<UpdateMyDataCubit>();
    return Row(
      children: [
        Expanded(
          flex: 16,
          child: TextFormField(
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isNameValid(value)) {
                return 'Please enter a valid first name';
              }
              return null;
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            controller: registerCubit.userFirstName,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                size: 16.sp,
                color: ColorsLight.grey,
              ),
            ),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 16,
          child: TextFormField(
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isNameValid(value)) {
                return 'Please enter a valid last name';
              }
              return null;
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            controller: registerCubit.userLastName,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                size: 16.sp,
                color: ColorsLight.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
