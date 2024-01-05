import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:native_dialog/native_dialog.dart';
import 'package:pushy/components/logo.dart';
import 'package:pushy/global.dart';
import 'package:pushy/pages/notification_list_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../colors.dart';
import '../components/buttons.dart';
import '../components/mouse_gesture.dart';
import '../components/text_fields.dart';
import '../services/auth_service.dart';

class LoginPageController extends GetxController {
  RxBool passwdVisible = true.obs;

  var idController = TextEditingController();
  var pwController = TextEditingController();

  late String redirect;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  String? validateId(String? value) {
    if (value!.isEmpty) {
      return "아이디를 입력해주세요";
    }
    return null;
  }

  String? validatePw(String? value) {
    if (value!.isEmpty) {
      return "비밀번호를 입력해주세요";
    }
    return null;
  }

  void toSignup(BuildContext context) {
    Get.dialog(AlertDialog(
      title: Text("보스프라잉 웹사이트에서 진행해주세요."),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("확인")),
        TextButton(
            onPressed: () {
              Get.back();
              launchUrl(Uri.parse(Global.bossUrl));
            },
            child: Text("바로가기"))

      ],
    ));
  }

  void toFindAccount() {
    Get.dialog(AlertDialog(
      title: Text("보스프라잉 웹사이트에서 진행해주세요."),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("확인")),
        TextButton(
            onPressed: () {
              Get.back();
              launchUrl(Uri.parse(Global.bossUrl));
            },
            child: Text("바로가기"))

      ],
    ));

  }

  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        final result = await AuthService.to.signIn(
          id: idController.text,
          password: pwController.text,
        );

        if (context.mounted) {
          Get.offAllNamed(NotificationListPage.url);
        }
      } on DioError catch (e) {
        try {
          NativeDialog.alert(e.response!.data['message']);
        } catch (_) {
          NativeDialog.alert('더 나은 서비스 제공을 위해 현재 서버 점검 중입니다.\n나중에 다시 시도해주세요.');
        }
      } catch (_) {
        NativeDialog.alert('더 나은 서비스 제공을 위해 현재 서버 점검 중입니다.\n나중에 다시 시도해주세요.');
      }
    }
  }
}

class LoginPage extends GetView<LoginPageController> {

  static String url = "/login";
  static GetPage route = GetPage(
      name: LoginPage.url,
      page: () => LoginPage(),
      binding: BindingsBuilder(() {
        Get.put(LoginPageController());
      }));
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Form(
              key: controller.formKey,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 500),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(alignment: Alignment.centerLeft, child: Logo()),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "보스프라임 로그인",
                            style: TextStyle(
                                fontSize: 22,
                                color: kTextColor,
                                fontWeight: FontWeight.w700),
                          )),
                      const SizedBox(
                        height: 40,
                      ),
                      DefaultTextField(
                          onEnter: (_) => controller.login(context),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 17, horizontal: 13),
                          validator: controller.validateId,
                          margin: const EdgeInsets.only(bottom: 20),
                          controller: controller.idController,
                          hint: '아이디를 입력해주세요',
                          label: '아이디'),
                      Obx(() => DefaultTextField(
                          onEnter: (_) => controller.login(context),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 17, horizontal: 13),
                          validator: controller.validatePw,
                          margin: const EdgeInsets.only(bottom: 20),
                          controller: controller.pwController,
                          surrfix: MouseGesture(
                            child: Icon(
                              controller.passwdVisible.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 24,
                            ),
                            onTap: () {
                              controller.passwdVisible.toggle();
                            },
                          ),
                          passwdVisible: controller.passwdVisible.value,
                          hint: '비밀번호를 입력해주세요',
                          label: '비밀번호')),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: controller.toFindAccount,
                            child: Text('아이디/비밀번호 찾기'),
                          ),
                          TextButton(
                            onPressed: () => controller.toSignup(context),
                            child: Text('회원가입'),
                          ),
                        ],
                      ),
                      DefaultButton(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        press: () => controller.login(context),
                        text: '로그인',
                      )
                    ],
                  ),
                ),
              ))),
    );
  }
}
