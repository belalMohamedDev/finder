import 'package:dartz/dartz.dart';
import 'package:finder/data/network/failure/failure.dart';
import 'package:finder/data/network/request/request.dart';

import 'package:finder/domain/repository/repositry.dart';
import '../../models/Incident/model.dart';
import '../base/base_use_case.dart';

class IncidentUseCase
    implements BaseUseCase<IncidentUseCaseInput, IncidentModel> {
  final Repositry _repositry;
  IncidentUseCase(this._repositry);
  @override
  Future<Either<Failure, IncidentModel>> execute(
      IncidentUseCaseInput input) async {
    return await _repositry.incident(IncidentRequest(
        input.area,
        input.gender,
        input.policeStation,
        input.picture,
        ));
  }
}

class IncidentUseCaseInput {
  String area;
  String gender;
  String policeStation;
  dynamic picture;

  IncidentUseCaseInput(this.area,this.gender,this.policeStation,this.picture);
}
