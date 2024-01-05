import 'package:dio/dio.dart';
import 'package:pushy/models/pushnotification_model.dart';
import 'package:retrofit/http.dart';

import '../global.dart';

part 'push.api.g.dart';

@RestApi(baseUrl: Global.url)
abstract class PushApi {
  factory PushApi(Dio dio, {String baseUrl}) = _PushApi;
  //
  @GET("/push")
  Future<List<PushnotificationModel>> list(
  );

  @POST("/push")
  Future requestPurchase({
    @Field("users") required List<String> userIds,
    @Field("title") required String title,
    @Field("message") required String message,
    @Field("data") Map? data,
  });

  @POST("/push/{notice}")
  Future requestNoticePurchase({
    @Field("title") required String title,
    @Field("link") required String link,
    @Field("message") required String message,
    @Field("data") required Map data,
    @Path("notice") required String notice,
  });
}
