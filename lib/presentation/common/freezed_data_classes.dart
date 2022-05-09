
import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data_classes.freezed.dart';

@freezed
class  LoginObject with _$LoginObject{
  factory LoginObject(String nationalId,String password)=_LoginObject;
}