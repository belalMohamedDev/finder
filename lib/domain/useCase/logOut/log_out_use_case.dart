import 'package:dartz/dartz.dart';
import 'package:finder/data/network/failure/failure.dart';
import 'package:finder/domain/models/logOut/model.dart';
import 'package:finder/domain/repository/repositry.dart';
import '../base/base_use_case.dart';

class LogOutUseCase implements BaseUseCase<void, LogOutModel> {
  final Repositry _repositry;
  LogOutUseCase(this._repositry);
  @override
  Future<Either<Failure, LogOutModel>> execute(void input) async {
    return await _repositry.logOut();
  }
}
