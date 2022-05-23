


import 'package:dartz/dartz.dart';
import 'package:finder/domain/models/makeUnReport/make_un_report_model.dart';

import '../../../data/network/failure/failure.dart';
import '../../../data/network/request/request.dart';
import '../../repository/repositry.dart';
import '../base/base_use_case.dart';

class MakeUnReportUseCase implements BaseUseCase<MakeUnReportUseCaseInput,MakeUnReportModel>{
  final Repositry _repositry;
  MakeUnReportUseCase(this._repositry);
  @override
  Future<Either<Failure, MakeUnReportModel>> execute(MakeUnReportUseCaseInput input)async {
    return await _repositry.makeUnReport(MakeUnReportRequest(input.area, input.gender,input.policeStation,input.picture));
  }
}

class MakeUnReportUseCaseInput{
  String area;
  String gender;
  String policeStation;
  dynamic picture;
  MakeUnReportUseCaseInput(this.area,this.gender,this.policeStation,this.picture);
}