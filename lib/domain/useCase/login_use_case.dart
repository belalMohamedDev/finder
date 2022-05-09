
import 'package:dartz/dartz.dart';

import 'package:finder/data/network/failure/failure.dart';
import 'package:finder/data/network/request/request.dart';
import 'package:finder/domain/repository/repositry.dart';

import '../models/login_model.dart';
import 'base_use_case.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput,BaseLoginModel>{
  final Repositry _repositry;
  LoginUseCase(this._repositry);
  @override
  Future<Either<Failure, BaseLoginModel>> execute(LoginUseCaseInput input)async {
   return await _repositry.login(LoginRequest(input.nationalId, input.password));
  }
}

class LoginUseCaseInput{
  String nationalId;
  String password;
  LoginUseCaseInput(this.nationalId,this.password);
}