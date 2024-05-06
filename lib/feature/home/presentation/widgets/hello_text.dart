import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/services/shared_pref/pref_keys.dart';
import 'package:finder/core/services/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelloTextWidget extends StatelessWidget {
  const HelloTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ' ${LangKeys.hello} ${SharedPref().getString(PrefKeys.userName)} !',
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontSize: 16.sp),
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          LangKeys.hope,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w200),
        ),
      ],
    );
  }
}
