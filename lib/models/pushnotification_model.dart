import 'package:json_annotation/json_annotation.dart';
import 'package:pushy/models/user_model.dart';

part 'pushnotification_model.g.dart';

@JsonSerializable()
class PushnotificationModel {
  String userNotificationId;
  String? userId;
  String? title;
  String? content;
  String? link;
  dynamic action;
  dynamic actionLink;
  dynamic notificationId;
  dynamic checkedAt;
  @DatetimeJsonConverter()
  DateTime? deletedAt;
  @DatetimeJsonConverter()
  DateTime createdAt;
  @DatetimeJsonConverter()
  DateTime updatedAt;

  PushnotificationModel(
      { required this.userNotificationId,
       required this.userId,
       required this.title,
       required this.content,
       required this.link,
        this.action,
       this.actionLink,
       this.notificationId,
       this.checkedAt,
       this.deletedAt,
       required this.createdAt,
       required this.updatedAt});

  factory PushnotificationModel.fromJson(Map<String, dynamic> json) =>
      _$PushnotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PushnotificationModelToJson(this);
}
