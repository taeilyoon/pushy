import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pushy/models/purchase_model.dart';
import 'package:pushy/models/subscription_model.dart';

import '../api/request/prisma_util.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String userId;
  String hashedPassword;
  String username;
  dynamic email;
  @DatetimeJsonConverter()
  DateTime birthDay;
  @DatetimeJsonConverter()
  DateTime? deletedAt;
  String phoneNumber;
  String name;
  String gender;
  String refferalCode;
  dynamic refferalUserId;
  bool isAdmin;
  @JsonKey(includeFromJson: false)
  bool selected = false;
  @JsonKey(name: "Purchase")
  List<PurchaseModel>? purchaseList;
  String? token;
  String? nativeMobileAppToken;
  @JsonKey(name: "Subscribe")
  List<SubscribeModel>? subscribe;

  UserModel(
      {required this.userId,
      required this.hashedPassword,
      required this.username,
      this.email,
      required this.birthDay,
      required this.phoneNumber,
      required this.name,
      required this.gender,
      required this.refferalCode,
      this.refferalUserId,
      required this.isAdmin,
        this.nativeMobileAppToken,
      this.purchaseList,
      this.token,
      this.subscribe});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  String get genderKo {
    switch (gender) {
      case 'male':
        return '남자';
      case 'female':
        return '여자';
      default:
        return '';
    }
  }

  SubscribeModel? get subscribeModel {
    if (subscribe?.isNotEmpty == true) {
      return subscribe!.first;
    } else {
      return null;
    }
  }

  DateTime? get subscribeStartDate {
    if (subscribe?.isNotEmpty == true) {
      return subscribe!.first.startDate;
    } else {
      return null;
    }
  }

  SubscribeModel? get notExpireSubscribe {
    final notExpire = subscribe?.firstWhereOrNull(
        (element) => element.endDate.isAfter(DateTime.now()));
    if (notExpire != null) {
      return subscribe!.firstWhereOrNull(
          (element) => element.endDate.isAfter(DateTime.now()));
    } else {
      return null;
    }
  }

  DateTime? get subscribeDate {
    final notExpire = subscribe?.firstWhereOrNull(
        (element) => element.expireDate.isAfter(DateTime.now()));
    if (notExpire != null) {
      return subscribe!
          .firstWhereOrNull(
              (element) => element.expireDate.isAfter(DateTime.now()))
          ?.expireDate
          ;
    } else {
      return null;
    }
  }
}

@JsonSerializable()
class UserUpdateModel {
  String? email;
  String? token;
  String? mobileToken;
  String? nativeMobileAppToken;

  UserUpdateModel({this.email, this.token, this.mobileToken, this.nativeMobileAppToken});

  factory UserUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateModelFromJson(json);

  Map<String, dynamic> toJson() =>
      PrismaUtil.removeNullKey(_$UserUpdateModelToJson(this));
}

class DatetimeJsonConverter extends JsonConverter<DateTime, String> {
  const DatetimeJsonConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json).toLocal();

  @override
  String toJson(DateTime object) => object.toUtc().toIso8601String();
}
