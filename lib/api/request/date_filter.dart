import 'package:json_annotation/json_annotation.dart';
import 'package:pushy/api/request/prisma_util.dart';

part 'date_filter.g.dart';

@JsonSerializable()
class DateTimeFilter {
  DateTime? equals;
  @JsonKey(name: "in")
  List<DateTime>? in_;
  List<DateTime>? notIn;
  DateTime? lt;
  DateTime? lte;
  DateTime? gt;
  DateTime? gte;
  DateTime? contains;
  DateTime? startsWith;
  DateTime? endsWith;
  DateTimeFilter? not__Filter;
  DateTime? not;

  DateTimeFilter({
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

  factory DateTimeFilter.fromJson(Map<String, dynamic> json) =>
      _$DateTimeFilterFromJson(json);

  Map<DateTime, dynamic> toJson() => PrismaUtil.toPrismaQuery(_$DateTimeFilterToJson(this));
}

@JsonSerializable()
class NestedDateTimeFilter {
  DateTime? equals;
  @JsonKey(name: "in")
  List<DateTime>? in_;
  List<DateTime>? notIn;
  DateTime? lt;
  DateTime? lte;
  DateTime? gt;
  DateTime? gte;
  DateTime? contains;
  DateTime? startsWith;
  DateTime? endsWith;
  NestedDateTimeFilter? not__Filter;
  DateTime? not;

  NestedDateTimeFilter({
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

  factory NestedDateTimeFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedDateTimeFilterFromJson(json);

  Map<String, dynamic> toJson() => _$NestedDateTimeFilterToJson(this);
}


