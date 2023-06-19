import 'package:coffee_shop_get/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String name = '', email = '', password = '';

  RxBool isObsecure = true.obs;

  void toggleObsecure() {
    if (isObsecure.value == true) {
      isObsecure.value = false;
    } else {
      isObsecure.value = true;
    }
  }

  void saveSession() {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();

      Map<String, dynamic> auth = {
        "name": name,
        "email": email,
        "password": password,
      };
      GetStorage().write('auth', auth);
      Get.offAllNamed(Appconstants.homeroute);
    }
  }
}
