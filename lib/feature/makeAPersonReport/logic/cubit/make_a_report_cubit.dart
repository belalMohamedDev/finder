import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finder/core/common/stateRenderer/state_renderer.dart';
import 'package:finder/core/common/stateRenderer/state_renderer_impl.dart';
import 'package:finder/feature/makeAPersonReport/data/model/requestBody/request_body.dart';
import 'package:finder/feature/makeAPersonReport/data/repositories/make_report_repo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'make_a_report_state.dart';
part 'make_a_report_cubit.freezed.dart';

class MakeAReportCubit extends Cubit<MakeAReportState<dynamic>> {
  MakeAReportCubit(this._imagePicker, this._makeAReportRepository)
      : super(const MakeAReportState.initial());
  final ImagePicker _imagePicker;
  final MakeAReportRepository _makeAReportRepository;

  final TextEditingController userAddress = TextEditingController();
  final TextEditingController userDescription = TextEditingController();
  final TextEditingController userAge = TextEditingController();
  final TextEditingController userClothLastSeen = TextEditingController();
  final TextEditingController userFirstName = TextEditingController();
  final TextEditingController userLastName = TextEditingController();

  final formKey = GlobalKey<FormState>();
  File newImage = File('');
  dynamic image = '';

  Future<void> makeAReport() async {
    emit(
      MakeAReportState.loading(
        LoadingState(
          stateRenderType: StateRenderType.popupLoadingState,
          message: '',
        ),
      ),
    );

    
    final response = await _makeAReportRepository.makeAReport(
      MakeAReportRequestBody(
          name: '${userFirstName.text}${userLastName.text}',
          age: userAge.text,
          address: userAddress.text,
          clothesLastSeenWearing: userClothLastSeen.text,
          describtion: userDescription.text,
          image: newImage),
    );

    response.when(
      success: (registerResponse) {
        emit(MakeAReportState.success(
          SuccessState(
            stateRenderType: StateRenderType.popupSuccessState,
            message: '',
          ),
        ));
      },
      failure: (error) {
        emit(
          MakeAReportState.error(
            ErrorState(
              stateRenderType: error.statusCode == -6
                  ? StateRenderType.popupInternetConnectionState
                  : StateRenderType.popupErrorState,
              message: error.message!,
            ),
          ),
        );
      },
    );
  }

  /////image picker
  Future<void> camera() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.camera);
    await setUserPicture(File(pickedImage?.path ?? ''));
    emit(
      MakeAReportState.imagePath(File(pickedImage?.path ?? '')),
    );
  }

  Future<void> gallery() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    await setUserPicture(File(pickedImage?.path ?? ''));
    emit(
      MakeAReportState.imagePath(File(pickedImage?.path ?? '')),
    );
  }

  ////return path and upload image
  Future<dynamic> setUserPicture(File userPicture) async {
    if (userPicture.path.isNotEmpty) {
      //update register view object
      newImage = userPicture;

      final fileName = userPicture.path.split('/').last;
      image =
          await MultipartFile.fromFile(userPicture.path, filename: fileName);
    }
  }
}
