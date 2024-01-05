
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:pushy/pages/notification_list_page.dart';

import 'local_stroage_service.dart';


class NotificationService extends GetxService {
  LocalStorageService storageService = Get.find<LocalStorageService>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    NotificationService.initialize();
  }
  static String? rootChat;
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static DarwinInitializationSettings initializationSettingsDarwin =
  DarwinInitializationSettings(
      onDidReceiveLocalNotification:
      NotificationService.onDidReceiveLocalNotification,
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true

  );

  static void  onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
  }

  static void initialize() {
    InitializationSettings initializationSettings =
    InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher",
      ),
      iOS: initializationSettingsDarwin,
    );

    _notificationsPlugin.initialize(initializationSettings);
    FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  static void display(RemoteMessage message) async {
    print("display");
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      final NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          'high_importance_channel', // id
          'High Importance Notifications', // t
          icon: '@mipmap/ic_launcher',
          importance: Importance.max,
          // priority: Priority.high,
        ),

      );

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data["route"],
      );
    } on Exception catch (e) {

    }
   Get.find<NotificationListPageController>().getNotificationList();

  }

  static requestPermission() async {
    return await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }
}
