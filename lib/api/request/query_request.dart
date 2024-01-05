import 'package:json_annotation/json_annotation.dart';
import 'package:pushy/api/request/prisma_util.dart';

import 'base_model.dart';

class QueryRequest<WHERE extends BaseModel, INCLUDE extends BaseModel,
    OREDERBY extends BaseModel> {
  WHERE? where;
  INCLUDE? include;
  OREDERBY? orderBy;
  int? skip;
  int? take;

  QueryRequest({this.where, this.include, this.take, this.orderBy, this.skip});

  Map<String, dynamic> toJson(){
    return PrismaUtil.toPrismaQuery({
      "where" : PrismaUtil.toPrismaQuery(where?.toJson()),
      "include" : PrismaUtil.toPrismaQuery(include?.toJson()),
      "orderBy" : PrismaUtil.toPrismaQuery(orderBy?.toJson()),
      "skip" : skip,
      "take" : take
    });
  }
}
