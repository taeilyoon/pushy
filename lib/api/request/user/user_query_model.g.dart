// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_query_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserQueryModel _$UserQueryModelFromJson(Map<String, dynamic> json) =>
    UserQueryModel(
      userId: json['userId'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      birthDay: json['birthDay'] == null
          ? null
          : DateTime.parse(json['birthDay'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      refferalCode: json['refferalCode'] as String?,
      refferalUserId: json['refferalUserId'] as String?,
      name__Filter: json['name__Filter'] as Map<String, dynamic>?,
      username__Filter: json['username__Filter'] as Map<String, dynamic>?,
      PersonalInfo: json['PersonalInfo'] == null
          ? null
          : PersonalInfoQuery.fromJson(
              json['PersonalInfo'] as Map<String, dynamic>),
      phoneNumber__Filter: json['phoneNumber__Filter'] as Map<String, dynamic>?,
      blockAt__Filter: json['blockAt__Filter'] == null
          ? null
          : DateTimeFilter.fromJson(
              json['blockAt__Filter'] as Map<String, dynamic>),
      isAdmin: json['isAdmin'] as bool?,
      blockAt: json['blockAt'] == null
          ? null
          : DateTime.parse(json['blockAt'] as String),
    );

Map<String, dynamic> _$UserQueryModelToJson(UserQueryModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'username__Filter': instance.username__Filter,
      'email': instance.email,
      'birthDay': instance.birthDay?.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'phoneNumber__Filter': instance.phoneNumber__Filter,
      'name': instance.name,
      'name__Filter': instance.name__Filter,
      'gender': instance.gender,
      'refferalCode': instance.refferalCode,
      'refferalUserId': instance.refferalUserId,
      'PersonalInfo': instance.PersonalInfo,
      'isAdmin': instance.isAdmin,
      'blockAt': instance.blockAt?.toIso8601String(),
      'blockAt__Filter': instance.blockAt__Filter,
    };

PersonalInfoQuery _$PersonalInfoQueryFromJson(Map<String, dynamic> json) =>
    PersonalInfoQuery(
      userId: json['userId'] as String?,
      birth: json['birth'] as String?,
      birthday: json['birthday'] as String?,
      carrier: json['carrier'] as String?,
      certified: json['certified'] as bool?,
      certified_at: json['certified_at'] == null
          ? null
          : DateTime.parse(json['certified_at'] as String),
      foreigner: json['foreigner'] as bool?,
      foreigner_v2: json['foreigner_v2'] as bool?,
      gender: json['gender'] as String?,
      imp_uid: json['imp_uid'] as String?,
      name: json['name'] as String?,
      origin: json['origin'] as String?,
      pg_provider: json['pg_provider'] as String?,
      pg_tid: json['pg_tid'] as String?,
      phone: json['phone'] as String?,
      unique_in_site: json['unique_in_site'] as String?,
      unique_key: json['unique_key'] as String?,
    );

Map<String, dynamic> _$PersonalInfoQueryToJson(PersonalInfoQuery instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'birth': instance.birth,
      'birthday': instance.birthday,
      'carrier': instance.carrier,
      'certified': instance.certified,
      'certified_at': instance.certified_at?.toIso8601String(),
      'foreigner': instance.foreigner,
      'foreigner_v2': instance.foreigner_v2,
      'gender': instance.gender,
      'imp_uid': instance.imp_uid,
      'name': instance.name,
      'origin': instance.origin,
      'pg_provider': instance.pg_provider,
      'pg_tid': instance.pg_tid,
      'phone': instance.phone,
      'unique_in_site': instance.unique_in_site,
      'unique_key': instance.unique_key,
    };

UserInclude _$UserIncludeFromJson(Map<String, dynamic> json) => UserInclude(
      count: json['_count'] as bool?,
      PersonalInfo: json['PersonalInfo'] as bool?,
      Purchase: json['Purchase'] as bool?,
      refferaledUsers: json['refferaledUsers'] as bool?,
      refferalUser: json['refferalUser'] as bool?,
      Subscribe: json['Subscribe'] as bool?,
    );

Map<String, dynamic> _$UserIncludeToJson(UserInclude instance) =>
    <String, dynamic>{
      'refferalUser': instance.refferalUser,
      'refferaledUsers': instance.refferaledUsers,
      'PersonalInfo': instance.PersonalInfo,
      'Subscribe': instance.Subscribe,
      'Purchase': instance.Purchase,
      '_count': instance.count,
    };

UserOrder _$UserOrderFromJson(Map<String, dynamic> json) => UserOrder(
      userId: json['userId'] as String?,
      hashedPassword: json['hashedPassword'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      birthDay: json['birthDay'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      refferalCode: json['refferalCode'] as String?,
      isAdmin: json['isAdmin'] as String?,
      blockAt: json['blockAt'] as String?,
    );

Map<String, dynamic> _$UserOrderToJson(UserOrder instance) => <String, dynamic>{
      'userId': instance.userId,
      'hashedPassword': instance.hashedPassword,
      'username': instance.username,
      'email': instance.email,
      'birthDay': instance.birthDay,
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
      'gender': instance.gender,
      'refferalCode': instance.refferalCode,
      'isAdmin': instance.isAdmin,
      'blockAt': instance.blockAt,
    };
