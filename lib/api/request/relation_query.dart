// import 'package:json_annotation/json_annotation.dart';
//
// part 'relation_query.g.dart';
//
// @JsonSerializable(
//   genericArgumentFactories: true,
// )
// class RelationQuery<T> {
//   T? every;
//   T? some;
//   T? none;
//
//   RelationQuery({this.every, this.some, this.none});
//
//   factory RelationQuery.fromJson(Map<String, dynamic> json,T Function(Object? json) fjson) => _$RelationQueryFromJson(json, fjson);
//   //
//   Map<String, dynamic> toJson(toJson) => _$RelationQueryToJson(this, toJson);
// }