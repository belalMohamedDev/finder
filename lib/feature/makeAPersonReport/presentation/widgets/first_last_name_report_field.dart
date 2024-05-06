
import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/utils/app_regex.dart';
import 'package:finder/feature/makeAPersonReport/logic/cubit/make_a_report_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstAndLastNameReportField extends StatelessWidget {
  const FirstAndLastNameReportField({super.key});

  @override
  Widget build(BuildContext context) {
    final makeAReportCubit=context.read<MakeAReportCubit>();
    return Row(
      children: [
        Expanded(
          flex: 16,

          child:  TextFormField(
            validator:   (value) {
              if (value == null || value.isEmpty || !AppRegex.isNameValid(value)) {
                return 'Please enter a valid first name';
              }
              return null;
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
              controller: makeAReportCubit.userFirstName,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person_2_rounded,
                size:
                16.sp,
                color: ColorsLight.grey,

              ),
              labelText: LangKeys.name,
              hintText: LangKeys.name,
            ),
          ),
        ),


        const Spacer(),
        Expanded(
          flex: 16,
          child:  TextFormField(
            validator:   (value) {
              if (value == null || value.isEmpty || !AppRegex.isNameValid(value)) {
                return 'Please enter a valid last name';
              }
              return null;
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
             controller:makeAReportCubit.userLastName,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person_2_rounded,
                size:
                16.sp,
                color: ColorsLight.grey,
              ),
              labelText: LangKeys.lastName,
              hintText: LangKeys.lastName,
            ),),
        ),
      ],
    );
  }
}
