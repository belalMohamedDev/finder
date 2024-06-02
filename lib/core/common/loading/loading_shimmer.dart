import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
  });
  final double? height;
  final double? width;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(
        top: 15.h,
        right: 12.w,
        left: 15.w,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return const CustomCardShimmer();
      },
      itemCount: 20,
    );
  }
}

class CustomCardShimmer extends StatelessWidget {
  const CustomCardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.sp),
        ),
      ),
      elevation: 2,
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade600,
            highlightColor: Colors.grey.shade400,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.sp),
                    topLeft: Radius.circular(20.sp)),
                child: Container(
                  color: Colors.black,
                  height: 160.h,
                  width: double.infinity,
                )),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade600,
              highlightColor: Colors.grey.shade400,
              child: Container(
                height: 5.h,
                color: Colors.black54,
                width: double.maxFinite,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade600,
              highlightColor: Colors.grey.shade400,
              child: Container(
                height: 5.h,
                color: Colors.black54,
                width: double.maxFinite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
