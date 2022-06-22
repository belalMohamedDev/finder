import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:finder/domain/useCase/ai/use_case.dart';
import 'package:finder/presentation/base/base_view_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/freez/freezed_data_classes.dart';
import '../../common/stateRenderer/state_renderer.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';

class AiViewModel extends BaseViewModel
    with AiViewModelInput, AiViewModelOutput {
  final ImagePicker _imagePicker;
  final AiUseCase _aiUseCase;
  final StreamController _pictureStreamController =
      StreamController<File>.broadcast();
  var aiObject = AiObject("");
  AiViewModel(this._imagePicker, this._aiUseCase);
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _pictureStreamController.close();
    super.dispose();
  }

  @override
  void ai() async {
    if (aiObject.image.toString().isNotEmpty) {
      inputState.add(LoadingAiState(
          stateRenderType: StateRenderType.popupLoadingAiState, message: ''));

      (await _aiUseCase.execute(AiUseCaseInput(aiObject.image))).fold(
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
              }, (data) {
        //right -> data(success)



        if (data.result.trim() == "Match Found") {
          inputState.add(AiMatchState(
              stateRenderType: StateRenderType.popupMatchingAiState, message:data.result));



        } else if (data.result.trim() == "No Match Found!") {
          inputState.add(AiNotMatchState(
              stateRenderType: StateRenderType.popupNoMatchingAiState, message: data.result));


        } else if (data.result.trim() == "") {
          inputState.add(AiNotMatchState(
              stateRenderType: StateRenderType.popupNoMatchingAiState, message: 'Please Enter Face Picture'));


        }else{
          //content
          inputState.add(ContentState());
        }
      });
    }
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
  Sink get inputPicture => _pictureStreamController.sink;

  @override
  Stream<File> get outputPictureValid =>
      _pictureStreamController.stream.map((file) => file);

  @override
  setUserPicture(File userPicture) async {
    inputPicture.add(userPicture);
    if (userPicture.path.isNotEmpty) {
      //update register view object

      String fileName = userPicture.path.split("/").last;
      dynamic image =
          await MultipartFile.fromFile(userPicture.path, filename: fileName);

      aiObject = aiObject.copyWith(image: image);
    } else {
      // rest user name value in register view object
      aiObject = aiObject.copyWith(image: "");
    }
  }
}

abstract class AiViewModelInput {
  void camera(); // open camera and upload photo
  void gallery(); // open gallery and upload photo
  void ai(); //post ai
  Sink get inputPicture;
  setUserPicture(File userPicture);
}

abstract class AiViewModelOutput {
  Stream<File> get outputPictureValid;
}
