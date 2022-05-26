
import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data_classes.freezed.dart';

@freezed
class  LoginObject with _$LoginObject{
  factory LoginObject(String nationalId,String password)=_LoginObject;
}

@freezed
class  RegisterObject with _$RegisterObject{
  factory RegisterObject(
  String name,
  String nationalId,
  String email,
  String password,
  String phone,
  String address,
  dynamic picture,

      )=_RegisterObject;
}



@freezed
class  MakeReportObject with _$MakeReportObject{
  factory MakeReportObject(
  String name,
  String nationalId,
  String age,
  String area,
  String gender,
  dynamic picture,
  String clothesLastSeenWearing,
  String birthmark,

      )=_MakeReportObject;
}



@freezed
class  MakeUnReportObject with _$MakeUnReportObject{
  factory MakeUnReportObject(
  String area,
  String gender,
  String policeStation,
  dynamic picture,

      )=_MakeUnReportObject;
}


@freezed
class  UpdateUserObject with _$UpdateUserObject{
  factory UpdateUserObject(
  String name,
  String nationalId,
  String email,
  String password,
  String address,
  String phoneNumber,
  dynamic picture,

      )=_UpdateUserObject;
}