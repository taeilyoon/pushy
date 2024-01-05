// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pushnotification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushnotificationModel _$PushnotificationModelFromJson(
        Map<String, dynamic> json) =>
    PushnotificationModel(
      userNotificationId: json['userNotificationId'] as String,
      userId: json['userId'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      link: json['link'] as String?,
      action: json['action'],
      actionLink: json['actionLink'],
      notificationId: json['notificationId'],
      checkedAt: json['checkedAt'],
      deletedAt: _$JsonConverterFromJson<String, DateTime>(
          json['deletedAt'], const DatetimeJsonConverter().fromJson),
      createdAt:
          const DatetimeJsonConverter().fromJson(json['createdAt'] as String),
      updatedAt:
          const DatetimeJsonConverter().fromJson(json['updatedAt'] as String),
    );

Map<String, dynamic> _$PushnotificationModelToJson(
        PushnotificationModel instance) =>
    <String, dynamic>{
      'userNotificationId': instance.userNotificationId,
      'userId': instance.userId,
      'title': instance.title,
      'content': instance.content,
      'link': instance.link,
      'action': instance.action,
      'actionLink': instance.actionLink,
      'notificationId': instance.notificationId,
      'checkedAt': instance.checkedAt,
      'deletedAt': _$JsonConverterToJson<String, DateTime>(
          instance.deletedAt, const DatetimeJsonConverter().toJson),
      'createdAt': const DatetimeJsonConverter().toJson(instance.createdAt),
      'updatedAt': const DatetimeJsonConverter().toJson(instance.updatedAt),
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
