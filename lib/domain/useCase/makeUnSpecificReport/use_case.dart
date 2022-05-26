
import 'package:dartz/dartz.dart';
import 'package:finder/data/network/failure/failure.dart';
import 'package:finder/domain/models/makeUnSpecificReport/model.dart';

import 'package:finder/domain/repository/repositry.dart';
import '../base/base_use_case.dart';

class SpecificUnReportUseCase
    implements BaseUseCase<void, MakeSpecificUnReportModel> {
  final Repositry _repositry;
  SpecificUnReportUseCase(this._repositry);
  @override
  Future<Either<Failure, MakeSpecificUnReportModel>> execute(
      void input) async {
    return await _repositry.getSpecificUnReports();
  }
}
