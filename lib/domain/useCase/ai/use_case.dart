import 'package:dartz/dartz.dart';

import 'package:finder/data/network/failure/failure.dart';
import 'package:finder/data/network/request/request.dart';
import 'package:finder/domain/models/aiModel/ai_model.dart';
import 'package:finder/domain/repository/repositry.dart';


import '../base/base_use_case.dart';

class AiUseCase implements BaseUseCase<AiUseCaseInput,AiModel>{
  final Repositry _repositry;
  AiUseCase(this._repositry);
  @override
  Future<Either<Failure, AiModel>> execute(AiUseCaseInput input)async {
    return await _repositry.ai(AiRequest(input.image));
  }
}

class AiUseCaseInput{
  dynamic image;
  AiUseCaseInput(this.image);
}