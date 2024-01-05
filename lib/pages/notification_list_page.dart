// write start 2023/04/02

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';
import 'package:get/get.dart';
import 'package:pushy/api/push.api.dart';
import 'package:pushy/global.dart';
import 'package:pushy/models/pushnotification_model.dart';
import 'package:pushy/pages/user_setting_page.dart';
import 'package:pushy/utils/date_util.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NotificationListPageController extends GetxController {
  late PushApi api;
  RxList<PushnotificationModel> notificationList =RxList();


  late StreamSubscription<FGBGType> subscription;
  @override
  onInit(){
    super.onInit();

    subscription = FGBGEvents.stream.listen((event) {
      getNotificationList();// FGBGType.foreground or FGBGType.background
    });
    getNotificationList();

    api = PushApi(Global.dio, baseUrl: Global.url);
  }

  getNotificationList() async {
   await  api.list().then((value) {
      notificationList.assignAll(value);
    });
  }

  void toSetting() {
    Get.toNamed(UserSettingPage.url);
  }
}

class NotificationListPage extends GetView<NotificationListPageController> {
  static String url = "/notificationList";
  static GetPage route = GetPage(
      name: NotificationListPage.url,
      page: () => NotificationListPage(),
      binding: BindingsBuilder(() {
        Get.put(NotificationListPageController());
      }));


  const NotificationListPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    controller.getNotificationList();
    return Scaffold(
      appBar: AppBar(
        title: Text("알림 목록"),
        actions: [
          IconButton(
            onPressed: () {
              controller.toSetting();
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        child:
        RefreshIndicator(
          onRefresh: () async {
             await controller.getNotificationList();
          },
          child: Obx(
            ()=> ListView.builder(
              itemCount: controller.notificationList.value.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: (){
                    launchUrlString(controller.notificationList.value[index].link?? "" ,
                    mode : LaunchMode.externalApplication ,);
                  },
                  title: Text(controller.notificationList.value[index].title ?? "제목없음"),
                  subtitle: Text(controller.notificationList.value[index].content?? "제목없음"),
                  trailing: Text(controller.notificationList.value[index].createdAt.toYYMMDDHHMM),
                );
              },
            ),
          ),
        )
      ),
    );
  }
}
