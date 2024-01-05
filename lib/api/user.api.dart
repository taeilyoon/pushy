import 'package:dio/dio.dart';
import 'package:pushy/api/request/query_request.dart';
import 'package:pushy/api/request/string_filter.dart';
import 'package:pushy/models/user_model.dart';
import 'package:retrofit/http.dart';

import '../global.dart';
import 'request/user/user_query_model.dart';

part 'user.api.g.dart';

@RestApi(baseUrl: Global.url)
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  @POST("/user/signup")
  Future signUp({
    @Field("id") required String id,
    @Field("password") required String password,
    @Field("refferal") String? refferal,
    @Field("imp_uid") required String impUid,
  });

  @POST("/user/signin")
  Future signIn({
    @Field("id") required String id,
    @Field("password") required String password,
  });

  @POST("/user/query")
  Future query(
      {@Body()
          required QueryRequest<UserQueryModel, UserInclude, UserOrder>
              queryModel});

  @GET("/user")
  Future<UserModel> getUser();


  @PATCH("/user")
  Future patch(
      {
        @Body()
          required UserUpdateModel userModel}
  );

  @POST("/user/findAccount")
  Future findAccount({
    @Field("imp_uid") required String impUid,
  });

  @POST("/user/certify")
  Future certify({
    @Field("imp_uid") required String impUid,
  });

  @POST("/user/resetPassword")
  Future resetPassword({
    @Field("username") required String userName,
    @Field("password") required String password,
    @Field("imp_uid") required String impUid,
  });
  @DELETE('/user')
  Future deleteUser();
}

main() {
  UserApi(Global.dio)
      .query(
          queryModel: QueryRequest(
              take: 1,
              where: UserQueryModel(
                phoneNumber__Filter: StringFilter(contains: "010").toJson(),
              ),
              include: UserInclude(Purchase: true),
              orderBy: UserOrder(name: 'asc')))
      .then((value) {
    print(value);
  }).catchError((e) {
    print(e);
  });
}
