import 'package:dartz/dartz.dart';
import 'package:finder/data/network/request/request.dart';

import 'package:finder/domain/models/logOut/model.dart';
import 'package:finder/domain/models/login/login_model.dart';
import 'package:finder/domain/models/makeReport/make_report_model.dart';



import 'package:finder/domain/models/reports/reports_model.dart';
import 'package:finder/domain/models/updateUser/model.dart';

import '../../data/network/failure/failure.dart';
import '../models/Incident/model.dart';
import '../models/aiModel/ai_model.dart';
import '../models/register/register_model.dart';
import '../models/unReport/un_report_model.dart';

abstract class Repositry{
Future< Either<Failure,BaseLoginModel>> login(LoginRequest loginRequest);
Future< Either<Failure,LogOutModel>> logOut();
Future< Either<Failure,BaseRegisterModel>> register(RegisterRequest registerRequest);
Future< Either<Failure,ReportModel>> getReports();
Future< Either<Failure,UnReportModel>> getUnReports();
Future< Either<Failure,IncidentModel>> incident(IncidentRequest incidentRequest);
Future< Either<Failure,MakeReportModel>> makeReport(MakeReportRequest makeReportRequest);

Future< Either<Failure,UpdateModel>> updateUser(UpdateUserRequest updateUserRequest);
Future< Either<Failure,AiModel>> ai(AiRequest aiRequest);
}