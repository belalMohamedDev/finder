import 'dart:io';

import 'package:finder/core/style/colors/colors_light.dart';

import 'package:finder/core/style/sharedWidget/picketImage/image_picket_by_user.dart';
import 'package:finder/core/style/sharedWidget/picketImage/show_picker.dart';
import 'package:finder/feature/makeUnReport/logic/viewModel/make_un_report_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadFindImageButton extends StatelessWidget {
  const UploadFindImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    File? image;
    return Center(
      child: BlocBuilder<MakeUnReportCubit, MakeUnReportState<dynamic>>(
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
                context.read<MakeUnReportCubit>().camera();
                Navigator.of(context).pop();
              },
              listTileGallery: () {
                context.read<MakeUnReportCubit>().gallery();
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
