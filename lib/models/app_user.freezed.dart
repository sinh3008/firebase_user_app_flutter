// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  String get uid => throw _privateConstructorUsedError;
  set uid(String value) => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  set email(String value) => throw _privateConstructorUsedError;
  UserAddress? get userAddress => throw _privateConstructorUsedError;
  set userAddress(UserAddress? value) => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  set userName(String? value) => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  set phone(String? value) => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get userCreationTime => throw _privateConstructorUsedError;
  @TimestampConverter()
  set userCreationTime(Timestamp? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {String uid,
      String email,
      UserAddress? userAddress,
      String? userName,
      String? phone,
      @TimestampConverter() Timestamp? userCreationTime});

  $UserAddressCopyWith<$Res>? get userAddress;
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? userAddress = freezed,
    Object? userName = freezed,
    Object? phone = freezed,
    Object? userCreationTime = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userAddress: freezed == userAddress
          ? _value.userAddress
          : userAddress // ignore: cast_nullable_to_non_nullable
              as UserAddress?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      userCreationTime: freezed == userCreationTime
          ? _value.userCreationTime
          : userCreationTime // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserAddressCopyWith<$Res>? get userAddress {
    if (_value.userAddress == null) {
      return null;
    }

    return $UserAddressCopyWith<$Res>(_value.userAddress!, (value) {
      return _then(_value.copyWith(userAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppUserImplCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$AppUserImplCopyWith(
          _$AppUserImpl value, $Res Function(_$AppUserImpl) then) =
      __$$AppUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String email,
      UserAddress? userAddress,
      String? userName,
      String? phone,
      @TimestampConverter() Timestamp? userCreationTime});

  @override
  $UserAddressCopyWith<$Res>? get userAddress;
}

/// @nodoc
class __$$AppUserImplCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$AppUserImpl>
    implements _$$AppUserImplCopyWith<$Res> {
  __$$AppUserImplCopyWithImpl(
      _$AppUserImpl _value, $Res Function(_$AppUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? userAddress = freezed,
    Object? userName = freezed,
    Object? phone = freezed,
    Object? userCreationTime = freezed,
  }) {
    return _then(_$AppUserImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userAddress: freezed == userAddress
          ? _value.userAddress
          : userAddress // ignore: cast_nullable_to_non_nullable
              as UserAddress?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      userCreationTime: freezed == userCreationTime
          ? _value.userCreationTime
          : userCreationTime // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$AppUserImpl implements _AppUser {
  _$AppUserImpl(
      {required this.uid,
      required this.email,
      this.userAddress,
      this.userName,
      this.phone,
      @TimestampConverter() this.userCreationTime});

  factory _$AppUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserImplFromJson(json);

  @override
  String uid;
  @override
  String email;
  @override
  UserAddress? userAddress;
  @override
  String? userName;
  @override
  String? phone;
  @override
  @TimestampConverter()
  Timestamp? userCreationTime;

  @override
  String toString() {
    return 'AppUser(uid: $uid, email: $email, userAddress: $userAddress, userName: $userName, phone: $phone, userCreationTime: $userCreationTime)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      __$$AppUserImplCopyWithImpl<_$AppUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUserImplToJson(
      this,
    );
  }
}

abstract class _AppUser implements AppUser {
  factory _AppUser(
      {required String uid,
      required String email,
      UserAddress? userAddress,
      String? userName,
      String? phone,
      @TimestampConverter() Timestamp? userCreationTime}) = _$AppUserImpl;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$AppUserImpl.fromJson;

  @override
  String get uid;
  set uid(String value);
  @override
  String get email;
  set email(String value);
  @override
  UserAddress? get userAddress;
  set userAddress(UserAddress? value);
  @override
  String? get userName;
  set userName(String? value);
  @override
  String? get phone;
  set phone(String? value);
  @override
  @TimestampConverter()
  Timestamp? get userCreationTime;
  @TimestampConverter()
  set userCreationTime(Timestamp? value);
  @override
  @JsonKey(ignore: true)
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
