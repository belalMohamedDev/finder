import 'dart:async';
import 'dart:ffi';



import 'package:finder/presentation/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../application/app_prefs.dart';
import '../../../../application/di.dart';
import '../../../../domain/models/reports/reports_model.dart';
import '../../../../domain/useCase/reports/reports_use_case.dart';
import '../../../common/stateRenderer/state_renderer.dart';
import '../../../common/stateRenderer/state_renderer_impl.dart';



class SpecificReportViewModel extends BaseViewModel
    with SpecificReportViewModelInput, SpecificReportViewModelOutput {
  final StreamController _dataStreamController = BehaviorSubject<List<DataModel>>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final ReportUseCase _reportUseCase;
  SpecificReportViewModel(this._reportUseCase);
  late List<DataModel> getData ;
  late List<DataModel> dataApi ;

  // --input
  @override
  void start() {
    // load data from api
    _getMissingData();
  }

  _getMissingData() async {
    inputState.add(LoadingState(
        stateRenderType: StateRenderType.fullScreenLoadingState, message: ''));

    (await  _reportUseCase.execute(Void)).fold(
            (failure) => {
          // left -> failure


          inputState.add(ErrorState(
                                 stateRenderType: StateRenderType.fullScreenErrorState,
                  message: failure.message,
                               )),





        }, (dataFound) {
      //right -> data(success)

      //content

      dataApi=dataFound.data!;
      getData=  dataApi.where((element) =>
      element.attributes!.userId==_appPreferences.isAccessId())
          .toList();


      //content
      inputState.add(ContentState());
      //navigate to main screen
      inputData.add(getData);
    });
  }

  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputData => _dataStreamController.sink;

  // -- output
  @override
  Stream<List<DataModel>> get outputData =>
      _dataStreamController.stream.map((data) => data);
}

abstract class SpecificReportViewModelInput {
  Sink get inputData;
}

abstract class SpecificReportViewModelOutput {
  Stream<List<DataModel>> get outputData;
}
