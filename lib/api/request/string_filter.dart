import 'package:json_annotation/json_annotation.dart';
import 'package:pushy/api/request/prisma_util.dart';

part 'string_filter.g.dart';

@JsonSerializable()
class StringFilter {
  String? equals;
  @JsonKey(name: "in")
  List<String>? in_;
  List<String>? notIn;
  String? lt;
  String? lte;
  String? gt;
  String? gte;
  String? contains;
  String? startsWith;
  String? endsWith;
  NestedStringFilter? not__Filter;
  String? not;

  StringFilter({
    this.equals,
    this.in_,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not__Filter,
    this.not,
  });

  factory StringFilter.fromJson(Map<String, dynamic> json) =>
      _$StringFilterFromJson(json);

  Map<String, dynamic> toJson() =>
      PrismaUtil.removeNullKey(_$StringFilterToJson(this));
}

@JsonSerializable()
class NestedStringFilter {
  String? equals;
  @JsonKey(name: "in")
  List<String>? in_;
  List<String>? notIn;
  String? lt;
  String? lte;
  String? gt;
  String? gte;
  String? contains;
  String? startsWith;
  String? endsWith;
  NestedStringFilter? not__Filter;
  String? not;

  NestedStringFilter({
    this.equals,
    this.in_,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not__Filter,
    this.not,
  });

  factory NestedStringFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedStringFilterFromJson(json);

  Map<String, dynamic> toJson() => _$NestedStringFilterToJson(this);
}
