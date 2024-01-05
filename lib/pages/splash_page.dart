// write start 2023/04/04

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pushy/pages/notification_list_page.dart';
import 'package:pushy/services/auth_service.dart';

import '../components/logo.dart';
import 'login_page.dart';

class SplashPageController extends GetxController {

  checkPermission() async {
    var s = await Permission.notification.request();
    if(s.isDenied || s.isPermanentlyDenied){
        return await Get.dialog(AlertDialog(
          title: Text("알림 권한이 필요합니다."),
          content: Text("알림 권한을 허용해주세요."),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("취소"),
            ),
            TextButton(
              onPressed: () async {
                await openAppSettings();
                Get.back();
              },
              child: Text("확인"),
            ),
          ],
        ));
    }else{
      return;
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    checkPermission().then((value) {
      FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      AuthService.to.autoSignIn().then((value) {
        Get.offAllNamed(NotificationListPage.url);
      }).catchError((e){
        Get.offAllNamed(LoginPage.url);
      });
    });

  }
}

class SplashPage extends GetView<SplashPageController> {
  static String url = "/splash";
  static GetPage route = GetPage(
      name: SplashPage.url,
      page: () => SplashPage(),
      binding: BindingsBuilder(() {
        Get.put(SplashPageController());
      }));

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        child: Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: Logo(),
          ),
        ),
      ),
    );
  }
}
