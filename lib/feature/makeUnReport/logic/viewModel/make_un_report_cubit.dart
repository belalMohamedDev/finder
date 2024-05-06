import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finder/core/common/stateRenderer/state_renderer.dart';
import 'package:finder/core/common/stateRenderer/state_renderer_impl.dart';
import 'package:finder/feature/makeUnReport/data/model/requestBody/request_body.dart';
import 'package:finder/feature/makeUnReport/data/repository/make_un_report_repo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'make_un_report_state.dart';
part 'make_un_report_cubit.freezed.dart';

class MakeUnReportCubit extends Cubit<MakeUnReportState<dynamic>> {
  MakeUnReportCubit(this._imagePicker, this._makeUnReportRepository)
      : super(const MakeUnReportState.initial());
  final ImagePicker _imagePicker;
  final MakeUnReportRepository _makeUnReportRepository;

  final TextEditingController userAddress = TextEditingController();
  final TextEditingController userDescription = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File newImage = File('');
  dynamic image = '';

  Future<void> makeUnReport() async {
    emit(
      MakeUnReportState.loading(
        LoadingState(
          stateRenderType: StateRenderType.popupLoadingState,
          message: '',
        ),
      ),
    );

    final response = await _makeUnReportRepository.makeUnReport(
      MakeUnReportRequestBody(
          address: userAddress.text,
          description: userDescription.text,
          image: newImage),
    );

    response.when(
      success: (registerResponse) {
       
        emit(MakeUnReportState.success(
          SuccessState(
            stateRenderType: StateRenderType.popupSuccessState,
            message: '',
          ),
        ));
      },
      failure: (error) {
     
        emit(
          MakeUnReportState.error(
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
      MakeUnReportState.imagePath(File(pickedImage?.path ?? '')),
    );
  }

  Future<void> gallery() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    await setUserPicture(File(pickedImage?.path ?? ''));
    emit(
      MakeUnReportState.imagePath(File(pickedImage?.path ?? '')),
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
