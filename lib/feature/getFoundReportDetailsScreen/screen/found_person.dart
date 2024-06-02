import 'package:finder/core/network/api_constant/api_constant.dart';
import 'package:finder/core/style/fonts/font_family_helper.dart';

import 'package:finder/feature/getFoundReportsScreen/data/model/foundResponse/found_response.dart';
import 'package:finder/feature/getFoundReportDetailsScreen/refactor/found_details_body.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoundPersonDetailsScreen extends StatelessWidget {
  final GetFoundData data;

  const FoundPersonDetailsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    String imageData =
        "${data.image?.replaceFirst(ApiConstants.baseUrlImage, ApiConstants.baseUrl)}";
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "    Found Person Details",
            style: TextStyle(
                fontSize: 15.sp, fontFamily: FontFamilyHelper.poppinsEnglish),
          ),
        ),
        body: FoundDetailsBody(imageData: imageData, data: data));
  }
}

