import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/style/fonts/font_family_helper.dart';
import 'package:finder/feature/makeUnReport/presentation/refactors/make_un_report_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MakeUnReportView extends StatelessWidget {
  const MakeUnReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LangKeys.findingAPerson,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontFamily: FontFamilyHelper.cairoArabic,
                fontSize: 16.sp,
              ),
        ),
      ),
      body: const MakeUnReportBody(),
    );
  }
}
