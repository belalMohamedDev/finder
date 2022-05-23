import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:finder/presentation/base/base_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';

import '../../../application/di.dart';
import '../../../domain/useCase/makeUnReport/make_un_report_use_case.dart';
import '../../common/freezed_data_classes.dart';
import '../../common/stateRenderer/state_renderer.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';

class MakeUnReport extends BaseViewModel with MakeUnReportInput,MakeUnReportOutput {
  final StreamController _areaStreamController =  StreamController.broadcast();
  final StreamController _genderStreamController = StreamController.broadcast();
  final StreamController _pictureStreamController = StreamController<File>.broadcast();
  final StreamController _isALLCompleteStreamController = BehaviorSubject<
      void>();
  final StreamController _policeStationStreamController = BehaviorSubject();

  // object instance
  var makeUnReportObject = MakeUnReportObject("", "", "", "");
  final ImagePicker _imagePicker = instance<ImagePicker>();
  final MakeUnReportUseCase _reportUseCase;
  String? imageData;
  // Initial Selected Value

  MakeUnReport(this._reportUseCase);


  // ----input------
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _areaStreamController.close();
    _genderStreamController.close();
    _pictureStreamController.close();
    _isALLCompleteStreamController.close();
    _policeStationStreamController.close();

    super.dispose();
  }


  @override
  Sink get inputAllInputValid => _isALLCompleteStreamController.sink;

  @override
  Sink get inputArea => _areaStreamController.sink;

  @override
  Sink get inputGender => _genderStreamController.sink;

  @override
  Sink get inputPicture => _pictureStreamController.sink;

  @override
  Sink get inputPoliceStation => _policeStationStreamController.sink;


  // ----output-----


  @override
  Stream<bool> get outAllInputValid =>
      _isALLCompleteStreamController.stream.map((_) => _areAllValid());

  @override
  Stream<bool> get outArea =>
      _areaStreamController.stream.map((area) => _isStringDataValid(area));

  @override
  Stream<bool> get outGender =>
      _genderStreamController.stream.map((gender) => _isGenderValid(gender));

  @override
  Stream<File> get outPicture =>
      _pictureStreamController.stream.map((file) => file);

  @override
  Stream<bool> get outPoliceStation =>
      _policeStationStreamController.stream.map((station) =>
          _isPoliceValid(station));


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
  void makeUnReport() async {

    inputState.add(LoadingState(
        stateRenderType: StateRenderType.popupLoadingState, message: ''));

    (await _reportUseCase.execute(MakeUnReportUseCaseInput(
      makeUnReportObject.area,
      makeUnReportObject.gender,
      makeUnReportObject.policeStation,
      makeUnReportObject.picture,
    )))
        .fold(
            (failure) =>
        {
          // left -> failure
          inputState.add(ErrorState(
            stateRenderType: StateRenderType.popupErrorState,
            message: failure.message,
          )),
        }, (data) async {
      //right -> data(success)

      inputState.add(ContentState());
      print("ok");
    });
  }

  @override
  setUserArea(String userArea) {
    inputArea.add(userArea);
    if (_isStringDataValid(userArea)) {
      makeUnReportObject = makeUnReportObject.copyWith(area: userArea);
    } else {
      // rest user name value in register view object
      makeUnReportObject = makeUnReportObject.copyWith(area: "");
    }
    validate();
  }

  @override
  setUserGender(String dropDownValue) {
    inputGender.add(dropDownValue);
    if (_isGenderValid(dropDownValue)) {
      makeUnReportObject = makeUnReportObject.copyWith(gender: dropDownValue);
    } else {
      // rest user name value in register view object
      makeUnReportObject = makeUnReportObject.copyWith(gender: "");
    }
    validate();
  }


  @override
  setUserPicture(File userPicture) async {
    inputPicture.add(userPicture);
    if (userPicture.path.isNotEmpty) {
      //update register view object
      String fileName = userPicture.path
          .split("/").last;
      dynamic image = await MultipartFile.fromFile(userPicture.path, filename: fileName);
      makeUnReportObject = makeUnReportObject.copyWith(picture: image);
    } else {
      // rest user name value in register view object
      makeUnReportObject = makeUnReportObject.copyWith(picture: "");
    }
    validate();
  }

  @override
  setUserPolice(String userPolice) {
    inputPoliceStation.add(userPolice);
    if (_isPoliceValid(userPolice)) {
      makeUnReportObject =
          makeUnReportObject.copyWith(policeStation: userPolice);
    } else {
      // rest user name value in register view object
      makeUnReportObject = makeUnReportObject.copyWith(policeStation: "");
    }
    validate();
  }


//---- private function


  bool _isStringDataValid(String data) {
    return data.length >= 5;
  }

  bool _isPoliceValid(String data) {
    return data.length >= 5;
  }


  bool _isGenderValid(String gender) {
      if (gender == "Male") {
        return gender == "Male";
      } else if (gender == "FeMale") {
        return gender == "FeMale";
      } else{
        return false;
    }
  }

  bool _areAllValid() {
    return makeUnReportObject.gender.isNotEmpty && makeUnReportObject.area.isNotEmpty &&makeUnReportObject.policeStation.isNotEmpty;

  }

  validate() {
    inputAllInputValid.add(null);
  }
}

abstract class MakeUnReportInput{
  Sink get inputArea;
  Sink get inputGender;
  Sink get inputPicture;
  Sink get inputPoliceStation;
  Sink get inputAllInputValid;
  void camera(); // open camera and upload photo
  void gallery(); // open gallery and upload photo
  void makeUnReport(); // post and storage data, and register
  setUserPolice(String userPolice);
  setUserArea(String userArea);
  setUserGender(String dropDownValue);
  setUserPicture(File userPicture);
}

abstract class MakeUnReportOutput{
  Stream<bool> get outArea;
  Stream<bool> get outGender;
  Stream<File> get outPicture;
  Stream<bool> get outPoliceStation;
  Stream<bool> get outAllInputValid;

}