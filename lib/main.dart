import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pushy/firebase_options_line.dart';
import 'package:pushy/global.dart';
import 'package:pushy/pages/login_page.dart';
import 'package:pushy/pages/notification_list_page.dart';
import 'package:pushy/pages/splash_page.dart';
import 'package:pushy/services/auth_service.dart';
import 'package:pushy/services/local_stroage_service.dart';
import 'package:pushy/services/push_service.dart';

import 'firebase_options_boss.dart';
import 'pages/user_setting_page.dart';

@pragma("vm:entry-point")
Future<void> backgroundHandler(RemoteMessage message) async {
  NotificationService.display(message);
}

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  String? flavor = await const MethodChannel('flavor')
      .invokeMethod<String>('getFlavor');
  Config(flavor);

  Get.put(AuthService());
  await Get.put(LocalStorageService()).init();

  var app =  await Firebase.initializeApp(
    name : Global.flavor == "boss" ? 'boss' : 'line',
    options: Global.flavor ==
        "boss" ?
    BossDefaultFirebaseOptions.currentPlatform
        : LineDefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore secAppFirestore =
  FirebaseFirestore.instanceFor(app: app);


  FirebaseMessaging.onMessage.listen(backgroundHandler);
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  FirebaseMessaging.instance.app = app;
  FirebaseMessaging.instance.requestPermission();
  FirebaseMessaging.instance.getToken().then((value) {
    print(value);
  });
  FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    if (event.data['url'] != null) {
      // linkUrl = event.data['url'];
    }
  });

  runApp(const MyApp());
}

void Config(String? flavor) {
  switch (flavor) {
    case 'boss':

      break;
    case 'line':
      Global.dio = Dio(
          BaseOptions(baseUrl: "https://api.xn--9g4bvetcu97d.com", headers: {
            "Access-Control-Allow-Origin": "*",
            "REST_KEY": "LsPhPRP03El7enX4JX15G0y"
          }));

      Global.dio.options.baseUrl = "https://api.xn--9g4bvetcu97d.com";
      Global.flavor = 'line';
      break;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
        scaffoldBackgroundColor: Colors.white,

        fontFamily: 'NotoSansKR',
        primarySwatch: Global.flavor == 'boss' ? const MaterialColor(
          0xFFF27321,
          <int, Color>{
            50: Color(0xfffdeee4),
            100: Color(0xfffbd5bc),
            200: Color(0xfff9b990),
            300: Color(0xfff69d64),
            400: Color(0xfff48842),
            500: Color(0xfff27321),
            600: Color(0xfff06b1d),
            700: Color(0xffee6018),
            800: Color(0xffec5614),
            900: Color(0xffe8430b),
          },
        ) : const MaterialColor(
          0xFF54ac35,
          <int, Color>{
            50: Color(0xFFEAF5E7),
            100: Color(0xFFCCE6C2),
            200: Color(0xFFAAD69A),
            300: Color(0xFF87C572),
            400: Color(0xFF6EB853),
            500: Color(0xFF54ac35),
            600: Color(0xFF4DA530),
            700: Color(0xFF439B28),
            800: Color(0xFF3A9222),
            900: Color(0xFF298216),
          },
        ),
      ),

      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: SplashPage.url,
      getPages: [
        LoginPage.route,
        SplashPage.route,
        NotificationListPage.route,
        UserSettingPage.route,


      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
