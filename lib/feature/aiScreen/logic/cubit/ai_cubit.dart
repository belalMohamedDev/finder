import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finder/core/common/stateRenderer/state_renderer.dart';
import 'package:finder/core/common/stateRenderer/state_renderer_impl.dart';
import 'package:finder/feature/aiScreen/data/model/requestBody/request_body.dart';
import 'package:finder/feature/aiScreen/data/repositories/ai_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'ai_state.dart';
part 'ai_cubit.freezed.dart';

class AiCubit extends Cubit<AiState<dynamic>> {
  AiCubit(this._imagePicker, this._aiRepository)
      : super(const AiState.initial());

  final ImagePicker _imagePicker;
  final AiRepository _aiRepository;

  File newImage = File('');
  dynamic image = '';

  Future<void> ai() async {
    emit(
      AiState.loading(
        LoadingAiState(
          stateRenderType: StateRenderType.popupLoadingAiState,
          message: '',
        ),
      ),
    );

    final response = await _aiRepository.ai(
      AiRequestBody(image: newImage),
    );

    response.when(
      success: (aiResponse) {
        if (aiResponse.status == true) {
          emit(AiState.success(
            AiMatchState(
              stateRenderType: StateRenderType.popupMatchingAiState,
              message: aiResponse.message!,
            ),
          ));
        }else{
              emit(AiState.success(
            AiNotMatchState(
              stateRenderType: StateRenderType.popupNoMatchingAiState,
              message: aiResponse.message!,
            ),
          ));
        }
      },
      failure: (error) {
        emit(
          AiState.error(
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
    await setUserPicture(File(pickedImage?.path ?? ''));
    emit(
      AiState.imagePath(File(pickedImage?.path ?? '')),
    );
  }

  Future<void> gallery() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    await setUserPicture(File(pickedImage?.path ?? ''));
    emit(
      AiState.imagePath(File(pickedImage?.path ?? '')),
    );
  }

  ////return path and upload image
  Future<dynamic> setUserPicture(File userPicture) async {
    if (userPicture.path.isNotEmpty) {
      //update register view object
      newImage = userPicture;

      final fileName = userPicture.path.split('/').last;
      image =
          await MultipartFile.fromFile(userPicture.path, filename: fileName);
    }
  }
}
