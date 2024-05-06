import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:finder/core/common/stateRenderer/state_renderer.dart';
import 'package:finder/core/common/stateRenderer/state_renderer_impl.dart';
import 'package:finder/core/services/shared_pref/pref_keys.dart';
import 'package:finder/core/services/shared_pref/shared_pref.dart';
import 'package:finder/feature/profile/data/model/response/user_response.dart';
import 'package:finder/feature/updatePassword/data/model/requestBody/updateMyPassword/update_my_password_request_body.dart';
import 'package:finder/feature/updatePassword/data/repository/updatePassword/update_my_password_repo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_password_state.dart';
part 'update_password_cubit.freezed.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState<dynamic>> {
  UpdatePasswordCubit(this._updatePasswordRepository)
      : super(const UpdatePasswordState.initial());
  final UpdatePasswordRepository _updatePasswordRepository;
  final TextEditingController userCurrentPassword = TextEditingController();
  final TextEditingController userNewPassword = TextEditingController();
  final TextEditingController userNewPasswordConfirm = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool showCurrentPassword = true;
  bool showNewPassword = true;
  bool showConfirmPassword = true;

  void showCurrentPass() {
    showCurrentPassword = !showCurrentPassword;

    emit(
      UpdatePasswordState.showCurrentPassword(showCurrentPassword),
    );
  }

  void showConfirmPass() {
    showConfirmPassword = !showConfirmPassword;

    emit(
      UpdatePasswordState.showConfirmPassword(showConfirmPassword),
    );
  }

  void showNewPass() {
    showNewPassword = !showNewPassword;

    emit(
      UpdatePasswordState.showNewPassword(showNewPassword),
    );
  }

  Future<void> updatePassword() async {

    emit(
      UpdatePasswordState.loading(
        LoadingState(
          stateRenderType: StateRenderType.popupLoadingState,
          message: '',
        ),
      ),
    );

    final response = await _updatePasswordRepository.updatePassword(
      UpdatePasswordRequestBody(
        currentPassword: userCurrentPassword.text,
        password: userNewPassword.text,
        passwordConfirm: userNewPasswordConfirm.text,
      ),
    );

    response.when(
      success: (updatePassword) {
        SharedPref().setString(PrefKeys.userToken, updatePassword.token);

        emit(UpdatePasswordState.success(updatePassword));
      },
      failure: (error) {
        emit(
          UpdatePasswordState.error(
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
}
