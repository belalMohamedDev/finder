import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finder/core/common/stateRenderer/state_renderer.dart';
import 'package:finder/core/common/stateRenderer/state_renderer_impl.dart';
import 'package:finder/feature/signUp/data/model/registerResponse/register_response.dart';
import 'package:finder/feature/signUp/data/model/requestBody/request_body.dart';
import 'package:finder/feature/signUp/data/repository/register_repo.dart';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState<dynamic>> {
  RegisterCubit(this._imagePicker, this._registerRepository)
      : super(const RegisterState.initial());

  final ImagePicker _imagePicker;

  final RegisterRepository _registerRepository;

  final TextEditingController userFirstName = TextEditingController();
  final TextEditingController userLastName = TextEditingController();
  final TextEditingController userPassword = TextEditingController();
  final TextEditingController userPhone = TextEditingController();
  final TextEditingController userAddress = TextEditingController();
  final formKey = GlobalKey<FormState>();
  dynamic image = '';
  File newImage = File('');
  bool showPass = true;

  void showPassword() {
    showPass = !showPass;

    emit(
      RegisterState.showPassword(showPass),
    );
  }

  Future<void> register() async {
    final userName = '${userFirstName.text} ${userLastName.text}';

    emit(
      RegisterState.loading(
        LoadingState(
          stateRenderType: StateRenderType.popupLoadingState,
          message: '',
        ),
      ),
    );

    final response = await _registerRepository.register(
      RegisterRequestBody(
          name: userName,
          password: userPassword.text,
          address: userAddress.text,
          phone: userPhone.text,
          image: newImage),
    );

    response.when(
      success: (registerResponse) {
        emit(RegisterState.success(registerResponse));
      },
      failure: (error) {
        emit(
          RegisterState.error(
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
      RegisterState.imagePath(File(pickedImage?.path ?? '')),
    );
  }

  Future<void> gallery() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    await setUserPicture(File(pickedImage?.path ?? ''));
    emit(
      RegisterState.imagePath(File(pickedImage?.path ?? '')),
    );
  }




  ////return path and upload image
  Future<dynamic> setUserPicture(File userPicture) async {
    if (userPicture.path.isNotEmpty) {
      //update register view object
      newImage = userPicture;

      image = MultipartFile.fromFileSync(
        userPicture.path,
        filename: userPicture.path.split(Platform.pathSeparator).last,
      );

    }
  }
}
