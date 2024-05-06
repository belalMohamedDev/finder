import 'package:finder/feature/getMissingRepotsScreen/data/model/missingResponse/missing_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUserPhoneAndMissingDescribtion extends StatelessWidget {
  const CustomUserPhoneAndMissingDescribtion({
    super.key,
    required this.data,
  });

  final GetMissingData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        data.name != null
            ? Row(
                children: [
                  Icon(
                    Icons.collections_bookmark_outlined,
                    size: 20.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${data.describtion}",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "Birth Mark",
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                      ),
                    ],
                  )
                ],
              )
            : Row(
                children: [
                  Icon(
                    Icons.emoji_people_sharp,
                    size: 22.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${data.user!.name}",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "Name of the missing person",
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                      ),
                    ],
                  )
                ],
              ),
        SizedBox(
          height: 25.h,
        ),
        data.name != null
            ? Row(
                children: [
                  Icon(
                    Icons.dry_cleaning_rounded,
                    size: 22.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${data.clothesLastSeenWearing}",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "Clothes Last Seen Wearing",
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                      ),
                    ],
                  )
                ],
              )
            : Row(
                children: [
                  Icon(
                    Icons.location_on_sharp,
                    size: 22.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${data.user!.address}",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "Address of the missing person",
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                      ),
                    ],
                  )
                ],
              ),
        SizedBox(
          height: 25.h,
        ),
        Row(
          children: [
            Icon(
              Icons.phone_iphone,
              size: 22.sp,
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${data.user!.phone}",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Phone number of the missing person",
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
