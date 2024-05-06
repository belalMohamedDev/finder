
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/style/sharedWidget/picketImage/image_picket_by_user.dart';
import 'package:finder/core/style/sharedWidget/picketImage/show_picker.dart';
import 'package:finder/feature/makeAPersonReport/logic/cubit/make_a_report_cubit.dart';


class UploadMissingImageButton extends StatelessWidget {
  const UploadMissingImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    File? image;
    return Center(
      child: BlocBuilder<MakeAReportCubit, MakeAReportState<dynamic>>(
        builder: (context, state) {
          state.whenOrNull(
            imagePath: (imagePath) {
              image = imagePath;
            },
          );
          return MaterialButton(
            highlightColor: ColorsLight.gradationLightBlue,
            onPressed: () => showPicker(
              context: context,
              listTileCamera: () {
                context.read<MakeAReportCubit>().camera();
                Navigator.of(context).pop();
              },
              listTileGallery: () {
                context.read<MakeAReportCubit>().gallery();
                Navigator.of(context).pop();
              },
            ),
            child: ImagePicketByUser(
              image: image,
            
            ),
          );
        },
      ),
    );
  }
}
