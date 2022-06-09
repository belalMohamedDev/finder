// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginObject {
  String get nationalId => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res>;
  $Res call({String nationalId, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res> implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  final LoginObject _value;
  // ignore: unused_field
  final $Res Function(LoginObject) _then;

  @override
  $Res call({
    Object? nationalId = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      nationalId: nationalId == freezed
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LoginObjectCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$_LoginObjectCopyWith(
          _$_LoginObject value, $Res Function(_$_LoginObject) then) =
      __$$_LoginObjectCopyWithImpl<$Res>;
  @override
  $Res call({String nationalId, String password});
}

/// @nodoc
class __$$_LoginObjectCopyWithImpl<$Res> extends _$LoginObjectCopyWithImpl<$Res>
    implements _$$_LoginObjectCopyWith<$Res> {
  __$$_LoginObjectCopyWithImpl(
      _$_LoginObject _value, $Res Function(_$_LoginObject) _then)
      : super(_value, (v) => _then(v as _$_LoginObject));

  @override
  _$_LoginObject get _value => super._value as _$_LoginObject;

  @override
  $Res call({
    Object? nationalId = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_LoginObject(
      nationalId == freezed
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginObject implements _LoginObject {
  _$_LoginObject(this.nationalId, this.password);

  @override
  final String nationalId;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(nationalId: $nationalId, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginObject &&
            const DeepCollectionEquality()
                .equals(other.nationalId, nationalId) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nationalId),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      __$$_LoginObjectCopyWithImpl<_$_LoginObject>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(final String nationalId, final String password) =
      _$_LoginObject;

  @override
  String get nationalId => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterObject {
  String get name => throw _privateConstructorUsedError;
  String get nationalId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  dynamic get picture => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterObjectCopyWith<RegisterObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterObjectCopyWith<$Res> {
  factory $RegisterObjectCopyWith(
          RegisterObject value, $Res Function(RegisterObject) then) =
      _$RegisterObjectCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String nationalId,
      String email,
      String password,
      String phone,
      String address,
      dynamic picture});
}

/// @nodoc
class _$RegisterObjectCopyWithImpl<$Res>
    implements $RegisterObjectCopyWith<$Res> {
  _$RegisterObjectCopyWithImpl(this._value, this._then);

  final RegisterObject _value;
  // ignore: unused_field
  final $Res Function(RegisterObject) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? nationalId = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? picture = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nationalId: nationalId == freezed
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_RegisterObjectCopyWith<$Res>
    implements $RegisterObjectCopyWith<$Res> {
  factory _$$_RegisterObjectCopyWith(
          _$_RegisterObject value, $Res Function(_$_RegisterObject) then) =
      __$$_RegisterObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String nationalId,
      String email,
      String password,
      String phone,
      String address,
      dynamic picture});
}

/// @nodoc
class __$$_RegisterObjectCopyWithImpl<$Res>
    extends _$RegisterObjectCopyWithImpl<$Res>
    implements _$$_RegisterObjectCopyWith<$Res> {
  __$$_RegisterObjectCopyWithImpl(
      _$_RegisterObject _value, $Res Function(_$_RegisterObject) _then)
      : super(_value, (v) => _then(v as _$_RegisterObject));

  @override
  _$_RegisterObject get _value => super._value as _$_RegisterObject;

  @override
  $Res call({
    Object? name = freezed,
    Object? nationalId = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? picture = freezed,
  }) {
    return _then(_$_RegisterObject(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nationalId == freezed
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_RegisterObject implements _RegisterObject {
  _$_RegisterObject(this.name, this.nationalId, this.email, this.password,
      this.phone, this.address, this.picture);

  @override
  final String name;
  @override
  final String nationalId;
  @override
  final String email;
  @override
  final String password;
  @override
  final String phone;
  @override
  final String address;
  @override
  final dynamic picture;

  @override
  String toString() {
    return 'RegisterObject(name: $name, nationalId: $nationalId, email: $email, password: $password, phone: $phone, address: $address, picture: $picture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterObject &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.nationalId, nationalId) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.picture, picture));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(nationalId),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(picture));

  @JsonKey(ignore: true)
  @override
  _$$_RegisterObjectCopyWith<_$_RegisterObject> get copyWith =>
      __$$_RegisterObjectCopyWithImpl<_$_RegisterObject>(this, _$identity);
}

abstract class _RegisterObject implements RegisterObject {
  factory _RegisterObject(
      final String name,
      final String nationalId,
      final String email,
      final String password,
      final String phone,
      final String address,
      final dynamic picture) = _$_RegisterObject;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get nationalId => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  String get phone => throw _privateConstructorUsedError;
  @override
  String get address => throw _privateConstructorUsedError;
  @override
  dynamic get picture => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterObjectCopyWith<_$_RegisterObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MakeReportObject {
  String get name => throw _privateConstructorUsedError;
  String get nationalId => throw _privateConstructorUsedError;
  String get age => throw _privateConstructorUsedError;
  String get area => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  dynamic get picture => throw _privateConstructorUsedError;
  String get clothesLastSeenWearing => throw _privateConstructorUsedError;
  String get birthmark => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MakeReportObjectCopyWith<MakeReportObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MakeReportObjectCopyWith<$Res> {
  factory $MakeReportObjectCopyWith(
          MakeReportObject value, $Res Function(MakeReportObject) then) =
      _$MakeReportObjectCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String nationalId,
      String age,
      String area,
      String gender,
      dynamic picture,
      String clothesLastSeenWearing,
      String birthmark});
}

/// @nodoc
class _$MakeReportObjectCopyWithImpl<$Res>
    implements $MakeReportObjectCopyWith<$Res> {
  _$MakeReportObjectCopyWithImpl(this._value, this._then);

  final MakeReportObject _value;
  // ignore: unused_field
  final $Res Function(MakeReportObject) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? nationalId = freezed,
    Object? age = freezed,
    Object? area = freezed,
    Object? gender = freezed,
    Object? picture = freezed,
    Object? clothesLastSeenWearing = freezed,
    Object? birthmark = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nationalId: nationalId == freezed
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      area: area == freezed
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as dynamic,
      clothesLastSeenWearing: clothesLastSeenWearing == freezed
          ? _value.clothesLastSeenWearing
          : clothesLastSeenWearing // ignore: cast_nullable_to_non_nullable
              as String,
      birthmark: birthmark == freezed
          ? _value.birthmark
          : birthmark // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MakeReportObjectCopyWith<$Res>
    implements $MakeReportObjectCopyWith<$Res> {
  factory _$$_MakeReportObjectCopyWith(
          _$_MakeReportObject value, $Res Function(_$_MakeReportObject) then) =
      __$$_MakeReportObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String nationalId,
      String age,
      String area,
      String gender,
      dynamic picture,
      String clothesLastSeenWearing,
      String birthmark});
}

/// @nodoc
class __$$_MakeReportObjectCopyWithImpl<$Res>
    extends _$MakeReportObjectCopyWithImpl<$Res>
    implements _$$_MakeReportObjectCopyWith<$Res> {
  __$$_MakeReportObjectCopyWithImpl(
      _$_MakeReportObject _value, $Res Function(_$_MakeReportObject) _then)
      : super(_value, (v) => _then(v as _$_MakeReportObject));

  @override
  _$_MakeReportObject get _value => super._value as _$_MakeReportObject;

  @override
  $Res call({
    Object? name = freezed,
    Object? nationalId = freezed,
    Object? age = freezed,
    Object? area = freezed,
    Object? gender = freezed,
    Object? picture = freezed,
    Object? clothesLastSeenWearing = freezed,
    Object? birthmark = freezed,
  }) {
    return _then(_$_MakeReportObject(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nationalId == freezed
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String,
      age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      area == freezed
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as dynamic,
      clothesLastSeenWearing == freezed
          ? _value.clothesLastSeenWearing
          : clothesLastSeenWearing // ignore: cast_nullable_to_non_nullable
              as String,
      birthmark == freezed
          ? _value.birthmark
          : birthmark // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MakeReportObject implements _MakeReportObject {
  _$_MakeReportObject(this.name, this.nationalId, this.age, this.area,
      this.gender, this.picture, this.clothesLastSeenWearing, this.birthmark);

  @override
  final String name;
  @override
  final String nationalId;
  @override
  final String age;
  @override
  final String area;
  @override
  final String gender;
  @override
  final dynamic picture;
  @override
  final String clothesLastSeenWearing;
  @override
  final String birthmark;

  @override
  String toString() {
    return 'MakeReportObject(name: $name, nationalId: $nationalId, age: $age, area: $area, gender: $gender, picture: $picture, clothesLastSeenWearing: $clothesLastSeenWearing, birthmark: $birthmark)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MakeReportObject &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.nationalId, nationalId) &&
            const DeepCollectionEquality().equals(other.age, age) &&
            const DeepCollectionEquality().equals(other.area, area) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.picture, picture) &&
            const DeepCollectionEquality()
                .equals(other.clothesLastSeenWearing, clothesLastSeenWearing) &&
            const DeepCollectionEquality().equals(other.birthmark, birthmark));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(nationalId),
      const DeepCollectionEquality().hash(age),
      const DeepCollectionEquality().hash(area),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(picture),
      const DeepCollectionEquality().hash(clothesLastSeenWearing),
      const DeepCollectionEquality().hash(birthmark));

  @JsonKey(ignore: true)
  @override
  _$$_MakeReportObjectCopyWith<_$_MakeReportObject> get copyWith =>
      __$$_MakeReportObjectCopyWithImpl<_$_MakeReportObject>(this, _$identity);
}

abstract class _MakeReportObject implements MakeReportObject {
  factory _MakeReportObject(
      final String name,
      final String nationalId,
      final String age,
      final String area,
      final String gender,
      final dynamic picture,
      final String clothesLastSeenWearing,
      final String birthmark) = _$_MakeReportObject;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get nationalId => throw _privateConstructorUsedError;
  @override
  String get age => throw _privateConstructorUsedError;
  @override
  String get area => throw _privateConstructorUsedError;
  @override
  String get gender => throw _privateConstructorUsedError;
  @override
  dynamic get picture => throw _privateConstructorUsedError;
  @override
  String get clothesLastSeenWearing => throw _privateConstructorUsedError;
  @override
  String get birthmark => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MakeReportObjectCopyWith<_$_MakeReportObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MakeUnReportObject {
  String get area => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get policeStation => throw _privateConstructorUsedError;
  dynamic get picture => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MakeUnReportObjectCopyWith<MakeUnReportObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MakeUnReportObjectCopyWith<$Res> {
  factory $MakeUnReportObjectCopyWith(
          MakeUnReportObject value, $Res Function(MakeUnReportObject) then) =
      _$MakeUnReportObjectCopyWithImpl<$Res>;
  $Res call(
      {String area, String gender, String policeStation, dynamic picture});
}

/// @nodoc
class _$MakeUnReportObjectCopyWithImpl<$Res>
    implements $MakeUnReportObjectCopyWith<$Res> {
  _$MakeUnReportObjectCopyWithImpl(this._value, this._then);

  final MakeUnReportObject _value;
  // ignore: unused_field
  final $Res Function(MakeUnReportObject) _then;

  @override
  $Res call({
    Object? area = freezed,
    Object? gender = freezed,
    Object? policeStation = freezed,
    Object? picture = freezed,
  }) {
    return _then(_value.copyWith(
      area: area == freezed
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      policeStation: policeStation == freezed
          ? _value.policeStation
          : policeStation // ignore: cast_nullable_to_non_nullable
              as String,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_MakeUnReportObjectCopyWith<$Res>
    implements $MakeUnReportObjectCopyWith<$Res> {
  factory _$$_MakeUnReportObjectCopyWith(_$_MakeUnReportObject value,
          $Res Function(_$_MakeUnReportObject) then) =
      __$$_MakeUnReportObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String area, String gender, String policeStation, dynamic picture});
}

/// @nodoc
class __$$_MakeUnReportObjectCopyWithImpl<$Res>
    extends _$MakeUnReportObjectCopyWithImpl<$Res>
    implements _$$_MakeUnReportObjectCopyWith<$Res> {
  __$$_MakeUnReportObjectCopyWithImpl(
      _$_MakeUnReportObject _value, $Res Function(_$_MakeUnReportObject) _then)
      : super(_value, (v) => _then(v as _$_MakeUnReportObject));

  @override
  _$_MakeUnReportObject get _value => super._value as _$_MakeUnReportObject;

  @override
  $Res call({
    Object? area = freezed,
    Object? gender = freezed,
    Object? policeStation = freezed,
    Object? picture = freezed,
  }) {
    return _then(_$_MakeUnReportObject(
      area == freezed
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      policeStation == freezed
          ? _value.policeStation
          : policeStation // ignore: cast_nullable_to_non_nullable
              as String,
      picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_MakeUnReportObject implements _MakeUnReportObject {
  _$_MakeUnReportObject(
      this.area, this.gender, this.policeStation, this.picture);

  @override
  final String area;
  @override
  final String gender;
  @override
  final String policeStation;
  @override
  final dynamic picture;

  @override
  String toString() {
    return 'MakeUnReportObject(area: $area, gender: $gender, policeStation: $policeStation, picture: $picture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MakeUnReportObject &&
            const DeepCollectionEquality().equals(other.area, area) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality()
                .equals(other.policeStation, policeStation) &&
            const DeepCollectionEquality().equals(other.picture, picture));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(area),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(policeStation),
      const DeepCollectionEquality().hash(picture));

  @JsonKey(ignore: true)
  @override
  _$$_MakeUnReportObjectCopyWith<_$_MakeUnReportObject> get copyWith =>
      __$$_MakeUnReportObjectCopyWithImpl<_$_MakeUnReportObject>(
          this, _$identity);
}

abstract class _MakeUnReportObject implements MakeUnReportObject {
  factory _MakeUnReportObject(
      final String area,
      final String gender,
      final String policeStation,
      final dynamic picture) = _$_MakeUnReportObject;

  @override
  String get area => throw _privateConstructorUsedError;
  @override
  String get gender => throw _privateConstructorUsedError;
  @override
  String get policeStation => throw _privateConstructorUsedError;
  @override
  dynamic get picture => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MakeUnReportObjectCopyWith<_$_MakeUnReportObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateUserObject {
  String get name => throw _privateConstructorUsedError;
  String get nationalId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  dynamic get picture => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateUserObjectCopyWith<UpdateUserObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserObjectCopyWith<$Res> {
  factory $UpdateUserObjectCopyWith(
          UpdateUserObject value, $Res Function(UpdateUserObject) then) =
      _$UpdateUserObjectCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String nationalId,
      String email,
      String password,
      String address,
      String phoneNumber,
      dynamic picture});
}

/// @nodoc
class _$UpdateUserObjectCopyWithImpl<$Res>
    implements $UpdateUserObjectCopyWith<$Res> {
  _$UpdateUserObjectCopyWithImpl(this._value, this._then);

  final UpdateUserObject _value;
  // ignore: unused_field
  final $Res Function(UpdateUserObject) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? nationalId = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? picture = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nationalId: nationalId == freezed
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_UpdateUserObjectCopyWith<$Res>
    implements $UpdateUserObjectCopyWith<$Res> {
  factory _$$_UpdateUserObjectCopyWith(
          _$_UpdateUserObject value, $Res Function(_$_UpdateUserObject) then) =
      __$$_UpdateUserObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String nationalId,
      String email,
      String password,
      String address,
      String phoneNumber,
      dynamic picture});
}

/// @nodoc
class __$$_UpdateUserObjectCopyWithImpl<$Res>
    extends _$UpdateUserObjectCopyWithImpl<$Res>
    implements _$$_UpdateUserObjectCopyWith<$Res> {
  __$$_UpdateUserObjectCopyWithImpl(
      _$_UpdateUserObject _value, $Res Function(_$_UpdateUserObject) _then)
      : super(_value, (v) => _then(v as _$_UpdateUserObject));

  @override
  _$_UpdateUserObject get _value => super._value as _$_UpdateUserObject;

  @override
  $Res call({
    Object? name = freezed,
    Object? nationalId = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? picture = freezed,
  }) {
    return _then(_$_UpdateUserObject(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nationalId == freezed
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_UpdateUserObject implements _UpdateUserObject {
  _$_UpdateUserObject(this.name, this.nationalId, this.email, this.password,
      this.address, this.phoneNumber, this.picture);

  @override
  final String name;
  @override
  final String nationalId;
  @override
  final String email;
  @override
  final String password;
  @override
  final String address;
  @override
  final String phoneNumber;
  @override
  final dynamic picture;

  @override
  String toString() {
    return 'UpdateUserObject(name: $name, nationalId: $nationalId, email: $email, password: $password, address: $address, phoneNumber: $phoneNumber, picture: $picture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateUserObject &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.nationalId, nationalId) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.picture, picture));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(nationalId),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(picture));

  @JsonKey(ignore: true)
  @override
  _$$_UpdateUserObjectCopyWith<_$_UpdateUserObject> get copyWith =>
      __$$_UpdateUserObjectCopyWithImpl<_$_UpdateUserObject>(this, _$identity);
}

abstract class _UpdateUserObject implements UpdateUserObject {
  factory _UpdateUserObject(
      final String name,
      final String nationalId,
      final String email,
      final String password,
      final String address,
      final String phoneNumber,
      final dynamic picture) = _$_UpdateUserObject;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get nationalId => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  String get address => throw _privateConstructorUsedError;
  @override
  String get phoneNumber => throw _privateConstructorUsedError;
  @override
  dynamic get picture => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateUserObjectCopyWith<_$_UpdateUserObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$IncidentObject {
  String get area => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get policeStation => throw _privateConstructorUsedError;
  dynamic get picture => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IncidentObjectCopyWith<IncidentObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncidentObjectCopyWith<$Res> {
  factory $IncidentObjectCopyWith(
          IncidentObject value, $Res Function(IncidentObject) then) =
      _$IncidentObjectCopyWithImpl<$Res>;
  $Res call(
      {String area, String gender, String policeStation, dynamic picture});
}

/// @nodoc
class _$IncidentObjectCopyWithImpl<$Res>
    implements $IncidentObjectCopyWith<$Res> {
  _$IncidentObjectCopyWithImpl(this._value, this._then);

  final IncidentObject _value;
  // ignore: unused_field
  final $Res Function(IncidentObject) _then;

  @override
  $Res call({
    Object? area = freezed,
    Object? gender = freezed,
    Object? policeStation = freezed,
    Object? picture = freezed,
  }) {
    return _then(_value.copyWith(
      area: area == freezed
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      policeStation: policeStation == freezed
          ? _value.policeStation
          : policeStation // ignore: cast_nullable_to_non_nullable
              as String,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_IncidentObjectCopyWith<$Res>
    implements $IncidentObjectCopyWith<$Res> {
  factory _$$_IncidentObjectCopyWith(
          _$_IncidentObject value, $Res Function(_$_IncidentObject) then) =
      __$$_IncidentObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String area, String gender, String policeStation, dynamic picture});
}

/// @nodoc
class __$$_IncidentObjectCopyWithImpl<$Res>
    extends _$IncidentObjectCopyWithImpl<$Res>
    implements _$$_IncidentObjectCopyWith<$Res> {
  __$$_IncidentObjectCopyWithImpl(
      _$_IncidentObject _value, $Res Function(_$_IncidentObject) _then)
      : super(_value, (v) => _then(v as _$_IncidentObject));

  @override
  _$_IncidentObject get _value => super._value as _$_IncidentObject;

  @override
  $Res call({
    Object? area = freezed,
    Object? gender = freezed,
    Object? policeStation = freezed,
    Object? picture = freezed,
  }) {
    return _then(_$_IncidentObject(
      area == freezed
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      policeStation == freezed
          ? _value.policeStation
          : policeStation // ignore: cast_nullable_to_non_nullable
              as String,
      picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_IncidentObject implements _IncidentObject {
  _$_IncidentObject(this.area, this.gender, this.policeStation, this.picture);

  @override
  final String area;
  @override
  final String gender;
  @override
  final String policeStation;
  @override
  final dynamic picture;

  @override
  String toString() {
    return 'IncidentObject(area: $area, gender: $gender, policeStation: $policeStation, picture: $picture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IncidentObject &&
            const DeepCollectionEquality().equals(other.area, area) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality()
                .equals(other.policeStation, policeStation) &&
            const DeepCollectionEquality().equals(other.picture, picture));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(area),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(policeStation),
      const DeepCollectionEquality().hash(picture));

  @JsonKey(ignore: true)
  @override
  _$$_IncidentObjectCopyWith<_$_IncidentObject> get copyWith =>
      __$$_IncidentObjectCopyWithImpl<_$_IncidentObject>(this, _$identity);
}

abstract class _IncidentObject implements IncidentObject {
  factory _IncidentObject(final String area, final String gender,
      final String policeStation, final dynamic picture) = _$_IncidentObject;

  @override
  String get area => throw _privateConstructorUsedError;
  @override
  String get gender => throw _privateConstructorUsedError;
  @override
  String get policeStation => throw _privateConstructorUsedError;
  @override
  dynamic get picture => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_IncidentObjectCopyWith<_$_IncidentObject> get copyWith =>
      throw _privateConstructorUsedError;
}
