import 'dart:async';
import 'dart:ffi';

import 'package:finder/data/datasource/localData/report/local_data_source.dart';
import 'package:finder/domain/useCase/logOut/log_out_use_case.dart';

import 'package:finder/presentation/base/base_view_model.dart';




import '../../../application/app_prefs.dart';
import '../../../application/di.dart';

import '../../../data/datasource/localData/unReport/un_report_local_data.dart';
import '../../common/stateRenderer/state_renderer.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';

class ProfileViewModel extends BaseViewModel with ProfileViewModelInput ,ProfileViewModelOutput {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final LocalDataSource _localDataSource =instance<LocalDataSource>();
  final UnReportLocalDataSource _unReportLocalDataSource=instance<UnReportLocalDataSource>();
  final LogOutUseCase _logOutUseCase;
  // final UpdateUserUseCase _updateUserUseCase;


  ProfileViewModel(this._logOutUseCase,
    //  this._updateUserUseCase
      );
//stream

  final StreamController isUserLoggedInSuccessfullyStreamController =
  StreamController<bool>();





  @override
  void start() {
    // view model should tell view please show content state
    inputState.add(ContentState());
  }

  @override
  void dispose() {

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






















}


abstract class ProfileViewModelInput{
  void logOut(context);


}
abstract class ProfileViewModelOutput{

}