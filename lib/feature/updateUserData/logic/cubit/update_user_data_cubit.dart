import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:finder/core/common/stateRenderer/state_renderer.dart';
import 'package:finder/core/common/stateRenderer/state_renderer_impl.dart';
import 'package:finder/core/services/shared_pref/pref_keys.dart';
import 'package:finder/core/services/shared_pref/shared_pref.dart';
import 'package:finder/feature/profile/data/model/response/user_response.dart';
import 'package:finder/feature/updateUserData/data/model/requestBody/updateMyData/update_my_data_request_body.dart';

import 'package:finder/feature/updateUserData/data/repository/updateMyData/update_my_data_repo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_data_state.dart';
part 'update_user_data_cubit.freezed.dart';

class UpdateMyDataCubit extends Cubit<UpdateMyDataState<dynamic>> {
  UpdateMyDataCubit(this._updateMyDataRepository)
      : super(const UpdateMyDataState.initial());

  final UpdateMyDataRepository _updateMyDataRepository;

  final TextEditingController userFirstName = TextEditingController();
  final TextEditingController userLastName = TextEditingController();
  final TextEditingController userPhone = TextEditingController();
  final TextEditingController userAddress = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void start() {
    var userName = SharedPref().getString(PrefKeys.userName);
    userPhone.text = SharedPref().getString(PrefKeys.userPhone)!;
    userAddress.text = SharedPref().getString(PrefKeys.userAddress)!;
    userFirstName.text = userName!.split(' ')[0];
    userLastName.text = userName.split(' ')[1];
  }

  Future<void> updateUserData() async {
    final userName = '${userFirstName.text.trim()} ${userLastName.text.trim()}';

    emit(
      UpdateMyDataState.loading(
        LoadingState(
          stateRenderType: StateRenderType.popupLoadingState,
          message: '',
        ),
      ),
    );

    final response = await _updateMyDataRepository.updateMyData(
      UpdateMyDataRequestBody(
        name: userName,
        address: userAddress.text.trim(),
        phone: userPhone.text.trim(),
      ),
    );

    response.when(
      success: (updateUserData) {
        SharedPref().setString(PrefKeys.userName, updateUserData.data!.name);

        SharedPref()
            .setString(PrefKeys.userAddress, updateUserData.data!.address);

        SharedPref().setString(PrefKeys.userPhone, updateUserData.data!.phone);

        emit(UpdateMyDataState.success(updateUserData));
      },
      failure: (error) {
        emit(
          UpdateMyDataState.error(
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
