import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class NotificationLoaderShimmer extends StatelessWidget {
  const NotificationLoaderShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade500,
              highlightColor: Colors.grey.shade300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.sp),
                child: Container(
                  color: Colors.black,
                  height: 80.h,
                  width: 80.w,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                      child: Container(
                        color: Colors.black,
                        height: 3.h,
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                      child: Container(
                        color: Colors.black,
                        height: 3.h,
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 80.w),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade500,
                        highlightColor: Colors.grey.shade300,
                        child: Container(
                          color: Colors.black,
                          height: 3.h,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 20.h,
      ),
      itemCount: 20,
    );
  }
}
