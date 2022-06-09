import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:finder/domain/useCase/makeReport/make_report_use_case.dart';
import 'package:finder/presentation/base/base_view_model.dart';
import 'package:finder/presentation/common/freezed_data_classes.dart';

import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';
import '../../../application/di.dart';
import '../../common/stateRenderer/state_renderer.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';


class MakingReportViewModel extends BaseViewModel
    with MakingReportViewModelInput, MakingReportViewModelOutPut {
  //stream
  final StreamController _nameStreamController = BehaviorSubject();
  final StreamController _nationalIdStreamController = BehaviorSubject();
  final StreamController _ageStreamController = BehaviorSubject();
  final StreamController _areaStreamController = BehaviorSubject();
  final StreamController _genderStreamController = BehaviorSubject();
  final StreamController _pictureStreamController =
      StreamController<File>.broadcast();
  final StreamController _clothesLastSeenWearingStreamController =
      BehaviorSubject();
  final StreamController _birthmarkStreamController = BehaviorSubject();
  final StreamController _isNextCompleteStreamController =
      BehaviorSubject<void>();
  final StreamController _isALLCompleteStreamController =
      BehaviorSubject<void>();

  // object instance
  var makeReportObject = MakeReportObject("", "", "", "", "", "", "", "");
  final ImagePicker _imagePicker = instance<ImagePicker>();
  final MakeReportUseCase _reportUseCase;
  MakingReportViewModel(this._reportUseCase);

  // input
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _nameStreamController.close();
    _nationalIdStreamController.close();
    _ageStreamController.close();
    _areaStreamController.close();
    _genderStreamController.close();
    _pictureStreamController.close();
    _clothesLastSeenWearingStreamController.close();
    _birthmarkStreamController.close();
    _isNextCompleteStreamController.close();
    _isALLCompleteStreamController.close();
    super.dispose();
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
  void makeReport(context) async {
    inputState.add(LoadingState(
        stateRenderType: StateRenderType.popupLoadingState, message: ''));

    (await _reportUseCase.execute(MakeReportUseCaseInput(
      makeReportObject.name,
      makeReportObject.nationalId,
      makeReportObject.age,
      makeReportObject.area,
      makeReportObject.gender,
      makeReportObject.picture,
      makeReportObject.clothesLastSeenWearing,
      makeReportObject.birthmark,
    )))
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
                }, (data) async {
      //right -> data(success)

      inputState.add(SuccessState(
          stateRenderType: StateRenderType.popupSuccessState, message: ''));

      Timer(const Duration(seconds: 3), () {
        inputState.add(ContentState());

      },);
    });
  }

  @override
  Sink get inputAge => _ageStreamController.sink;

  @override
  Sink get inputAllInputsValid => _isALLCompleteStreamController.sink;

  @override
  Sink get inputAllTextInputsValid => _isNextCompleteStreamController.sink;

  @override
  Sink get inputArea => _areaStreamController.sink;

  @override
  Sink get inputBirthmark => _birthmarkStreamController.sink;

  @override
  Sink get inputClothesLastSeenWearing =>
      _clothesLastSeenWearingStreamController.sink;

  @override
  Sink get inputGender => _genderStreamController.sink;

  @override
  Sink get inputName => _nameStreamController.sink;

  @override
  Sink get inputNationalId => _nationalIdStreamController.sink;

  @override
  Sink get inputPicture => _pictureStreamController.sink;

  // output
  @override
  Stream<bool> get outAge =>
      _ageStreamController.stream.map((age) => _isAgeValid(age));

  @override
  Stream<bool> get outAllTextInputsValid =>
      _isNextCompleteStreamController.stream.map((_) => _areAllInputValid());

  @override
  Stream<bool> get outArea =>
      _areaStreamController.stream.map((area) => _isStringDataValid(area));

  @override
  Stream<bool> get outBirthmark =>
      _birthmarkStreamController.stream.map((mark) => _isStringDataValid(mark));

  @override
  Stream<bool> get outClothesLastSeenWearing =>
      _clothesLastSeenWearingStreamController.stream
          .map((cloth) => _isStringDataValid(cloth));

  @override
  Stream<bool> get outGender =>
      _genderStreamController.stream.map((gender) => _isGenderValid(gender));

  @override
  Stream<bool> get outAllInputsValid =>
      _isALLCompleteStreamController.stream.map((_) => _areAllValid());

  @override
  Stream<bool> get outName =>
      _nameStreamController.stream.map((name) => _isStringDataValid(name));

  @override
  Stream<bool> get outNationalId => _nationalIdStreamController.stream
      .map((nationalId) => _isNationalIdValid(nationalId));

  @override
  Stream<File> get outPicture =>
      _pictureStreamController.stream.map((file) => file);

