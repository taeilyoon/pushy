import 'package:json_annotation/json_annotation.dart';
import 'package:pushy/models/user_model.dart';
import 'package:pushy/utils/date_util.dart';
part 'subscription_model.g.dart';

@JsonSerializable()
class SubscribeModel {
  String subscribeId;
  String userId;
  String subscriptionId;
  @DatetimeJsonConverter()
  DateTime startDate;
  @DatetimeJsonConverter()
  DateTime endDate;
  String status;
  DateTime? deletedAt;
  @DatetimeJsonConverter()
  DateTime createdAt;
  @DatetimeJsonConverter()
  DateTime updatedAt;

  SubscribeModel(
      {required this.subscribeId,
      required this.userId,
      required this.subscriptionId,
      required this.startDate,
      required this.endDate,
      required this.status,
      this.deletedAt,
      required this.createdAt,
      required this.updatedAt});

  factory SubscribeModel.fromJson(Map<String, dynamic> json) =>
      _$SubscribeModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubscribeModelToJson(this);

  String get remainDay =>
      '${endDate.removeHour.difference(DateTime.now().removeHour).inDays + 1}일 남음';

  DateTime get expireDate =>
      DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59);
}
