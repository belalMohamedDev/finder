
import 'package:dartz/dartz.dart';
import 'package:finder/data/network/failure/failure.dart';

import 'package:finder/domain/models/reports/reports_model.dart';
import 'package:finder/domain/repository/repositry.dart';
import '../base/base_use_case.dart';

class ReportUseCase
    implements BaseUseCase<void, ReportModel> {
  final Repositry _repositry;
  ReportUseCase(this._repositry);
  @override
  Future<Either<Failure, ReportModel>> execute(
      void input) async {
    return await _repositry.getReports();
  }
}


