import 'package:json_annotation/json_annotation.dart';


abstract class BaseModel {
  BaseModel();

  Map<String, dynamic> toJson();
}

