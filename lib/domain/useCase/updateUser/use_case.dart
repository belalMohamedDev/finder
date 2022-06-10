
import 'package:dartz/dartz.dart';

import 'package:finder/data/network/failure/failure.dart';
import 'package:finder/data/network/request/request.dart';
import 'package:finder/domain/models/updateUser/model.dart';
import 'package:finder/domain/repository/repositry.dart';

import '../base/base_use_case.dart';

class UpdateUserUseCase implements BaseUseCase<UpdateUserUseCaseInput,UpdateModel>{
  final Repositry _repositry;
  UpdateUserUseCase(this._repositry);
  @override
  Future<Either<Failure, UpdateModel>> execute(UpdateUserUseCaseInput input)async {
    return await _repositry.updateUser(UpdateUserRequest(input.name,input.nationalId,input.email,input.password,input.address,input.phoneNumber,input.picture));
  }
}

class UpdateUserUseCaseInput{
  String name;
  String nationalId;
  String email;
  String password;
  String address;
  String phoneNumber;
  dynamic picture;

  UpdateUserUseCaseInput(this.name,this.nationalId,this.email,this.password,this.address,this.phoneNumber,this.picture);
}