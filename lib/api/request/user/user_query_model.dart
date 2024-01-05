import 'package:json_annotation/json_annotation.dart';

import '../base_model.dart';
import '../date_filter.dart';
import '../prisma_util.dart';
import '../string_filter.dart';

part 'user_query_model.g.dart';

@JsonSerializable()
class UserQueryModel extends BaseModel {
  String? userId;
  String? username;
  Map<String, dynamic>? username__Filter;
  String? email;
  DateTime? birthDay;

  String? phoneNumber;
  Map<String, dynamic>? phoneNumber__Filter;
  String? name;
  Map<String, dynamic>? name__Filter;
  String? gender;
  String? refferalCode;
  String? refferalUserId;
  PersonalInfoQuery? PersonalInfo;
  bool? isAdmin;

  DateTime? blockAt;
  DateTimeFilter? blockAt__Filter;
  // RelationQuery<SubscribeModel>? Subscribe;

  UserQueryModel({
    this.userId,
    this.username,
    this.email,
    this.birthDay,
    this.phoneNumber,
    this.name,
    this.gender,
    this.refferalCode,
    this.refferalUserId,
    this.name__Filter,
    this.username__Filter,
    this.PersonalInfo,
    this.phoneNumber__Filter,
    this.blockAt__Filter,
    this.isAdmin,
    this.blockAt,
  });

  factory UserQueryModel.fromJson(Map<String, dynamic> json) =>
      _$UserQueryModelFromJson(json);

  Map<String, dynamic> toJson() => PrismaUtil.replaceFilterValue(_$UserQueryModelToJson(this));
}

@JsonSerializable()
class PersonalInfoQuery {
  String? userId;
  String? birth;
  String? birthday;
  String? carrier;
  bool? certified;
  DateTime? certified_at;
  bool? foreigner;
  bool? foreigner_v2;
  String? gender;
  String? imp_uid;
  String? name;
  String? origin;
  String? pg_provider;
  String? pg_tid;
  String? phone;
  String? unique_in_site;
  String? unique_key;

  PersonalInfoQuery({
    this.userId,
    this.birth,
    this.birthday,
    this.carrier,
    this.certified,
    this.certified_at,
    this.foreigner,
    this.foreigner_v2,
    this.gender,
    this.imp_uid,
    this.name,
    this.origin,
    this.pg_provider,
    this.pg_tid,
    this.phone,
    this.unique_in_site,
    this.unique_key,
  });

  factory PersonalInfoQuery.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoQueryFromJson(json);

  Map<String, dynamic> toJson() =>
      PrismaUtil.toPrismaQuery(_$PersonalInfoQueryToJson(this));
}

@JsonSerializable()
class UserInclude extends BaseModel {
  bool? refferalUser;

  bool? refferaledUsers;

  bool? PersonalInfo;

  bool? Subscribe;

  bool? Purchase;

  @JsonKey(name: "_count")
  bool? count;

  UserInclude(
      {this.count,
      this.PersonalInfo,
      this.Purchase,
      this.refferaledUsers,
      this.refferalUser,
      this.Subscribe});

  factory UserInclude.fromJson(Map<String, dynamic> json) =>
      _$UserIncludeFromJson(json);

  Map<String, dynamic> toJson() => _$UserIncludeToJson(this);
}

@JsonSerializable()
class UserOrder extends BaseModel {
  String? userId;
  String? hashedPassword;
  String? username;
  String? email;
  String? birthDay;
  String? phoneNumber;
  String? name;
  String? gender;
  String? refferalCode;
  String? isAdmin;
  String? blockAt;

  UserOrder({
    this.userId,
    this.hashedPassword,
    this.username,
    this.email,
    this.birthDay,
    this.phoneNumber,
    this.name,
    this.gender,
    this.refferalCode,
    this.isAdmin,
    this.blockAt,
  });

  factory UserOrder.fromJson(Map<String, dynamic> json) =>
      _$UserOrderFromJson(json);

  Map<String, dynamic> toJson() => _$UserOrderToJson(this);
}
