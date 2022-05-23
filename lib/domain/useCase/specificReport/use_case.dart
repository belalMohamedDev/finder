
import 'package:dartz/dartz.dart';
import 'package:finder/data/network/failure/failure.dart';
import 'package:finder/domain/models/makeSpecificReport/model.dart';

import 'package:finder/domain/repository/repositry.dart';
import '../base/base_use_case.dart';

class SpecificReportUseCase
    implements BaseUseCase<void, MakeSpecificReportModel> {
  final Repositry _repositry;
  SpecificReportUseCase(this._repositry);
  @override
  Future<Either<Failure, MakeSpecificReportModel>> execute(
      void input) async {
    return await _repositry.getSpecificReports();
  }
}


