import 'package:finder/core/common/stateRenderer/state_renderer.dart';
import 'package:finder/core/common/stateRenderer/state_renderer_impl.dart';
import 'package:finder/feature/login/data/model/loginResponse/login_response.dart';

import 'package:finder/feature/login/data/model/requestBody/request_body.dart';
import 'package:finder/feature/login/data/repository/login_repo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState<dynamic>> {
  LoginCubit(this._loginRepository) : super(const LoginState.initial());

  final LoginRepository _loginRepository;
  final TextEditingController userPhone = TextEditingController();
  final TextEditingController userPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool showPass = true;

  void showPassword() {
    showPass = !showPass;

    emit(
      LoginState.showPassword(showPass),
    );
  }

  Future<void> login() async {
    emit(
      LoginState.loading(
        LoadingState(
          stateRenderType: StateRenderType.popupLoadingState,
          message: '',
        ),
      ),
    );

    final response = await _loginRepository.login(
      LoginRequestBody(
        phone: userPhone.text,
        password: userPassword.text,
      ),
    );

    response.when(
      success: (loginResponse) {
      
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
      
        emit(
          LoginState.error(
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
