import 'package:country_code_picker/country_code_picker.dart';
import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/utils/app_regex.dart';
import 'package:finder/feature/signUp/logic/viewModel/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit=context.read<RegisterCubit>();
    return Row(
      children: [
        Expanded(
          child: CountryCodePicker(
              onChanged: (value) {

              },
              initialSelection: '+20',
              favorite: const ['+20', '+39', 'FR', '+966'],
              showCountryOnly: true,

              hideMainText: true,
              showOnlyCountryWhenClosed: true,
            ),),
        Expanded(
          flex: 3,
          child:  TextFormField(
              validator:   (value) {
              if (value == null || value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone';
              }
              return null;
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            controller: registerCubit.userPhone,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.phone,
                size:
                16.sp,
                color: ColorsLight.grey,
              ),
              labelText: LangKeys.phoneNumber,
              hintText: LangKeys.phoneNumber,
            ),),
        ),
      ],
    );
  }
}
