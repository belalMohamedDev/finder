
import 'package:dartz/dartz.dart';
import 'package:finder/data/network/failure/failure.dart';

import 'package:finder/domain/repository/repositry.dart';
import '../../models/unReport/un_report_model.dart';
import '../base/base_use_case.dart';

class UnReportUseCase
    implements BaseUseCase<void, UnReportModel> {
  final Repositry _repositry;
  UnReportUseCase(this._repositry);
  @override
  Future<Either<Failure, UnReportModel>> execute(
      void input) async {
    return await _repositry.getUnReports();
  }
}