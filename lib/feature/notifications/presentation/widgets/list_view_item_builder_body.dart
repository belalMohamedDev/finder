import 'package:cached_network_image/cached_network_image.dart';
import 'package:finder/core/network/api_constant/api_constant.dart';
import 'package:finder/core/style/fonts/font_family_helper.dart';
import 'package:finder/core/style/images/app_images.dart';
import 'package:finder/core/utils/date_extension.dart';
import 'package:finder/feature/notifications/data/model/notificationResponse/notification_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewItemBuilderBody extends StatefulWidget {
  const ListViewItemBuilderBody({
    super.key,
    required this.image,
    required this.name,
    required this.state,
    required this.index,
    required this.createAtParse,
  });

  final String? image;
  final String? name;
  final int? index;
  final  List<DataNotification>  state;
  final DateTime createAtParse;

  @override
  State<ListViewItemBuilderBody> createState() =>
      _ListViewItemBuilderBodyState();
}

class _ListViewItemBuilderBodyState extends State<ListViewItemBuilderBody>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            height: 80.h,
            width: 80.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.sp),
              child: CachedNetworkImage(
                imageUrl:
                    "${widget.image?.replaceFirst("http://localhost:8080", ApiConstants.baseUrl)}",
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Image.asset(ImageAsset.profile),
              ),
            )),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.name}',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black54,
                      fontFamily: FontFamilyHelper.cairoArabic,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  widget.state[widget.index!].title!,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black54,
                      fontFamily: FontFamilyHelper.cairoArabic,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(widget.createAtParse.getFormatDayMonthYear(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: FontFamilyHelper.cairoArabic,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
