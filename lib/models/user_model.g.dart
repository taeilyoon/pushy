// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['userId'] as String,
      hashedPassword: json['hashedPassword'] as String,
      username: json['username'] as String,
      email: json['email'],
      birthDay:
          const DatetimeJsonConverter().fromJson(json['birthDay'] as String),
      phoneNumber: json['phoneNumber'] as String,
      name: json['name'] as String,
      gender: json['gender'] as String,
      refferalCode: json['refferalCode'] as String,
      refferalUserId: json['refferalUserId'],
      isAdmin: json['isAdmin'] as bool,
      nativeMobileAppToken: json['nativeMobileAppToken'] as String?,
      purchaseList: (json['Purchase'] as List<dynamic>?)
          ?.map((e) => PurchaseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      token: json['token'] as String?,
      subscribe: (json['Subscribe'] as List<dynamic>?)
          ?.map((e) => SubscribeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..deletedAt = _$JsonConverterFromJson<String, DateTime>(
        json['deletedAt'], const DatetimeJsonConverter().fromJson);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'hashedPassword': instance.hashedPassword,
      'username': instance.username,
      'email': instance.email,
      'birthDay': const DatetimeJsonConverter().toJson(instance.birthDay),
      'deletedAt': _$JsonConverterToJson<String, DateTime>(
          instance.deletedAt, const DatetimeJsonConverter().toJson),
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
      'gender': instance.gender,
      'refferalCode': instance.refferalCode,
      'refferalUserId': instance.refferalUserId,
      'isAdmin': instance.isAdmin,
      'Purchase': instance.purchaseList,
      'token': instance.token,
      'nativeMobileAppToken': instance.nativeMobileAppToken,
      'Subscribe': instance.subscribe,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

UserUpdateModel _$UserUpdateModelFromJson(Map<String, dynamic> json) =>
    UserUpdateModel(
      email: json['email'] as String?,
      token: json['token'] as String?,
      mobileToken: json['mobileToken'] as String?,
      nativeMobileAppToken: json['nativeMobileAppToken'] as String?,
    );

Map<String, dynamic> _$UserUpdateModelToJson(UserUpdateModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'token': instance.token,
      'mobileToken': instance.mobileToken,
      'nativeMobileAppToken': instance.nativeMobileAppToken,
    };
