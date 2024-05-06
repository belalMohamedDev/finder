
import 'dart:io';

import 'package:finder/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class ImagePicketByUser extends StatelessWidget {
  const ImagePicketByUser({
    required this.image,this.imageAsset=false, super.key,
  });

  final File? image;
  final bool imageAsset;

  @override
  Widget build(BuildContext context) {
    if (image != null && image!.path.isNotEmpty) {
      //return image
      return Container(
        height: 110.h,
        width:110.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(60.sp)),
            image: DecorationImage(fit: BoxFit.cover, image: FileImage(image!)),),
      );
    } else {
      return imageAsset?SvgPicture.asset(ImageAsset.camera) :Lottie.asset(JsonAsset.takePhoto, height: 90.h,);
    }
  }
}
