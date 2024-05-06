import 'package:bloc/bloc.dart';

import 'package:finder/feature/getFoundReportsScreen/data/model/foundResponse/found_response.dart';
import 'package:finder/feature/getFoundReportsScreen/data/model/requestParam/request_param.dart';
import 'package:finder/feature/getFoundReportsScreen/data/repositories/found_repo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_found_state.dart';
part 'get_found_cubit.freezed.dart';

class GetFoundCubit extends Cubit<GetFoundState<dynamic>> {
  GetFoundCubit(this._getFoundRepository)
      : super(const GetFoundState.initial());
  final GetFoundRepository _getFoundRepository;
  final TextEditingController search = TextEditingController();
  final List<GetFoundData> dataList = [];
  List<GetFoundData>? searchList;
  int page = 1;

  Future<void> getFound({fromPagination = false}) async {
    if (fromPagination) {
      emit(const GetFoundState.getRebortsFromPaginationLoadingState());
    } else {
      emit(const GetFoundState.loading());
    }

    final response = await _getFoundRepository
        .getFound(GetFoundReportQueries(limit: 20, page: page));

    response.when(
      success: (getFoundResponse) {
        if (getFoundResponse.data!.isNotEmpty) {
          dataList.addAll(getFoundResponse.data!);
          page++;
        }

        emit(GetFoundState.success(getFoundResponse.data!));
      },
      failure: (error) {
        emit(
          GetFoundState.error(
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
      GetFoundState.addItemToList(searchList!),
    );
  }
}