// private function

  bool _isAgeValid(String age) {
    return age.length <= 3;
  }

  bool _isStringDataValid(data) {
    return RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
        .hasMatch(data);
  }

  bool _isGenderValid(gender) {
    return gender.length >= 3;
  }

  bool _isNationalIdValid(String nationalId) {
    return nationalId.length == 14;
  }

  @override
  setUserAge(String userAge) {
    inputAge.add(userAge);
    if (_isAgeValid(userAge)) {
      //update register view object
      makeReportObject = makeReportObject.copyWith(age: userAge);
    } else {
      // rest user name value in register view object
      makeReportObject = makeReportObject.copyWith(age: "");
    }
    validate();
  }

  @override
  setUserArea(String userArea) {
    inputArea.add(userArea);
    if (_isStringDataValid(userArea)) {
      //update register view object
      makeReportObject = makeReportObject.copyWith(area: userArea);
    } else {
      // rest user name value in register view object
      makeReportObject = makeReportObject.copyWith(area: "");
    }
    validate();
  }

  @override
  setUserBirthmark(String userBirthmark) {
    inputBirthmark.add(userBirthmark);
    if (_isStringDataValid(userBirthmark)) {
      //update register view object
      makeReportObject = makeReportObject.copyWith(birthmark: userBirthmark);
    } else {
      // rest user name value in register view object
      makeReportObject = makeReportObject.copyWith(birthmark: "");
    }
    validate();
  }

  @override
  setUserClothesLastSeenWearing(String userClothesLastSeenWearing) {
    inputClothesLastSeenWearing.add(userClothesLastSeenWearing);
    if (_isStringDataValid(userClothesLastSeenWearing)) {
      //update register view object
      makeReportObject = makeReportObject.copyWith(
          clothesLastSeenWearing: userClothesLastSeenWearing);
    } else {
      // rest user name value in register view object
      makeReportObject = makeReportObject.copyWith(clothesLastSeenWearing: "");
    }
    validate();
  }

  @override
  setUserGender(String userGender) {
    inputGender.add(userGender);
    if (_isGenderValid(userGender)) {
      //update register view object
      makeReportObject = makeReportObject.copyWith(gender: userGender);
    } else {
      // rest user name value in register view object
      makeReportObject = makeReportObject.copyWith(gender: "");
    }
    validate();
  }

  @override
  setUserName(String userName) {
    inputName.add(userName);
    if (_isStringDataValid(userName)) {
      //update register view object
      makeReportObject = makeReportObject.copyWith(name: userName);
    } else {
      // rest user name value in register view object
      makeReportObject = makeReportObject.copyWith(name: "");
    }
    validate();
  }

  @override
  setUserNationalId(String userId) {
    inputNationalId.add(userId);
    if (_isNationalIdValid(userId)) {
      //update register view object
      makeReportObject = makeReportObject.copyWith(nationalId: userId);
    } else {
      // rest user name value in register view object
      makeReportObject = makeReportObject.copyWith(nationalId: "");
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
      makeReportObject = makeReportObject.copyWith(picture: image);
    } else {
      // rest user name value in register view object
      makeReportObject = makeReportObject.copyWith(picture: "");
    }
    validate();
  }

  bool _areAllInputValid() {
    return makeReportObject.name.isNotEmpty &&
        makeReportObject.clothesLastSeenWearing.isNotEmpty &&
        makeReportObject.age.isNotEmpty &&
        makeReportObject.area.isNotEmpty &&
        makeReportObject.gender.isNotEmpty;
  }

  bool _areAllValid() {
    return makeReportObject.birthmark.isNotEmpty &&
        makeReportObject.nationalId.isNotEmpty;
  }

  validate() {
    inputAllTextInputsValid.add(null);
    inputAllInputsValid.add(null);
  }
}

abstract class MakingReportViewModelInput {
  void camera(); // open camera and upload photo
  void gallery(); // open gallery and upload photo
  void makeReport(context); // post and storage data, and register
  Sink get inputName;
  Sink get inputNationalId;
  Sink get inputAge;
  Sink get inputArea;
  Sink get inputGender;
  Sink get inputPicture;
  Sink get inputClothesLastSeenWearing;
  Sink get inputBirthmark;
  Sink get inputAllTextInputsValid;
  Sink get inputAllInputsValid;
  setUserName(String userName);
  setUserNationalId(String userId);
  setUserAge(String userAge);
  setUserArea(String userArea);
  setUserGender(String userGender);
  setUserClothesLastSeenWearing(String userClothesLastSeenWearing);
  setUserPicture(File userPicture);
  setUserBirthmark(String userBirthmark);
}

abstract class MakingReportViewModelOutPut {
  Stream<bool> get outName;
  Stream<bool> get outNationalId;
  Stream<bool> get outAge;
  Stream<bool> get outArea;
  Stream<bool> get outGender;
  Stream<File> get outPicture;
  Stream<bool> get outClothesLastSeenWearing;
  Stream<bool> get outBirthmark;
  Stream<bool> get outAllTextInputsValid;
  Stream<bool> get outAllInputsValid;
}
