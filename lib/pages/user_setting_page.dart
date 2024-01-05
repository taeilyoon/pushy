// write start 2023/04/02

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pushy/services/auth_service.dart';

class UserSettingPageController extends GetxController {}

class UserSettingPage extends GetView<UserSettingPageController> {
  static String url = "/userSetting";
  static GetPage route = GetPage(
      name: UserSettingPage.url,
      page: () => UserSettingPage(),
      binding: BindingsBuilder(() {
        Get.put(UserSettingPageController());
      }));

  const UserSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("알림 설정"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("로그아웃"),
            onTap: () {
              AuthService.to.logout();
            },
          ),
          ListTile(
            title: Text("라이선스 정보"),
            onTap: () {
              Get.to(LicensePage());
            },
          ),

          ListTile(
            title: Text("기타 정보"),
            subtitle: FutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder: (context, snapshot) {

                if(snapshot.hasData == false) {
                  return Text("로딩중");
                }

                return Text( FirebaseMessaging.instance.app.options.projectId == "boss-a35e7" ?
                  "BossPrime 알리미 ${snapshot.data?.buildNumber}"
                    :   "추세선생 알리미 ${snapshot.data?.buildNumber}"
                );
              }
            ),
            onTap: () {
              Get.to(LicensePage());
            },
          )
        ],
      ),
    );
  }
}
