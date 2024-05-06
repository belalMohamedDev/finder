
import 'dart:io';

import 'package:finder/feature/aiScreen/logic/cubit/ai_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/style/sharedWidget/picketImage/image_picket_by_user.dart';
import 'package:finder/core/style/sharedWidget/picketImage/show_picker.dart';



class UploadAiImageButton extends StatelessWidget {
  const UploadAiImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    File? image;
    return Center(
      child: BlocBuilder<AiCubit, AiState<dynamic>>(
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
                context.read<AiCubit>().camera();
                Navigator.of(context).pop();
              },
              listTileGallery: () {
                context.read<AiCubit>().gallery();
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
