
import 'package:finder/core/network/api_constant/api_constant.dart';

import 'package:finder/core/style/fonts/font_family_helper.dart';

import 'package:finder/feature/getMissingRepotsScreen/data/model/missingResponse/missing_response.dart';
import 'package:finder/feature/getMissingReportDetailsScreen/refactor/missing_details_body.dart';


import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class MissingPersonDetailsScreen extends StatelessWidget {
  final GetMissingData data;

  const MissingPersonDetailsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    String imageData =
        "${data.image?.replaceFirst(ApiConstants.baseUrlImage, ApiConstants.baseUrl)}";
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            data.name != null
                ? "    Missing Person Details"
                : "    Missing Object Details",
            style: TextStyle(
                fontSize: 15.sp, fontFamily: FontFamilyHelper.poppinsEnglish),
          ),
        ),
        body: MissingDetailsBody(imageData: imageData, data: data));
  }
}

