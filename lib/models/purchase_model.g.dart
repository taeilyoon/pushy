// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseModel _$PurchaseModelFromJson(Map<String, dynamic> json) =>
    PurchaseModel(
      purchaseId: json['purchaseId'] as String,
      paymentMethod: json['paymentMethod'] as String,
      amount: json['amount'] as num,
      paymentStatus: $enumDecode(_$PaymentStatusEnumMap, json['paymentStatus']),
      userUserId: json['userUserId'] as String,
      name: json['name'] as String,
      tid: json['tid'] as String?,
      createdAt:
          const DatetimeJsonConverter().fromJson(json['createdAt'] as String),
      updatedAt:
          const DatetimeJsonConverter().fromJson(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      subscriptionSubscriptionId: json['subscriptionSubscriptionId'],
      productProductId: json['productProductId'],
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$PurchaseModelToJson(PurchaseModel instance) =>
    <String, dynamic>{
      'purchaseId': instance.purchaseId,
      'paymentMethod': instance.paymentMethod,
      'amount': instance.amount,
      'paymentStatus': _$PaymentStatusEnumMap[instance.paymentStatus]!,
      'userUserId': instance.userUserId,
      'name': instance.name,
      'tid': instance.tid,
      'createdAt': const DatetimeJsonConverter().toJson(instance.createdAt),
      'updatedAt': const DatetimeJsonConverter().toJson(instance.updatedAt),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'subscriptionSubscriptionId': instance.subscriptionSubscriptionId,
      'productProductId': instance.productProductId,
      'reason': instance.reason,
    };

const _$PaymentStatusEnumMap = {
  PaymentStatus.all: 'all',
  PaymentStatus.pending: 'PENDING',
  PaymentStatus.paid: 'PAID',
  PaymentStatus.refunded: 'REFUNDED',
  PaymentStatus.refundWait: 'REFUND_WAIT',
  PaymentStatus.failed: 'FAILED',
  PaymentStatus.used: 'USED',
};
