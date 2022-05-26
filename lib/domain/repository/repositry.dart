import 'package:dartz/dartz.dart';
import 'package:finder/data/network/request/request.dart';
import 'package:finder/data/responses/updateUser/response.dart';
import 'package:finder/domain/models/logOut/model.dart';
import 'package:finder/domain/models/login/login_model.dart';
import 'package:finder/domain/models/makeReport/make_report_model.dart';
import 'package:finder/domain/models/makeSpecificReport/model.dart';
import 'package:finder/domain/models/makeUnReport/make_un_report_model.dart';
import 'package:finder/domain/models/makeUnSpecificReport/model.dart';
import 'package:finder/domain/models/reports/reports_model.dart';
import 'package:finder/domain/models/updateUser/model.dart';

import '../../data/network/failure/failure.dart';
import '../models/register/register_model.dart';
import '../models/unReport/un_report_model.dart';

abstract class Repositry{
Future< Either<Failure,BaseLoginModel>> login(LoginRequest loginRequest);
Future< Either<Failure,LogOutModel>> logOut();
Future< Either<Failure,BaseRegisterModel>> register(RegisterRequest registerRequest);
Future< Either<Failure,ReportModel>> getReports();
Future< Either<Failure,UnReportModel>> getUnReports();
Future< Either<Failure,MakeSpecificReportModel>> getSpecificReports();
Future< Either<Failure,MakeSpecificUnReportModel>> getSpecificUnReports();
Future< Either<Failure,MakeReportModel>> makeReport(MakeReportRequest makeReportRequest);
Future< Either<Failure,MakeUnReportModel>> makeUnReport(MakeUnReportRequest makeUnReportRequest);
Future< Either<Failure,UpdateModel>> updateUser(UpdateUserRequest updateUserRequest);
}