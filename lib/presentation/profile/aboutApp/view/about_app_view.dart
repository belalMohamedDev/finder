import 'package:finder/presentation/resources/asset_manger.dart';
import 'package:finder/presentation/resources/color_manger.dart';
import 'package:finder/presentation/resources/route_manger.dart';
import 'package:finder/presentation/resources/strings_manger.dart';
import 'package:finder/presentation/resources/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:size_helper/size_helper.dart';
import 'package:sizer/sizer.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
            )),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
                height: context.sizeHelper(
                    tabletLarge: AppPadding.p12.h,
                    desktopSmall: AppPadding.p12.h),
                width: context.sizeHelper(
                    tabletLarge: AppPadding.p27.w,
                    desktopSmall: AppPadding.p20.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(APPSize.s120.sp),
                    color: ColorManger.lightBlue1,
                    image: const DecorationImage(
                        image: AssetImage(
                      ImageAsset.splashLogo,
                    )))),
            SizedBox(
              height: 5.h,
            ),
            Text(
              AppStrings.aboutTheApp,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 23.sp,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const _ColumnText(),
            const Spacer(),
            const _Stack(),
          ],
        ),
      ),
    );
  }
}

class _ColumnText extends StatelessWidget {
  const _ColumnText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.aboutTheAppText1,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          AppStrings.aboutTheAppText2,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          AppStrings.aboutTheAppText3,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class _Stack extends StatelessWidget {
  const _Stack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: EdgeInsets.only(top: AppPadding.p5.h),
        child: Container(
          height: AppPadding.p8.h,
          width: double.infinity,
          color: ColorManger.white,
        ),
      ),
      Center(
        child: Padding(
          padding: EdgeInsets.only(top: AppPadding.p1_5.h),
          child: SizedBox(
            height: 7.h,
            width: 7.h,
            child: FloatingActionButton(
              elevation: APPSize.s10.sp,
              onPressed: (() {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.bottomNavBarRoute, (route) => false);
              }),
              child: Icon(
                Icons.home,
                size: context.sizeHelper(
                    tabletLarge: AppPadding.p28.sp,
                    desktopSmall: AppPadding.p15.sp),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
