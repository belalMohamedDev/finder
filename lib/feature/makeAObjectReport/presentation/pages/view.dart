import 'package:finder/core/language/lang_keys.dart';

import 'package:finder/core/style/fonts/font_family_helper.dart';
import 'package:finder/feature/makeAObjectReport/presentation/manager/make_un_object_report_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MakeReportObjectView extends StatelessWidget {
  const MakeReportObjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LangKeys.makeAOjectReport,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontFamily: FontFamilyHelper.cairoArabic,
                fontSize: 16.sp,
              ),
        ),
      ),
      body: const MakeAReportObjectBody(),
    );
  }

  
}
