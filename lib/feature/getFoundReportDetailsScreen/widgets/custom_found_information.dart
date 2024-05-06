import 'package:finder/core/style/fonts/font_family_helper.dart';
import 'package:finder/feature/getFoundReportsScreen/data/model/foundResponse/found_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFoundInformation extends StatelessWidget {
  const CustomFoundInformation({
    super.key,
    required this.data,
  });

  final GetFoundData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "describtion :",
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            ),
            Expanded(
              child: Text(
                '''

     ${data.description}''',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        RichText(
          text: TextSpan(
            text: "available from the place : ",
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
            text: """found from :    """,
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
