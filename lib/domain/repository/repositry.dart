import 'package:dartz/dartz.dart';
import 'package:finder/data/network/request/request.dart';
import 'package:finder/domain/models/login_model.dart';

import '../../data/network/failure/failure.dart';

abstract class Repositry{
Future< Either<Failure,BaseLoginModel>> login(LoginRequest loginRequest);
}