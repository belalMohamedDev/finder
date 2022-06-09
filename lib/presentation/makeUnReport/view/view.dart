import 'dart:io';

import 'package:finder/presentation/resources/asset_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../application/di.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';
import '../../resources/color_manger.dart';
import '../../resources/strings_manger.dart';
import '../../resources/values_manger.dart';
import '../viewModel/view_model.dart';

class MakeUnReportView extends StatefulWidget {
  const MakeUnReportView({Key? key}) : super(key: key);

  @override
  State<MakeUnReportView> createState() => _MakeUnReportViewState();
}

class _MakeUnReportViewState extends State<MakeUnReportView> {
  //instant
  final MakeUnReport _viewModel = instance<MakeUnReport>();
  final TextEditingController _userPolice = TextEditingController();
  final TextEditingController _userArea = TextEditingController();
  final List<String> items = [
   AppStrings.male,
    AppStrings.female,
  ];
  String? dropDownValue;
  final _formKey = GlobalKey<FormState>();
  _bind() {
    _viewModel.start();
    _userPolice.addListener(() => _viewModel.setUserPolice(_userPolice.text));
    _userArea.addListener(() => _viewModel.setUserArea(_userArea.text));
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
                _viewModel.makeUnReport(context);
              }) ??
              _getContentWidget();
        });
  }

  Widget _getContentWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.makeUnReport,
            style: TextStyle(color: ColorManger.lightBlack)),
        iconTheme: IconThemeData(color: ColorManger.lightBlack),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.h, left: 15, right: 15),
                child: Column(

                  children: [
                    Text(
                      AppStrings.putImage,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    StreamBuilder<File>(
                        stream: _viewModel.outPicture,
                        builder: (context, snapshot) {
                          return GestureDetector(
                              onTap: () => _showPicker(context),
                              child: _imagePicketByUser(snapshot.data));
                        }),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      AppStrings.putImageDetails,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    StreamBuilder<bool>(
                        stream: _viewModel.outPoliceStation,
                        builder: (context, snapshot) {
                          return TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            controller: _userPolice,
                            decoration: InputDecoration(
                              labelText: AppStrings.police,
                              hintText: AppStrings.police,
                              errorText: (snapshot.data ?? true)
                                  ? null
                                  : AppStrings.policeError,
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 11,
                    ),
                    StreamBuilder<bool>(
                        stream: _viewModel.outArea,
                        builder: (context, snapshot) {
                          return TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            controller: _userArea,
                            decoration: InputDecoration(
                              labelText:  AppStrings.last,
                              hintText:   AppStrings.last,
                              errorText: (snapshot.data ?? true)
                                  ? null
                                  : AppStrings.lastError,
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 11,
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
                    StreamBuilder<bool>(
                      stream: _viewModel.outAllInputValid,
                      builder: (context, snapshot) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: AppPadding.p2.h,
                          ),
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
                                      _viewModel.makeUnReport(context);
                                    }
                                  : null,
                              child: const Text(AppStrings.done),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
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
        height: AppPadding.p25.h,
        width: AppPadding.p50.w,
        decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: FileImage(image))),
      );
    } else {
      return SvgPicture.asset(ImageAsset.camera);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
