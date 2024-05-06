import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:finder/core/common/stateRenderer/state_renderer.dart';
import 'package:finder/core/common/stateRenderer/state_renderer_impl.dart';

import 'package:finder/core/services/shared_pref/pref_keys.dart';
import 'package:finder/core/services/shared_pref/shared_pref.dart';
import 'package:finder/feature/profile/data/model/requestBody/updateImage/update_image_request_body.dart';

import 'package:finder/feature/profile/data/model/response/user_response.dart';
import 'package:finder/feature/profile/data/repository/updateImage/update_image_repo.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._imagePicker,
    this._updateImageRepository,
  ) : super(const ProfileState.initial());

  final ImagePicker _imagePicker;

  final UpdateImageRepository _updateImageRepository;

  dynamic image = '';
  File newImage = File('');

  Future<void> logout() async {
    await SharedPref().removePreference(PrefKeys.userToken);
    await SharedPref().removePreference(PrefKeys.userAddress);
    await SharedPref().removePreference(PrefKeys.userImage);
    await SharedPref().removePreference(PrefKeys.userName);
    await SharedPref().removePreference(PrefKeys.userPhone);
    await SharedPref().removePreference(PrefKeys.isUserLoggedIn);

     
  }

  Future<void> updateImageProfile(File userPicture) async {
    emit(
      ProfileState.loading(
        LoadingState(
          stateRenderType: StateRenderType.popupLoadingState,
          message: '',
        ),
      ),
    );

    final response = await _updateImageRepository.updateImage(
      UpdateImageRequestBody(image: userPicture),
    );

    response.when(
      success: (updateImage) {
        SharedPref().setString(
            PrefKeys.userImage,
            updateImage.data?.image ??
                SharedPref().getString(PrefKeys.userImage));
        emit(ProfileState.success(updateImage));
      },
      failure: (error) {
        emit(
          ProfileState.error(
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

    updateImageProfile(File(pickedImage?.path ?? ''));

    emit(
      ProfileState.imagePath(File(pickedImage?.path ?? '')),
    );
  }

  Future<void> gallery() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    updateImageProfile(File(pickedImage?.path ?? ''));

    emit(
      ProfileState.imagePath(File(pickedImage?.path ?? '')),
    );
  }
}
