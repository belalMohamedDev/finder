import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:finder/domain/useCase/register/register_use_case.dart';
import 'package:finder/presentation/base/base_view_model.dart';
import 'package:finder/presentation/common/freezed_data_classes.dart';
import 'package:finder/presentation/resources/strings_manger.dart';
import 'package:image_picker/image_picker.dart';

import '../../../application/app_prefs.dart';
import '../../../application/constant.dart';
import '../../../application/di.dart';
import '../../../domain/useCase/login/login_use_case.dart';
import '../../common/stateRenderer/state_renderer.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';

class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInput, RegisterViewModelOutput {
  //stream
  final StreamController _nameStreamController =
      StreamController<String>.broadcast();
  final StreamController _nationalIdStreamController =
      StreamController<String>.broadcast();
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _addressStreamController =
      StreamController<String>.broadcast();
  final StreamController _phoneStreamController =
      StreamController<String>.broadcast();
  final StreamController _pictureStreamController =
      StreamController<File>.broadcast();
  final StreamController _allInputValidStreamController =
      StreamController<void>.broadcast();
  final StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController<bool>();

  String? imageData;
  final RegisterUseCase _registerUseCase;
  final LoginUseCase _loginUseCase;
  var registerObject = RegisterObject("", "", "", "", "", "", "");
  final ImagePicker _imagePicker = instance<ImagePicker>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  RegisterViewModel(this._registerUseCase, this._loginUseCase);

  //input
  @override
  void dispose() {
    _nameStreamController.close();
    _nationalIdStreamController.close();
    _emailStreamController.close();
    _passwordStreamController.close();
    _phoneStreamController.close();
    _addressStreamController.close();
    _pictureStreamController.close();
    _allInputValidStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
    super.dispose();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void camera() async {
    var _pickedImage = await _imagePicker.pickImage(source: ImageSource.camera);
    setUserPicture(File(_pickedImage?.path ?? ""));
  }

  @override
  void gallery() async {
    var _pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    setUserPicture(File(_pickedImage?.path ?? ""));
  }

  @override
  void register() async {
    inputState.add(LoadingState(
        stateRenderType: StateRenderType.popupLoadingState, message: ''));

    (await _registerUseCase.execute(RegisterUseCaseInput(
            registerObject.name,
            registerObject.nationalId,
            registerObject.email,
            registerObject.password,
            registerObject.address,
            registerObject.phone,
            registerObject.picture)))
        .fold(
            (failure) => {
                  // left -> failure
                  inputState.add(ErrorState(
                    stateRenderType: StateRenderType.popupErrorState,
                    message: failure.message,
                  )),
                }, (data) async {
      //right -> data(success)

      //loading and send request to login
      inputState.add(LoadingState(
          stateRenderType: StateRenderType.popupLoadingState, message: ''));

      (await _loginUseCase.execute(LoginUseCaseInput(
              registerObject.nationalId, registerObject.password)))
          .fold(
              (failure) => {
                    // left -> failure
                    inputState.add(ErrorState(
                      stateRenderType: StateRenderType.popupErrorState,
                      message: failureMassage(failure),
                    )),
                  }, (data) {
        //right -> data(success)

        //content
        inputState.add(ContentState());
        //navigate to main screen
        isUserLoggedInSuccessfullyStreamController.add(true);

        // storage data in app preference
        imageData =
            "${Constant.baseUrl}/storage/${data.user?.attribute?.picture}";
        _appPreferences.setLoginScreenData(
            tokenValue: data.accessToken,
            nameValue: data.user!.attribute!.name,
            phoneValue: data.user!.attribute!.phoneNumber,
            imageValue: imageData!,
            addressValue: data.user!.attribute!.address,
            nationalIdValue: data.user!.attribute!.nationalId,
            id: data.user!.id);
      });
    });
  }

  String failureMassage(failure) {
    if (failure.code == 422) {
      return "Wrong User Information";
    } else if (failure.code == 404) {
      return "Not Found Server";
    } else {
      return failure.message;
    }
  }

  @override
  setUserAddress(String userAddress) {
    inputAddress.add(userAddress);
    if (_addressValid(userAddress)) {
      //update register view object
      registerObject = registerObject.copyWith(address: userAddress);
    } else {
      // rest user name value in register view object
      registerObject = registerObject.copyWith(address: "");
    }
    validate();
  }

  @override
  setUserEmail(String userEmail) {
    inputEmail.add(userEmail);
    if (_emailValid(userEmail)) {
      //update register view object
      registerObject = registerObject.copyWith(email: userEmail);
    } else {
      // rest user name value in register view object
      registerObject = registerObject.copyWith(email: "");
    }
    validate();
  }

  @override
  setUserName(String userName) {
    inputName.add(userName);
    if (_nameValid(userName)) {
      //update register view object
      registerObject = registerObject.copyWith(name: userName);
    } else {
      // rest user name value in register view object
      registerObject = registerObject.copyWith(name: "");
    }
    validate();
  }

  @override
  setUserNationalId(String userId) {
    inputNationalId.add(userId);
    if (_nationalIdValid(userId)) {
      //update register view object
      registerObject = registerObject.copyWith(nationalId: userId);
    } else {
      // rest user name value in register view object
      registerObject = registerObject.copyWith(nationalId: "");
    }
    validate();
  }

  @override
  setUserPassword(String userPassword) {
    inputPassword.add(userPassword.trim());
    if (_passwordValid(userPassword.trim())) {
      //update register view object
      registerObject = registerObject.copyWith(password: userPassword.trim());
    } else {
      // rest user name value in register view object
      registerObject = registerObject.copyWith(password: "");
    }
    validate();
  }

  @override
  setUserPhone(String userPhone) {
    inputPhone.add(userPhone);
    if (_phoneValid(userPhone)) {
      //update register view object
      registerObject = registerObject.copyWith(phone: userPhone);
    } else {
      // rest user name value in register view object
      registerObject = registerObject.copyWith(phone: "");
    }
    validate();
  }

  @override
  setUserPicture(File userPicture) async {
    inputPicture.add(userPicture);
    if (userPicture.path.isNotEmpty) {
      //update register view object
      String fileName = userPicture.path.split("/").last;
      dynamic image =
          await MultipartFile.fromFile(userPicture.path, filename: fileName);

      registerObject = registerObject.copyWith(picture: userPicture);
    } else {
      // rest user name value in register view object
      registerObject = registerObject.copyWith(picture: "");
    }
    validate();
  }

  @override
  Sink get inputAddress => _addressStreamController.sink;

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputName => _nameStreamController.sink;

  @override
  Sink get inputNationalId => _nationalIdStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputPhone => _phoneStreamController.sink;

  @override
  Sink get inputPicture => _pictureStreamController.sink;

  @override
  Sink get inputAllInputValid => _allInputValidStreamController.sink;

  //output

  @override
  Stream<bool> get outputAreAllInputValid =>
      _allInputValidStreamController.stream.map((_) => _areAllInputValid());

  @override
  Stream<String?> get outputAddressErrorValid => outputAddressValid
      .map((isUserName) => isUserName ? null : AppStrings.userAddressValid);

  @override
  Stream<bool> get outputAddressValid =>
      _addressStreamController.stream.map((address) => _addressValid(address));

  @override
  Stream<String?> get outputEmailErrorValid => outputEmailValid
      .map((isUserEmail) => isUserEmail ? null : AppStrings.userEmailValid);

  @override
  Stream<bool> get outputEmailValid =>
      _emailStreamController.stream.map((email) => _emailValid(email));

  @override
  Stream<String?> get outputNameErrorValid => outputNameValid
      .map((isUserName) => isUserName ? null : AppStrings.userNameValid);

  @override
  Stream<bool> get outputNameValid =>
      _nameStreamController.stream.map((name) => _nameValid(name));

  @override
  Stream<String?> get outputNationalIdErrorValid => outputNationalIdValid
      .map((isUserId) => isUserId ? null : AppStrings.userNationalNumberValid);

  @override
  Stream<bool> get outputNationalIdValid =>
      _nationalIdStreamController.stream.map((id) => _nationalIdValid(id));

  @override
  Stream<String?> get outputPasswordErrorValid => outputPasswordValid.map(
      (isUserPassword) => isUserPassword ? null : AppStrings.userPasswordValid);

  @override
  Stream<bool> get outputPasswordValid => _passwordStreamController.stream
      .map((password) => _passwordValid(password));

  @override
  Stream<String?> get outputPhoneErrorValid => outputPhoneValid
      .map((isUserPhone) => isUserPhone ? null : AppStrings.userPhoneValid);

  @override
  Stream<bool> get outputPhoneValid =>
      _phoneStreamController.stream.map((phone) => _phoneValid(phone));

  @override
  Stream<File> get outputPictureValid =>
      _pictureStreamController.stream.map((file) => file);

  //private function
  bool _addressValid(String address) {
    return address.length >= 10;
  }

  bool _nameValid(String name) {
    return RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
        .hasMatch(name);
  }

  bool _nationalIdValid(String id) {
    return id.length == 14;
  }

  bool _emailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0\d-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0\d-9](?:[a-zA-Z0\d-9-]{0,253}[a-zA-Z0\d-9])?(?:\.[a-zA-Z0\d-9](?:[a-zA-Z0\d-9-]{0,253}[a-zA-Z0\d-9])?)*$")
        .hasMatch(email);
  }

  bool _passwordValid(String password) {
    String pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }

  bool _phoneValid(String phone) {
    String pattern = r'^(?:[+0]9)?[0-9]{11}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(phone);
  }

  bool _areAllInputValid() {
    return registerObject.name.isNotEmpty &&
        registerObject.nationalId.isNotEmpty &&
        registerObject.email.isNotEmpty &&
        registerObject.password.isNotEmpty &&
        registerObject.phone.isNotEmpty &&
        registerObject.address.isNotEmpty;
  }

  validate() {
    inputAllInputValid.add(null);
  }
}

