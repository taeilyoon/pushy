// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'string_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StringFilter _$StringFilterFromJson(Map<String, dynamic> json) => StringFilter(
      equals: json['equals'] as String?,
      in_: (json['in'] as List<dynamic>?)?.map((e) => e as String).toList(),
      notIn:
          (json['notIn'] as List<dynamic>?)?.map((e) => e as String).toList(),
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      contains: json['contains'] as String?,
      startsWith: json['startsWith'] as String?,
      endsWith: json['endsWith'] as String?,
      not__Filter: json['not__Filter'] == null
          ? null
          : NestedStringFilter.fromJson(
              json['not__Filter'] as Map<String, dynamic>),
      not: json['not'] as String?,
    );

Map<String, dynamic> _$StringFilterToJson(StringFilter instance) =>
    <String, dynamic>{
      'equals': instance.equals,
      'in': instance.in_,
      'notIn': instance.notIn,
      'lt': instance.lt,
      'lte': instance.lte,
      'gt': instance.gt,
      'gte': instance.gte,
      'contains': instance.contains,
      'startsWith': instance.startsWith,
      'endsWith': instance.endsWith,
      'not__Filter': instance.not__Filter,
      'not': instance.not,
    };

NestedStringFilter _$NestedStringFilterFromJson(Map<String, dynamic> json) =>
    NestedStringFilter(
      equals: json['equals'] as String?,
      in_: (json['in'] as List<dynamic>?)?.map((e) => e as String).toList(),
      notIn:
          (json['notIn'] as List<dynamic>?)?.map((e) => e as String).toList(),
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      contains: json['contains'] as String?,
      startsWith: json['startsWith'] as String?,
      endsWith: json['endsWith'] as String?,
      not__Filter: json['not__Filter'] == null
          ? null
          : NestedStringFilter.fromJson(
              json['not__Filter'] as Map<String, dynamic>),
      not: json['not'] as String?,
    );

Map<String, dynamic> _$NestedStringFilterToJson(NestedStringFilter instance) =>
    <String, dynamic>{
      'equals': instance.equals,
      'in': instance.in_,
      'notIn': instance.notIn,
      'lt': instance.lt,
      'lte': instance.lte,
      'gt': instance.gt,
      'gte': instance.gte,
      'contains': instance.contains,
      'startsWith': instance.startsWith,
      'endsWith': instance.endsWith,
      'not__Filter': instance.not__Filter,
      'not': instance.not,
    };
