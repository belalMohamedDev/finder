import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:finder/data/datasource/localData/report/local_data_source.dart';
import 'package:finder/domain/useCase/logOut/log_out_use_case.dart';

import 'package:finder/presentation/base/base_view_model.dart';
import 'package:finder/presentation/common/freezed_data_classes.dart';



import '../../../application/app_prefs.dart';
import '../../../application/di.dart';

import '../../../data/datasource/localData/unReport/un_report_local_data.dart';
import '../../common/stateRenderer/state_renderer.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';
import '../../resources/strings_manger.dart';

class ProfileViewModel extends BaseViewModel with ProfileViewModelInput ,ProfileViewModelOutput {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final LocalDataSource _localDataSource =instance<LocalDataSource>();
  final UnReportLocalDataSource _unReportLocalDataSource=instance<UnReportLocalDataSource>();
  final LogOutUseCase _logOutUseCase;
  // final UpdateUserUseCase _updateUserUseCase;
  var updateUserObject = UpdateUserObject("", "", "", "", "", "", "");
  //final ImagePicker _imagePicker = instance<ImagePicker>();

  ProfileViewModel(this._logOutUseCase,
    //  this._updateUserUseCase
      );
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





  @override
  void start() {
    // view model should tell view please show content state
    inputState.add(ContentState());
  }

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
  void logOut(context)async {

    inputState.add(LoadingState(
        stateRenderType: StateRenderType.popupLoadingState, message: ''));

    (await _logOutUseCase.execute(
        Void
  ))
        .fold(
    (failure) => {
    // left -> failure
      if (failure.code == -6)
        {
          inputState.add(InternetConnectionState(
            stateRenderType:
            StateRenderType.popupInternetConnectionState,
            message: failure.message,
          )),
        }
      else
        {
          inputState.add(ErrorState(
            stateRenderType: StateRenderType.popupErrorState,
            message: failure.message,
          )),
        }

    }, (data)  {
    //right -> data(success)


    //content
    inputState.add(ContentState());
    //navigate to login screen
    // remove data in app preference
      _appPreferences.removeData();
      _localDataSource.clearCache();
      _unReportLocalDataSource.clearCache();
    isUserLoggedInSuccessfullyStreamController.add(true);


    });
  }



  //-----input
  @override
  Sink get inputAddress => _addressStreamController.sink;

  @override
  Sink get inputAllInputValid => _allInputValidStreamController.sink;

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputName => _nameStreamController.sink;

  @override
  Sink get inputNationalId => _nationalIdStreamController.sink;

  @override
  Sink get inputPassword =>_passwordStreamController.sink;

  @override
  Sink get inputPhone => _phoneStreamController.sink;

  @override
  Sink get inputPicture => _pictureStreamController.sink;




  //------output

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




  //set data
  @override
  setUserAddress(String userAddress) {
    inputAddress.add(userAddress);
    if (_addressValid(userAddress)) {
      //update register view object

      updateUserObject = updateUserObject.copyWith(address: userAddress);
    } else {
      // rest user name value in register view object
      updateUserObject = updateUserObject.copyWith(address: "");
    }
    validate();
  }

  @override
  setUserEmail(String userEmail) {
    inputEmail.add(userEmail);
    if (_emailValid(userEmail)) {
      //update register view object
      updateUserObject = updateUserObject.copyWith(email: userEmail);
    } else {
      // rest user name value in register view object
      updateUserObject = updateUserObject.copyWith(email: "");
    }
    validate();
  }

  @override
  setUserName(String userName) {
    inputName.add(userName);
    if (_nameValid(userName)) {
      //update register view object
      updateUserObject = updateUserObject.copyWith(name: userName);
    } else {
      // rest user name value in register view object
      updateUserObject = updateUserObject.copyWith(name: "");
    }
    validate();
  }

  @override
  setUserNationalId(String userId) {
    inputNationalId.add(userId);
    if (_nationalIdValid(userId)) {
      //update register view object
      updateUserObject = updateUserObject.copyWith(nationalId: userId);
    } else {
      // rest user name value in register view object
      updateUserObject = updateUserObject.copyWith(nationalId: "");
    }
    validate();
  }

  @override
  setUserPassword(String userPassword) {
    inputPassword.add(userPassword.trim());
    if (_passwordValid(userPassword.trim())) {
      //update register view object
      updateUserObject = updateUserObject.copyWith(password: userPassword.trim());
    } else {
      // rest user name value in register view object
      updateUserObject = updateUserObject.copyWith(password: "");
    }
    validate();
  }

  @override
  setUserPhone(String userPhone) {
    inputPhone.add(userPhone);
    if (_phoneValid(userPhone)) {
      //update register view object

      updateUserObject = updateUserObject.copyWith(phoneNumber: userPhone);
    } else {
      // rest user name value in register view object
      updateUserObject = updateUserObject.copyWith(phoneNumber: "");
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

      updateUserObject = updateUserObject.copyWith(picture: image);
    } else {
      // rest user name value in register view object
      updateUserObject = updateUserObject.copyWith(picture: "");
    }
    validate();
  }




  //---private function

  bool _addressValid(String address) {
    return address.length >= 10;
  }

  bool _nameValid(String name) {
    return RegExp(r'^[a-z A-Z,.\-]+$').hasMatch(name);
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
    return updateUserObject.name.isNotEmpty ||
        updateUserObject.nationalId.isNotEmpty ||
        updateUserObject.phoneNumber.isNotEmpty ||
        updateUserObject.address.isNotEmpty ||
        updateUserObject.password.isNotEmpty ||
        updateUserObject.email.isNotEmpty ;


  }

  validate() {
    inputAllInputValid.add(null);
  }



}


abstract class ProfileViewModelInput{
  void logOut(context);
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
abstract class ProfileViewModelOutput{
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