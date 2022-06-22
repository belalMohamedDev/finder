class AiRequest{
  dynamic image ;
  AiRequest(this.image);
}


class LoginRequest{
  String nationalId;
  String password;
  LoginRequest(this.nationalId,this.password);
}


class RegisterRequest{
  String name;
  String nationalId;
  String email;
  String password;
  String address;
  String phone;
  dynamic picture;

  RegisterRequest(this.name,this.nationalId,this.email,this.password,this.address,this.phone,this.picture);
}



class MakeReportRequest{
  String name;
  String nationalId;
  String age;
  String area;
  String gender;
  dynamic picture;
  String clothesLastSeenWearing;
  String birthmark;

  MakeReportRequest(this.name,this.nationalId,this.age,this.area,this.gender,this.picture,this.clothesLastSeenWearing,this.birthmark);
}



class MakeUnReportRequest{
  String area;
  String gender;
  String policeStation;
  dynamic picture;
  MakeUnReportRequest(this.area,this.gender,this.policeStation,this.picture);
}




class UpdateUserRequest{
    String name;
   String nationalId;
  String email;
  String password;
  String address;
  String phoneNumber;
  dynamic picture;

    UpdateUserRequest(this.name,this.nationalId,this.email,this.password,this.address,this.phoneNumber,this.picture);
}


class IncidentRequest{
  String area;
  String gender;
  String policeStation;
  dynamic picture;
  IncidentRequest(this.area,this.gender,this.policeStation,this.picture);
}