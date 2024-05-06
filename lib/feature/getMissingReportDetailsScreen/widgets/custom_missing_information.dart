import 'package:finder/core/style/fonts/font_family_helper.dart';
import 'package:finder/feature/getMissingRepotsScreen/data/model/missingResponse/missing_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMissingInformation extends StatelessWidget {
  const CustomMissingInformation({
    super.key,
    required this.data,
  });

  final GetMissingData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: data.name != null ? "name :  " : "describtion :  ",
            style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black87,
                // fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeight.w500),
            children: <TextSpan>[
              TextSpan(
                text: '  ${data.name ?? data.describtion}',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.sp,
                    //  fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        RichText(
          text: TextSpan(
            text: """Missing From Place : """,
            style: TextStyle(
                fontSize: 13.sp,
                color: Colors.black87,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeight.w500),
            children: <TextSpan>[
              TextSpan(
                text: '    ${data.address}',
                style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        RichText(
          text: TextSpan(
            text: """Missing From :    """,
            style: TextStyle(
                fontSize: 13.sp,
                color: Colors.black,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeight.w500),
            children: <TextSpan>[
              TextSpan(
                text: """  ${data.createdAt}""",
                style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.grey,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

