import 'package:finder/core/common/animations/animate_do.dart';
import 'package:finder/feature/profile/presentation/widgets/person_profile_stack.dart';
import 'package:finder/feature/profile/presentation/widgets/tips_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomFadeInUp(
                duration: 1,
                child: PersonDataProfileStack(),
              ),
              SizedBox(
                height: 60.h,
              ),
              const CustomFadeInDown(
                duration: 1,
                child: TipsContainersProfile(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
