import 'package:cached_network_image/cached_network_image.dart';

import 'package:finder/core/network/api_constant/api_constant.dart';
import 'package:finder/core/style/fonts/font_family_helper.dart';
import 'package:finder/feature/getFoundReportsScreen/data/model/foundResponse/found_response.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardFound extends StatefulWidget {
  final int index;
  final List<GetFoundData>? data;
  const CustomCardFound({super.key, required this.index, this.data});

  @override
  State<CustomCardFound> createState() => _CustomCardFoundState();
}

class _CustomCardFoundState extends State<CustomCardFound>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    String imageData =
        "${widget.data![widget.index].image?.replaceFirst(ApiConstants.baseUrlImage, ApiConstants.baseUrl)}";

    return Card(
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.sp),
        ),
      ),
      elevation: 2,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.sp),
                  topLeft: Radius.circular(20.sp)),
              child: CachedNetworkImage(
                height: 160.h,
                width: 180.w,
                fit: BoxFit.cover,
                imageUrl: imageData,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )),
          SizedBox(
            height: 10.h,
          ),
          Text(
            '  ${widget.data![widget.index].description}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish),
          ),
          SizedBox(
            height: 14.h,
          ),
          Text(
            '  ${widget.data![widget.index].address}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
