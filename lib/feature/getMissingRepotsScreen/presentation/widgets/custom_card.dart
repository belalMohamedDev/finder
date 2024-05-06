import 'package:cached_network_image/cached_network_image.dart';
import 'package:finder/core/network/api_constant/api_constant.dart';
import 'package:finder/core/style/fonts/font_family_helper.dart';
import 'package:finder/feature/getMissingRepotsScreen/data/model/missingResponse/missing_response.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardMissing extends StatefulWidget {
  final int index;
  final List<GetMissingData>? data;
  const CustomCardMissing({super.key, required this.index, this.data});

  @override
  State<CustomCardMissing> createState() => _CustomCardMissingState();
}

class _CustomCardMissingState extends State<CustomCardMissing>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    String imageData =
        "${widget.data![widget.index].image?.replaceFirst("http://localhost:8080", ApiConstants.baseUrl)}";

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
              child: SizedBox(
                height: 212.h,
                //width: 150,
                child: Container(
                  color: Colors.black,
                  child: CachedNetworkImage(
                    imageUrl: imageData,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              )),
          SizedBox(
            height: 10.h,
          ),
          Text(
            widget.data?[widget.index].name ??
                widget.data![widget.index].describtion!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            widget.data![widget.index].address!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: Colors.black,
                fontFamily: FontFamilyHelper.poppinsEnglish),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
