import 'dart:io';

import 'package:finder/presentation/resources/asset_manger.dart';

import 'package:finder/presentation/resources/values_manger.dart';
import 'package:flutter/material.dart';



import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../application/di.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';
import '../../resources/color_manger.dart';

import '../../resources/strings_manger.dart';

import '../viewModel/view_model.dart';

class MakeReportView extends StatefulWidget {
  const MakeReportView({Key? key}) : super(key: key);

  @override
  State<MakeReportView> createState() => _MakeReportViewState();
}

class _MakeReportViewState extends State<MakeReportView> {
  //instant
  final MakingReportViewModel _viewModel = instance<MakingReportViewModel>();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _userAge = TextEditingController();
  final TextEditingController _userId = TextEditingController();
  final TextEditingController _userArea = TextEditingController();
  final TextEditingController _userClothes = TextEditingController();
  final TextEditingController _userBirthMark = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final List<String> items = [
    AppStrings.male,
    AppStrings.female,
  ];
  String? dropDownValue;

  _bind() {
    _viewModel.start();
    _userId.addListener(() => _viewModel.setUserNationalId(_userId.text));
    _userName.addListener(() => _viewModel.setUserName(_userName.text));
    _userAge.addListener(() => _viewModel.setUserAge(_userAge.text));
    _userArea.addListener(() => _viewModel.setUserArea(_userArea.text));
    _userClothes.addListener(
        () => _viewModel.setUserClothesLastSeenWearing(_userClothes.text));
    _userBirthMark
        .addListener(() => _viewModel.setUserBirthmark(_userBirthMark.text));


  }
  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
        stream: _viewModel.outState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _viewModel.makeReport(context);
              }) ??
              _getContentWidget();
        });
  }

  Widget _getContentWidget() {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.makeAReport,
              style: TextStyle(color: ColorManger.lightBlack)),
          iconTheme: IconThemeData(color: ColorManger.lightBlack),
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(

                    left: AppPadding.p5.w,
                    right: AppPadding.p5.w),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: SizerUtil.deviceType == DeviceType.mobile
                              ? AppPadding.p1.h
                              : AppPadding.p3.h),
                      child: Center(
                        child: MaterialButton(
                            highlightColor: ColorManger.gradationLightBlue,
                            onPressed: () => _showPicker(context),
                            child: StreamBuilder<File>(
                                stream: _viewModel.outPicture,
                                builder: (context, snapshot) {
                                  return _imagePicketByUser(snapshot.data);
                                })),
                      ),
                    ),
                    SizedBox(
                      height: AppPadding.p2.h,
                    ),
                    StreamBuilder<bool>(
                        stream: _viewModel.outName,
                        builder: (context, snapshot) {
                          return TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            controller: _userName,
                            decoration: InputDecoration(
                                labelText: AppStrings.name,
                                hintText: AppStrings.name,
                                errorText: (snapshot.data ?? true)
                                    ? null
                                    : AppStrings.nameError),
                          );
                        }),
                    SizedBox(
                      height: AppPadding.p1_5.h,
                    ),
                    StreamBuilder<bool>(
                        stream: _viewModel.outAge,
                        builder: (context, snapshot) {
                          return TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            controller: _userAge,
                            decoration: InputDecoration(
                                labelText: AppStrings.age,
                                hintText: AppStrings.age,
                                errorText: (snapshot.data ?? true)
                                    ? null
                                    : AppStrings.ageError),
                          );
                        }),
                    SizedBox(
                      height: AppPadding.p1_5.h,
                    ),
                 StreamBuilder<bool>(
                                      stream: _viewModel.outNationalId,
                                      builder: (context, snapshot) {
                                        return TextFormField(
                                          textInputAction: TextInputAction.next,
                                          keyboardType: TextInputType.number,
                                          controller: _userId,
                                          decoration: InputDecoration(
                                              labelText: AppStrings.nationalNumber,
                                              hintText: AppStrings.nationalNumber,
                                              errorText: (snapshot.data ?? true)
                                                  ? null
                                                  : AppStrings.nationalIdError),
                                        );
                                      }),
                    SizedBox(
                      height: AppPadding.p1_5.h,
                    ),
                    StreamBuilder(
                      builder: (context, snapshot) {
                        return DropdownButtonFormField<String>(
                          borderRadius: BorderRadius.circular(10.sp),
                          dropdownColor: ColorManger.white,
                          hint: Text(
                            AppStrings.selectGender,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: ColorManger.darkGrey,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          value: dropDownValue,
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManger.darkGrey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          onChanged: (String? value) {
                            dropDownValue = value!;

                            _viewModel.setUserGender(dropDownValue!);
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: AppPadding.p1_5.h,
                    ),
                    StreamBuilder<bool>(
                        stream: _viewModel.outClothesLastSeenWearing,
                        builder: (context, snapshot) {
                          return TextFormField(
                            maxLines: 6,
                            minLines: 1,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.streetAddress,
                            controller: _userClothes,
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                labelText: AppStrings.cloths,
                                hintText: AppStrings.cloths,
                                errorText: (snapshot.data ?? true)
                                    ? null
                                    : AppStrings.clothsError),
                          );
                        }),
                    SizedBox(
                      height: AppPadding.p1_5.h,
                    ),
                    StreamBuilder<bool>(
                        stream: _viewModel.outArea,
                        builder: (context, snapshot) {
                          return TextFormField(
                            textInputAction: TextInputAction.next,
                            maxLines: 6,
                            minLines: 1,
                            keyboardType: TextInputType.streetAddress,

                            controller: _userArea,
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                labelText: AppStrings.placeLastSeen,
                                hintText: AppStrings.placeLastSeen,
                                errorText: (snapshot.data ?? true)
                                    ? null
                                    : AppStrings.placeLastSeen),
                          );
                        }),
                    SizedBox(
                      height: AppPadding.p1_5.h,
                    ),
                   StreamBuilder<bool>(
                                      stream: _viewModel.outBirthmark,
                                      builder: (context, snapshot) {
                                        return TextFormField(
                                          maxLines: 6,
                                          minLines: 1,
                                          textInputAction: TextInputAction.next,
                                          keyboardType: TextInputType.streetAddress,
                                          controller: _userBirthMark,
                                          decoration: InputDecoration(
                                              alignLabelWithHint: true,
                                              labelText: AppStrings.mark,
                                              hintText: AppStrings.mark,
                                              errorText: (snapshot.data ?? true)
                                                  ? null
                                                  : AppStrings.markError),
                                        );
                                      }),
                   StreamBuilder<bool>(
                      stream: _viewModel.outAllTextInputsValid,
                      builder: (context, snapshot) {
                        return Padding(
                          padding: EdgeInsets.only(top: AppPadding.p2.h),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          APPSize.s10.sp)),
                                  primary: ColorManger.darkBlue),
                              onPressed: (snapshot.data ?? false)
                                  ? () {
                                  _viewModel.makeReport(context);

                                    }
                                  : null,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(AppStrings.next),
                                  SizedBox(
                                    width: AppPadding.p4.w,
                                  ),
                                  const Icon(Icons.arrow_forward),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
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
        height: AppPadding.p20.h,
        width: AppPadding.p50.w,
        decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: FileImage(image))),
      );
    } else {
      return Lottie.asset(JsonAsset.takePhoto, height: AppPadding.p16.h);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
