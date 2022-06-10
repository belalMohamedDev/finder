class UpdateModel {
  String message;
  int statusCode;
  UserUpdateModel? user;

  UpdateModel(this.message, this.statusCode, this.user);
}

class UserUpdateModel {
  int id;
  String type;
  AttributesUpdateModel? attributes;

  UserUpdateModel(this.id, this.type, this.attributes);
}

class AttributesUpdateModel {
  String name;
  String nationalId;
  String email;

  String address;
  String phoneNumber;
  String picture;
  String pictureUrl;
  String createdAt;

  AttributesUpdateModel(this.name, this.nationalId, this.email, this.address,
      this.phoneNumber, this.picture, this.pictureUrl, this.createdAt);
}
