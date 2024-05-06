import 'package:finder/core/common/animations/animate_do.dart';

import 'package:finder/feature/home/presentation/widgets/find_person_container.dart';
import 'package:finder/feature/home/presentation/widgets/hello_text.dart';
import 'package:finder/feature/home/presentation/widgets/missing_person_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomFadeInUp(duration: 1, child: HelloTextWidget()),
        SizedBox(height: 185.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomFadeInLeft(
                duration: 1, child: MissingPersonContainer()),
            SizedBox(
              width: 17.w,
            ),
            const CustomFadeInRight(duration: 1, child: FindPersonContainer()),
          ],
        ),
      ],
    );
  }
}
