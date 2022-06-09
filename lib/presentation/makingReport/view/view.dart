import 'dart:io';

import 'package:finder/presentation/resources/asset_manger.dart';

import 'package:finder/presentation/resources/values_manger.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../application/di.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';
import '../../resources/color_manger.dart';
import '../../resources/font_manger.dart';
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
  final _formKey2 = GlobalKey<FormState>();
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
                    top: AppPadding.p3.h,
                    left: AppPadding.p5.w,
                    right: AppPadding.p5.w),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      ImageAsset.onBoardingFirstLogo,
                      height: AppPadding.p31.h,
                    ),
                    SizedBox(
                      height: AppPadding.p5.h,
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
                            onEditingComplete: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => secondPage(),
                                )),
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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => secondPage(),
                                          ));
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

  Widget secondPage() {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.makeAReport,
            style: TextStyle(color: ColorManger.lightBlack)),
        iconTheme: IconThemeData(color: ColorManger.lightBlack),
      ),
      body: Form(
        key: _formKey2,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppPadding.p3.h,
                ),
                StreamBuilder<File>(
                    stream: _viewModel.outPicture,
                    builder: (context, snapshot) {
                      return _imagePicketByUser(snapshot.data);
                    }),
                SizedBox(
                  height: AppPadding.p6.h,
                ),
                Text(
                  AppStrings.uploadImage,
                  style: TextStyle(fontSize: FontSize.s14.sp),
                ),
                SizedBox(
                  height: AppPadding.p4.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: ColorManger.lightBlueDegree,
                      borderRadius: BorderRadius.circular(AppPadding.p6.sp)),
                  child: GestureDetector(
                    onTap: () => _showPicker(context),
                    child: Container(
                      height: AppPadding.p6.h,
                      width: AppPadding.p46.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(APPSize.s6.sp),
                        // color: buttonOnBoardingColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.camera,
                            style: TextStyle(
                                fontSize: FontSize.s14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: AppPadding.p8.w,
                          ),
                          const Icon(
                            Icons.add_a_photo_rounded,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: AppPadding.p5.h,
                      right: AppPadding.p5.w,
                      left: AppPadding.p5.w),
                  child: StreamBuilder<bool>(
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
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: AppPadding.p1.h,
                      right: AppPadding.p5.w,
                      left: AppPadding.p5.w),
                  child: StreamBuilder<bool>(
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
                ),
                StreamBuilder<bool>(
                  stream: _viewModel.outAllInputsValid,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: AppPadding.p3.h,
                          left: AppPadding.p5.w,
                          right: AppPadding.p5.w),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: ColorManger.darkBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(APPSize.s10.sp),
                            ),
                          ),
                          onPressed: (snapshot.data ?? false)
                              ? () {
                                  _viewModel.makeReport(context);
                                }
                              : null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(AppStrings.complete),
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
        height: AppPadding.p30.h,
        width: AppPadding.p50.w,
        decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: FileImage(image))),
      );
    } else {
      return SvgPicture.asset(ImageAsset.makeReport);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
