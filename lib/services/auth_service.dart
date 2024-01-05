import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:pushy/api/user.api.dart';
import 'package:pushy/global.dart';
import 'package:pushy/pages/login_page.dart';

import '../models/user_model.dart';
import 'local_stroage_service.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find<AuthService>();

  RxBool checkDev = RxBool(false);
  late UserApi uapi;
  Rxn<UserModel> user = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    uapi = UserApi(Global.dio, baseUrl: Global.url);
  }

  Future<UserModel> signIn({
    required String id,
    required String password,
  }) async {
    var s = await uapi.signIn(id: id, password: password);
    LocalStorageService.to.userToken = s;
    Global.dio.options.headers["access_token"] = "${s}";
    return await uapi.getUser().then((value) {
      user.value = value;
      updateToken();
      return value;
    });
  }

  Future autoSignIn() async {
    var s = LocalStorageService.to.userToken;
    Global.dio.options.headers["access_token"] = "${s}";
    return await uapi.getUser().then((value) {
      user.value = value;
      updateToken();
      return value;
    });
  }

  updateToken() async {
    var s = await FirebaseMessaging.instance.getToken();
    FirebaseMessaging.instance.onTokenRefresh.listen((event) {
      uapi
          .patch(userModel: UserUpdateModel(nativeMobileAppToken: event))
          .then((value) {
        print("ss");
      });
    });

    var ss = await uapi
        .patch(userModel: UserUpdateModel(nativeMobileAppToken: s))
        .then((value) {
      print("ss");
    });
  }

  void logout() {
    LocalStorageService.to.userToken = null;
    user.value = null;
    Get.offAllNamed(LoginPage.url);
  }
}
