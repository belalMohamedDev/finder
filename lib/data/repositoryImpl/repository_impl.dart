import 'package:dartz/dartz.dart';
import 'package:finder/data/datasource/localData/report/local_data_source.dart';
import 'package:finder/data/datasource/localData/unReport/un_report_local_data.dart';
import 'package:finder/data/mapper/Incident/mapper.dart';
import 'package:finder/data/mapper/logOut/mapper.dart';
import 'package:finder/data/mapper/login/mapper.dart';
import 'package:finder/data/mapper/makeReport/mapper.dart';



import 'package:finder/data/mapper/register/mapper.dart';
import 'package:finder/data/mapper/reports/mapper.dart';
import 'package:finder/data/mapper/unReport/un_report_mapper.dart';
import 'package:finder/data/mapper/updateUser/mapper.dart';

import 'package:finder/data/network/error_handler/error_handler.dart';

import 'package:finder/data/network/failure/failure.dart';
import 'package:finder/data/network/network_info/network_info.dart';

import 'package:finder/data/network/request/request.dart';
import 'package:finder/domain/models/Incident/model.dart';
import 'package:finder/domain/models/logOut/model.dart';

import 'package:finder/domain/models/login/login_model.dart';
import 'package:finder/domain/models/makeReport/make_report_model.dart';

import 'package:finder/domain/models/register/register_model.dart';
import 'package:finder/domain/models/reports/reports_model.dart';
import 'package:finder/domain/models/unReport/un_report_model.dart';
import 'package:finder/domain/models/updateUser/model.dart';

import '../../domain/repository/repositry.dart';

import '../datasource/remoteData/remote_data_source.dart';


class  RepositoryImpl implements Repositry {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final UnReportLocalDataSource _unReportLocalDataSource;

  final NetworkInfo _networkInfo;

  RepositoryImpl(this._networkInfo, this._remoteDataSource,
      this._localDataSource, this._unReportLocalDataSource,
   );

  @override
  Future<Either<Failure, BaseLoginModel>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      //its  connected to internet ,its safe to call api


      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.statusCode == ApiInternalStatus.success) {
          //success and return data
          return Right(response.toDomain());
        } else {
          //failure --return business error
          return left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return  internet connection error
      return left(DataSource.noInternetConnection.getFailure());
    }
  }


  @override
  Future<Either<Failure, BaseRegisterModel>> register(
      RegisterRequest registerRequest) async {
    if (await _networkInfo.isConnected) {
      //its  connected to internet ,its safe to call api


      try {
        final response = await _remoteDataSource.register(registerRequest);
        if (response.statusCode == ApiInternalStatus.success) {
          //success and return data
          return Right(response.toDomain());
        } else {
          //failure --return business error
          return left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return  internet connection error
      return left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, ReportModel>> getReports() async {
    try {
      //get response from cache
      final response = await _localDataSource.getReports();
      return Right(response.toDomain());
    } catch (cacheError) {
      // cache is not existing or cache is not valid
      // its thw time to get from api side
      if (await _networkInfo.isConnected) {
        //its  connected to internet ,its safe to call api

        try {
          final response = await _remoteDataSource.getReports();
          if (response.data != null) {
            //save response in cache (local data source)
            _localDataSource.saveReportToCache(response);
            //success and return data
            return Right(response.toDomain());
          } else {
            //failure --return business error
            return left(
                Failure(ApiInternalStatus.failure, ResponseMessage.unKnown));
          }
        } catch (error) {
          return Left(ErrorHandler
              .handle(error)
              .failure);
        }
      } else {
        //return  internet connection error
        return left(DataSource.noInternetConnection.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, UnReportModel>> getUnReports() async {
    try {
      //get response from cache
      final response = await _unReportLocalDataSource.getUnReports();
      return Right(response.toDomain());
    } catch (cacheError) {
      // cache is not existing or cache is not valid
      // its thw time to get from api side
      if (await _networkInfo.isConnected) {
        //its  connected to internet ,its safe to call api

        try {
          final response = await _remoteDataSource.getUnReports();
          if (response.data != null) {
            //save response in cache (local data source)
            _unReportLocalDataSource.saveReportToCache(response);
            //success and return data
            return Right(response.toDomain());
          } else {
            //failure --return business error
            return left(
                Failure(ApiInternalStatus.failure, ResponseMessage.unKnown));
          }
        } catch (error) {
          return Left(ErrorHandler
              .handle(error)
              .failure);
        }
      } else {
        //return  internet connection error
        return left(DataSource.noInternetConnection.getFailure());
      }
    }
  }


  @override
  Future<Either<Failure, MakeReportModel>> makeReport(
      MakeReportRequest makeReportRequest) async {
    if (await _networkInfo.isConnected) {
      //its  connected to internet ,its safe to call api


      try {
        final response = await _remoteDataSource.makeReport(makeReportRequest);
        if (response.statusCode == ApiInternalStatus.success) {
          //success and return data
          return Right(response.toDomain());
        } else {
          //failure --return business error
          return left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return  internet connection error
      return left(DataSource.noInternetConnection.getFailure());
    }
  }






  @override
  Future<Either<Failure, LogOutModel>> logOut() async{
    if (await _networkInfo.isConnected) {
      //its  connected to internet ,its safe to call api


      try {
        final response = await _remoteDataSource.logOut();
        if (response.statusCode == ApiInternalStatus.success) {
          //success and return data
          return Right(response.toDomain());
        } else {
          //failure --return business error
          return left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return  internet connection error
      return left(DataSource.noInternetConnection.getFailure());
    }
  }



  @override
  Future<Either<Failure, UpdateModel>> updateUser(UpdateUserRequest updateUserRequest)async {
    if (await _networkInfo.isConnected) {
      //its  connected to internet ,its safe to call api


      try {
        final response = await _remoteDataSource.updateUser(updateUserRequest);
        if (response.statusCode == ApiInternalStatus.success) {
          //success and return data
          return Right(response.toDomain());
        } else {
          //failure --return business error
          return left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return  internet connection error
      return left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, IncidentModel>> incident(IncidentRequest incidentRequest) async{
    if (await _networkInfo.isConnected) {
      //its  connected to internet ,its safe to call api

      try {
        final response = await _remoteDataSource.incident(incidentRequest);
        if (response.statusCode == ApiInternalStatus.success) {
          //success and return data
          return Right(response.toDomain());
        } else {
          //failure --return business error
          return left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return  internet connection error
      return left(DataSource.noInternetConnection.getFailure());
    }
  }


}