//on boarding function input
abstract class RegisterViewModelInput {
  void camera(); // open camera and upload photo
  void gallery(); // open gallery and upload photo
  void register(); // post and storage data, and register
  Sink get inputName;
  Sink get inputNationalId;
  Sink get inputEmail;
  Sink get inputPassword;
  Sink get inputPhone;
  Sink get inputAddress;
  Sink get inputPicture;
  Sink get inputAllInputValid;
  setUserName(String userName);
  setUserNationalId(String userId);
  setUserEmail(String userEmail);
  setUserPassword(String userPassword);
  setUserPhone(String userPhone);
  setUserAddress(String userAddress);
  setUserPicture(File userPicture);
}

//on boarding function output
abstract class RegisterViewModelOutput {
  Stream<bool> get outputNameValid;
  Stream<String?> get outputNameErrorValid;
  Stream<bool> get outputNationalIdValid;
  Stream<String?> get outputNationalIdErrorValid;
  Stream<bool> get outputEmailValid;
  Stream<String?> get outputEmailErrorValid;
  Stream<bool> get outputPasswordValid;
  Stream<String?> get outputPasswordErrorValid;
  Stream<bool> get outputPhoneValid;
  Stream<String?> get outputPhoneErrorValid;
  Stream<bool> get outputAddressValid;
  Stream<String?> get outputAddressErrorValid;
  Stream<File> get outputPictureValid;
  Stream<bool> get outputAreAllInputValid;
}
