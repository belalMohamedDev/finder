//Register model

class BaseRegisterModel {
  String message;
  int statusCode;
  UserRegisterModel? user;

  BaseRegisterModel(this.message, this.statusCode, this.user);

}

class UserRegisterModel {
  int id;
  String type;
  AttributesRegisterModel? attributes;

  UserRegisterModel(this.id, this.type, this.attributes);


}

class AttributesRegisterModel {
  String name;
  String nationalId;
  String email;
  String address;
  String phoneNumber;
  String picture;
  String pictureUrl;
  String createdAt;

  AttributesRegisterModel(
      this.name,
        this.nationalId,
        this.email,
        this.address,
        this.phoneNumber,
        this.picture,
        this.pictureUrl,
        this.createdAt);


}
