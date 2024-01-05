// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateTimeFilter _$DateTimeFilterFromJson(Map<String, dynamic> json) =>
    DateTimeFilter(
      equals: json['equals'] == null
          ? null
          : DateTime.parse(json['equals'] as String),
      in_: (json['in'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList(),
      notIn: (json['notIn'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList(),
      lt: json['lt'] == null ? null : DateTime.parse(json['lt'] as String),
      lte: json['lte'] == null ? null : DateTime.parse(json['lte'] as String),
      gt: json['gt'] == null ? null : DateTime.parse(json['gt'] as String),
      gte: json['gte'] == null ? null : DateTime.parse(json['gte'] as String),
      contains: json['contains'] == null
          ? null
          : DateTime.parse(json['contains'] as String),
      startsWith: json['startsWith'] == null
          ? null
          : DateTime.parse(json['startsWith'] as String),
      endsWith: json['endsWith'] == null
          ? null
          : DateTime.parse(json['endsWith'] as String),
      not__Filter: json['not__Filter'] == null
          ? null
          : DateTimeFilter.fromJson(
              json['not__Filter'] as Map<String, dynamic>),
      not: json['not'] == null ? null : DateTime.parse(json['not'] as String),
    );

Map<String, dynamic> _$DateTimeFilterToJson(DateTimeFilter instance) =>
    <String, dynamic>{
      'equals': instance.equals?.toIso8601String(),
      'in': instance.in_?.map((e) => e.toIso8601String()).toList(),
      'notIn': instance.notIn?.map((e) => e.toIso8601String()).toList(),
      'lt': instance.lt?.toIso8601String(),
      'lte': instance.lte?.toIso8601String(),
      'gt': instance.gt?.toIso8601String(),
      'gte': instance.gte?.toIso8601String(),
      'contains': instance.contains?.toIso8601String(),
      'startsWith': instance.startsWith?.toIso8601String(),
      'endsWith': instance.endsWith?.toIso8601String(),
      'not__Filter': instance.not__Filter,
      'not': instance.not?.toIso8601String(),
    };

NestedDateTimeFilter _$NestedDateTimeFilterFromJson(
        Map<String, dynamic> json) =>
    NestedDateTimeFilter(
      equals: json['equals'] == null
          ? null
          : DateTime.parse(json['equals'] as String),
      in_: (json['in'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList(),
      notIn: (json['notIn'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList(),
      lt: json['lt'] == null ? null : DateTime.parse(json['lt'] as String),
      lte: json['lte'] == null ? null : DateTime.parse(json['lte'] as String),
      gt: json['gt'] == null ? null : DateTime.parse(json['gt'] as String),
      gte: json['gte'] == null ? null : DateTime.parse(json['gte'] as String),
      contains: json['contains'] == null
          ? null
          : DateTime.parse(json['contains'] as String),
      startsWith: json['startsWith'] == null
          ? null
          : DateTime.parse(json['startsWith'] as String),
      endsWith: json['endsWith'] == null
          ? null
          : DateTime.parse(json['endsWith'] as String),
      not__Filter: json['not__Filter'] == null
          ? null
          : NestedDateTimeFilter.fromJson(
              json['not__Filter'] as Map<String, dynamic>),
      not: json['not'] == null ? null : DateTime.parse(json['not'] as String),
    );

Map<String, dynamic> _$NestedDateTimeFilterToJson(
        NestedDateTimeFilter instance) =>
    <String, dynamic>{
      'equals': instance.equals?.toIso8601String(),
      'in': instance.in_?.map((e) => e.toIso8601String()).toList(),
      'notIn': instance.notIn?.map((e) => e.toIso8601String()).toList(),
      'lt': instance.lt?.toIso8601String(),
      'lte': instance.lte?.toIso8601String(),
      'gt': instance.gt?.toIso8601String(),
      'gte': instance.gte?.toIso8601String(),
      'contains': instance.contains?.toIso8601String(),
      'startsWith': instance.startsWith?.toIso8601String(),
      'endsWith': instance.endsWith?.toIso8601String(),
      'not__Filter': instance.not__Filter,
      'not': instance.not?.toIso8601String(),
    };
