import 'package:finder/feature/getFoundReportsScreen/data/model/foundResponse/found_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUserFoundItInformation extends StatelessWidget {
  const CustomUserFoundItInformation({
    super.key,
    required this.data,
  });

  final GetFoundData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Name of the person who found it",
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
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Address of the person who found it",
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
                  "Phone number of the person who found it",
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
