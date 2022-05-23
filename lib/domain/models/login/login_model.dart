//login model

class BaseLoginModel {
  String accessToken;
  String message;
  int statusCode;
  UserLoginModel? user;
  BaseLoginModel(this.accessToken, this.message, this.statusCode, this.user);
}

class UserLoginModel {
  int id;
  String type;
  AttributeLoginModel? attribute;
  UserLoginModel(this.id, this.type, this.attribute);
}

class AttributeLoginModel {
  String name;

  int nationalId;

  String email;

  String address;

  String phoneNumber;

  String picture;

  String pictureUrl;

  String createdAt;

  AttributeLoginModel(this.address, this.createdAt, this.email, this.name,
      this.nationalId, this.phoneNumber, this.picture, this.pictureUrl);
}

