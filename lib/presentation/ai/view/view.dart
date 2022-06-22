import 'dart:io';

import 'package:finder/presentation/ai/viewModel/view_model.dart';
import 'package:finder/presentation/resources/route_manger.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../application/di.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';
import '../../resources/asset_manger.dart';
import '../../resources/color_manger.dart';
import '../../resources/strings_manger.dart';
import '../../resources/values_manger.dart';

class AiView extends StatefulWidget {
  const AiView({Key? key}) : super(key: key);

  @override
  State<AiView> createState() => _AiViewState();
}

class _AiViewState extends State<AiView> {
  final AiViewModel _viewModel = instance<AiViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.ai,
            style: TextStyle(color: ColorManger.lightBlack)),
        iconTheme: IconThemeData(color: ColorManger.lightBlack),
      ),
      body: StreamBuilder<FlowState>(
          stream: _viewModel.outState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _viewModel.ai();
                }) ??
                _getContentWidget();
          }),
    );
  }

  Widget _getContentWidget() {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MaterialButton(
              highlightColor: ColorManger.gradationLightBlue,
              onPressed: () => _showPicker(context),
              child: StreamBuilder<File>(
                  stream: _viewModel.outputPictureValid,
                  builder: (context, snapshot) {
                    return _imagePicketByUser(snapshot.data);
                  })),
          
          SizedBox(height: APPSize.s20,),
          Text("You can use AI to Find your missing person"),
          SizedBox(height: APPSize.s120,),
          SizedBox(
            width: double.infinity,
            height: AppPadding.p6_7.h,
            child: ElevatedButton(
              onPressed: () {
                _viewModel.ai();
              },
              child: const Text(
                AppStrings.submit,
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(APPSize.s10)),
                  primary: ColorManger.darkBlue),
            ),
          ),
          SizedBox(height: APPSize.s20,),

          SizedBox(
            width: double.infinity,
            height: AppPadding.p6_7.h,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.makeUnReport);
              },
              child: const Text(
                AppStrings.skipToReport,
                style: TextStyle(color: Colors.black),
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white38,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(APPSize.s10)),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
              child: SizedBox(
            height: AppPadding.p15.h,
            child: Wrap(
              children: [
                ListTile(
                  trailing: const Icon(Icons.arrow_forward),
                  leading: const Icon(Icons.photo),
                  title: const Text(AppStrings.photoGallery),
                  onTap: () {
                    _viewModel.gallery();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  trailing: const Icon(Icons.arrow_forward),
                  leading: const Icon(Icons.camera_alt_rounded),
                  title: const Text(AppStrings.photoCamera),
                  onTap: () {
                    _viewModel.camera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ));
        });
  }

  Widget _imagePicketByUser(File? image) {
    if (image != null && image.path.isNotEmpty) {
      //return image
      return Container(
        height: AppPadding.p15.h,
        width: AppPadding.p35.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(APPSize.s50.sp)),
            image: DecorationImage(fit: BoxFit.cover, image: FileImage(image))),
      );
    } else {
      return Lottie.asset(JsonAsset.takePhoto, height: AppPadding.p16.h);
    }
  }
}
