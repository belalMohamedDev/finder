import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/style/colors/colors_light.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> showPicker(
    {required BuildContext context,
    required VoidCallback  listTileGallery,
    required VoidCallback  listTileCamera}) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Container(
          color: ColorsLight.backGround,
          height: 150.h,
          child: Wrap(
            children: [
              ListTile(
                trailing: const Icon(Icons.arrow_forward),
                leading: const Icon(Icons.photo),
                title: const Text(LangKeys.photoGallery),
                onTap:  listTileGallery,
              ),
              ListTile(
                trailing: const Icon(Icons.arrow_forward),
                leading: const Icon(Icons.camera_alt_rounded),
                title: const Text(LangKeys.photoCamera),
                onTap:  listTileCamera,
              ),
            ],
          ),
        ),
      );
    },
  );
}
