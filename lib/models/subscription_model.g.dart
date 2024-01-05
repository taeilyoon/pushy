// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscribeModel _$SubscribeModelFromJson(Map<String, dynamic> json) =>
    SubscribeModel(
      subscribeId: json['subscribeId'] as String,
      userId: json['userId'] as String,
      subscriptionId: json['subscriptionId'] as String,
      startDate:
          const DatetimeJsonConverter().fromJson(json['startDate'] as String),
      endDate:
          const DatetimeJsonConverter().fromJson(json['endDate'] as String),
      status: json['status'] as String,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      createdAt:
          const DatetimeJsonConverter().fromJson(json['createdAt'] as String),
      updatedAt:
          const DatetimeJsonConverter().fromJson(json['updatedAt'] as String),
    );

Map<String, dynamic> _$SubscribeModelToJson(SubscribeModel instance) =>
    <String, dynamic>{
      'subscribeId': instance.subscribeId,
      'userId': instance.userId,
      'subscriptionId': instance.subscriptionId,
      'startDate': const DatetimeJsonConverter().toJson(instance.startDate),
      'endDate': const DatetimeJsonConverter().toJson(instance.endDate),
      'status': instance.status,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'createdAt': const DatetimeJsonConverter().toJson(instance.createdAt),
      'updatedAt': const DatetimeJsonConverter().toJson(instance.updatedAt),
    };
