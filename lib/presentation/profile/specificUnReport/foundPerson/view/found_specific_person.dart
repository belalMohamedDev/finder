

import 'package:cached_network_image/cached_network_image.dart';


import 'package:finder/presentation/resources/font_manger.dart';
import 'package:finder/presentation/resources/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../../../../application/constant.dart';
import '../../../../../domain/models/makeUnSpecificReport/model.dart';
import '../../../../resources/asset_manger.dart';
import '../../../../resources/color_manger.dart';



class FoundSpecificPersonDetailsScreen extends StatelessWidget {
  final MakeSpecificUnReportModel data;

  const FoundSpecificPersonDetailsScreen(this.data, {Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageData = "${Constant.baseUrl}/storage/${data.data?.attributes?.picture}";
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManger.darkBlue,
              statusBarIconBrightness: Brightness.dark),
          title: const Text("    Found Person Details"),
            backgroundColor: ColorManger.darkBlue
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin:  EdgeInsets.all(AppPadding.p22.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(APPSize.s12.sp),
                    ),
                  ),
                  elevation: 10,
                  child: ClipRRect(
                    borderRadius:  BorderRadius.circular(APPSize.s12.sp),
                    child: CachedNetworkImage(
                      imageUrl: imageData,
                      height: AppPadding.p36.h,
                      width: AppPadding.p92.w,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Image.asset(ImageAsset.profile),
                    ),
                  )),
              SizedBox(
                height: AppPadding.p3.h,
              ),
              Center(
                child: Text(
                  "${data.data?.attributes?.policeStation}",
                  style:Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                height: AppPadding.p3.h,
              ),

              Text(
                """Missing From Place:""",
                style:  Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                height: AppPadding.p1.h,
              ),

              Center(
                child: Text(
                  "${data.data?.attributes?.policeStation}",
                  style:  Theme.of(context).textTheme.bodySmall,
                ),
              ),


              SizedBox(
                height: AppPadding.p4.h,
              ),
              Row(
                children: [
                  Text(
                    """Missing From :    """,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    """  ${data.data?.attributes?.createdAt}""",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),


              SizedBox(
                height:AppPadding.p3.h,
              ),
              const Divider(
                color: Colors.black54,
              ),
              SizedBox(
                height:AppPadding.p2.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    size: APPSize.s20.sp,
                  ),
                  SizedBox(
                    width:AppPadding.p10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        "${data.data?.attributes?.gender}",
                        style:  TextStyle(
                            fontSize: FontSize.s14.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height:AppPadding.p1.h,
                      ),
                      Text(
                        "Gender",
                        style:
                        TextStyle(color: Colors.grey, fontSize: FontSize.s12.sp),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height:AppPadding.p4.h,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 30,
                  ),
                  SizedBox(
                    width:AppPadding.p8.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        "${data.data?.attributes?.area}",
                        style:  TextStyle(
                            fontSize: FontSize.s14.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height:AppPadding.p1.h,
                      ),
                      Text(
                        "Address",
                        style:
                        TextStyle(color: Colors.grey, fontSize: FontSize.s12.sp),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }

}