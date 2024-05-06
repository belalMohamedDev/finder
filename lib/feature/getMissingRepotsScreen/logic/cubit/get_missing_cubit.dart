import 'package:bloc/bloc.dart';
import 'package:finder/feature/getMissingRepotsScreen/data/model/missingResponse/missing_response.dart';
import 'package:finder/feature/getMissingRepotsScreen/data/model/requestParam/request_param.dart';
import 'package:finder/feature/getMissingRepotsScreen/data/repositories/missing_repo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_missing_state.dart';
part 'get_missing_cubit.freezed.dart';

class GetMissingCubit extends Cubit<GetMissingState<dynamic>> {
  GetMissingCubit(this._getMissingRepository)
      : super(const GetMissingState.initial());
  final GetMissingRepository _getMissingRepository;
  final TextEditingController search = TextEditingController();
  final List<GetMissingData> dataList = [];
  List<GetMissingData>? searchList;
  int page = 1;

  Future<void> getMissing({fromPagination = false}) async {
    if (fromPagination) {
      emit(const GetMissingState.getUnRebortsFromPaginationLoadingState());
    } else {
      emit(const GetMissingState.loading());
    }

    final response = await _getMissingRepository
        .getMissing(GetMissingReportQueries(page: page, limit: 20));

    response.when(
      success: (getMissingResponse) {
        if (getMissingResponse.data!.isNotEmpty) {
          dataList.addAll(getMissingResponse.data!);
          page++;
        }

        emit(GetMissingState.success(getMissingResponse.data!));
      },
      failure: (error) {
        emit(
          GetMissingState.error(
              errorCode: error.statusCode!, errorMessage: error.message!),
        );
      },
    );
  }

  void addItemToList(String value) {
    searchList = dataList
        .where((element) => element.address!.toLowerCase().startsWith(value))
        .toList();

    emit(
      GetMissingState.addItemToList(searchList!),
    );
  }
}
