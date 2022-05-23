import 'package:dartz/dartz.dart';
import 'package:finder/domain/models/makeReport/make_report_model.dart';

import '../../../data/network/failure/failure.dart';
import '../../../data/network/request/request.dart';
import '../../repository/repositry.dart';
import '../base/base_use_case.dart';

class MakeReportUseCase
    implements BaseUseCase<MakeReportUseCaseInput, MakeReportModel> {
  final Repositry _repositry;
  MakeReportUseCase(this._repositry);
  @override
  Future<Either<Failure, MakeReportModel>> execute(
      MakeReportUseCaseInput input) async {
    return await _repositry.makeReport(MakeReportRequest(
        input.name,
        input.nationalId,
        input.age,
        input.area,
        input.gender,
        input.picture,
        input.clothesLastSeenWearing,
        input.birthmark));
  }
}

class MakeReportUseCaseInput {
  String name;
  String nationalId;
  String age;
  String area;
  String gender;
  dynamic picture;
  String clothesLastSeenWearing;
  String birthmark;

  MakeReportUseCaseInput(this.name, this.nationalId, this.age, this.area,
      this.gender, this.picture, this.clothesLastSeenWearing, this.birthmark);
}
