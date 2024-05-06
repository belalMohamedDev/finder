
import 'package:cached_network_image/cached_network_image.dart';
import 'package:finder/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardImageMissingWidget extends StatelessWidget {
  const CardImageMissingWidget({
    super.key,
    required this.imageData,
  });

  final String imageData;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.sp),
          ),
        ),
        elevation: 10,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.sp),
          child: CachedNetworkImage(
            imageUrl: imageData,
            height: 300.h,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                Image.asset(ImageAsset.profile),
          ),
        ));
  }
}
