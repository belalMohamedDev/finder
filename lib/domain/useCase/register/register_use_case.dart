
import 'package:dartz/dartz.dart';
import 'package:finder/data/network/failure/failure.dart';
import 'package:finder/data/network/request/request.dart';
import 'package:finder/domain/models/register/register_model.dart';
import 'package:finder/domain/repository/repositry.dart';
import '../base/base_use_case.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUseCaseInput, BaseRegisterModel> {
  final Repositry _repositry;
  RegisterUseCase(this._repositry);
  @override
  Future<Either<Failure, BaseRegisterModel>> execute(
      RegisterUseCaseInput input) async {
    return await _repositry.register(RegisterRequest(
        input.name,
        input.nationalId,
        input.email,
        input.password,
        input.phone,
        input.address,
        input.picture));
  }
}

class RegisterUseCaseInput {
  String name;
  String nationalId;
  String email;
  String password;
  String phone;
  String address;
  dynamic picture;

  RegisterUseCaseInput(this.name, this.nationalId, this.email,
      this.password, this.phone, this.address, this.picture);
}
