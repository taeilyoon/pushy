import 'package:json_annotation/json_annotation.dart';
import 'package:pushy/models/user_model.dart';

part 'purchase_model.g.dart';

@JsonSerializable()
class PurchaseModel {
  String purchaseId;
  String paymentMethod;
  num amount;
  PaymentStatus paymentStatus;
  String userUserId;
  String name;
  String? tid;
  @DatetimeJsonConverter()
  DateTime createdAt;
  @DatetimeJsonConverter()
  DateTime updatedAt;
  DateTime? deletedAt;
  dynamic subscriptionSubscriptionId;
  dynamic productProductId;
  String? reason;

  PurchaseModel(
      {required this.purchaseId,
      required this.paymentMethod,
      required this.amount,
      required this.paymentStatus,
      required this.userUserId,
      required this.name,
      this.tid,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      this.subscriptionSubscriptionId,
      this.productProductId,
      this.reason});

  factory PurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseModelToJson(this);

  
}

enum PaymentStatus {
  all('all', '전체'),
  @JsonValue("PENDING")
  pending('PENDING', '결제 대기중'),
  @JsonValue("PAID")
  paid('PAID', '결제완료'),
  @JsonValue("REFUNDED")
  refunded('REFUNDED', '환불완료'),
  @JsonValue("REFUND_WAIT")
  refundWait('REFUND_WAIT', '환불대기'),
  @JsonValue("FAILED")
  failed('FAILED', '기한만료'),
  @JsonValue("USED")
  used('USED', '사용중');

  final String en;
  final String ko;
  const PaymentStatus(this.en, this.ko);
  factory PaymentStatus.fromKo(String ko) {
    switch (ko) {
      case '결제 대기중':
        return PaymentStatus.pending;
      case '결제완료':
        return PaymentStatus.paid;
      case '환불완료':
        return PaymentStatus.refunded;
      case '환불대기':
        return PaymentStatus.refundWait;
      case '기한만료':
        return PaymentStatus.failed;
      case '전체':
        return PaymentStatus.all;
      case '사용중':
        return PaymentStatus.used;
      default:
        return PaymentStatus.all;
    }
  }
}
