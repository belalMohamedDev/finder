import 'dart:async';

import 'package:finder/application/constant.dart';
import 'package:finder/domain/useCase/login_use_case.dart';
import 'package:finder/presentation/base/base_view_model.dart';
import 'package:finder/presentation/common/stateRenderer/state_renderer.dart';
import 'package:finder/presentation/resources/route_manger.dart';
import 'package:flutter/cupertino.dart';

import '../../../application/app_prefs.dart';
import '../../../application/di.dart';
import '../../common/freezed_data_classes.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInput, LoginViewModelOutput {
//stream
  final StreamController _nationalIdStreamController =
      StreamController.broadcast();

  final StreamController _passwordStreamController =
      StreamController.broadcast();

  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController<bool>();

//object instance
  var loginObject = LoginObject("", "");
  bool showPass = true;
  final LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);
  final AppPreferences _appPreferences = instance<AppPreferences>();
  String? imageData;

//inputs
  @override
  void dispose() {
    super.dispose();
    _nationalIdStreamController.close();
    _passwordStreamController.close();
    _areAllInputsValidStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
  }

  @override
  void start() {
    // view model should tell view please show content state
    inputState.add(ContentState());
  }

  @override
  void login() async {
    inputState.add(LoadingState(
        stateRenderType: StateRenderType.popupLoadingState, message: ''));

    (await _loginUseCase.execute(
            LoginUseCaseInput(loginObject.nationalId, loginObject.password)))
        .fold(
            (failure) => {
                  // left -> failure
                  inputState.add(ErrorState(
                    stateRenderType: StateRenderType.popupErrorState,
                    message: failure.message,
                  )),
                }, (data) {
      //right -> data(success)

      //content
      inputState.add(ContentState());
      //navigate to main screen
      isUserLoggedInSuccessfullyStreamController.add(true);

      // storage data in app preference
           imageData="${Constant.baseUrl}/storage/${data.user?.attribute?.picture}";
      _appPreferences.setLoginScreenData(
          tokenValue: data.accessToken,
          nameValue: data.user!.attribute!.name,
          phoneValue: data.user!.attribute!.phoneNumber,
          imageValue: imageData!,
          addressValue: data.user!.attribute!.address,
          nationalIdValue: data.user!.attribute!.nationalId);
    });
  }

  @override
  void signUp(context) {
    Navigator.pushReplacementNamed(
      context,
      Routes.registerRoute,
    );
  }

  @override
  setNationalId(String nationalId) {
    inputNationalId.add(nationalId);
    loginObject = loginObject.copyWith(nationalId: nationalId);
    inputAreAllInputsValid.add(null);
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputAreAllInputsValid.add(null);
  }

  @override
  Sink get inputNationalId => _nationalIdStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  //outputs
  @override
  Stream<bool> get outIsNationalIdValid => _nationalIdStreamController.stream
      .map((nationalId) => _isNationalIdValid(nationalId));

  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream.map((_) => _areAllInputValid());

  bool _isNationalIdValid(String nationalId) {
    return nationalId.isNotEmpty;
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _areAllInputValid() {
    return _isPasswordValid(loginObject.password) &&
        _isNationalIdValid(loginObject.nationalId);
  }
}

//on boarding function input
abstract class LoginViewModelInput {
  setNationalId(String nationalId);
  setPassword(String password);
  login(); //post data and return model from apis ,storage in shared preference and go to home
  signUp(context); // navigate to sign up screen
  Sink get inputNationalId;
  Sink get inputPassword;
  Sink get inputAreAllInputsValid;
}

//on boarding function output
abstract class LoginViewModelOutput {
  Stream<bool> get outIsNationalIdValid;
  Stream<bool> get outIsPasswordValid;
  Stream<bool> get outAreAllInputsValid;
}
