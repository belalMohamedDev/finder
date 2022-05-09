import 'package:finder/application/constant.dart';

extension NonNullString on String?{
  String orEmpty(){
    if(this == null){
      return Constant.empty;
    }else{
      return this!;
    }
  }
}


extension NonNullInteger on int?{
  int orZero(){
    if(this == null){
      return Constant.zero;
    }else{
      return this!;
    }
  }
}