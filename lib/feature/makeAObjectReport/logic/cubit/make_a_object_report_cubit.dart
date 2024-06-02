import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finder/core/common/stateRenderer/state_renderer.dart';
import 'package:finder/core/common/stateRenderer/state_renderer_impl.dart';
import 'package:finder/feature/makeAObjectReport/data/model/requestBody/request_body.dart';
import 'package:finder/feature/makeAObjectReport/data/repositories/make_report_object_repo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'make_a_object_report_state.dart';
part 'make_a_object_report_cubit.freezed.dart';

class MakeAObjectReportCubit extends Cubit<MakeAObjectReportState<dynamic>> {
  MakeAObjectReportCubit(this._imagePicker, this._makeAReportObjectRepository) : super(const MakeAObjectReportState.initial());
    final ImagePicker _imagePicker;
  final MakeAReportObjectRepository _makeAReportObjectRepository;

  final TextEditingController userAddress = TextEditingController();
  final TextEditingController userDescription = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File newImage = File('');
  dynamic image = '';

  Future<void> makeAObjectReport() async {
    emit(
      MakeAObjectReportState.loading(
        LoadingState(
          stateRenderType: StateRenderType.popupLoadingState,
          message: '',
        ),
      ),
    );

    final response = await _makeAReportObjectRepository.makeAReportObject(
      MakeAReportOjectRequestBody(
          address: userAddress.text,
          describtion: userDescription.text,
          image: newImage),
    );

    response.when(
      success: (registerResponse) {
        emit(MakeAObjectReportState.success(SuccessState(
          stateRenderType: StateRenderType.popupSuccessState,
          message: '',
        ),));
      },
      failure: (error) {
        emit(
          MakeAObjectReportState.error(
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
      MakeAObjectReportState.imagePath(File(pickedImage?.path ?? '')),
    );
  }

  Future<void> gallery() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    await setUserPicture(File(pickedImage?.path ?? ''));
    emit(
      MakeAObjectReportState.imagePath(File(pickedImage?.path ?? '')),
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
