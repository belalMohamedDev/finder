import 'package:dartz/dartz.dart';
import 'package:finder/data/network/failure/failure.dart';

abstract class BaseUseCase<In,Out>{
  Future<Either<Failure,Out>>execute(In input);
}