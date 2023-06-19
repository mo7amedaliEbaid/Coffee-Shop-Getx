/*

import 'dart:async';
import 'package:get/get.dart';

import '../view/screens/home_screen.dart';


class SplashController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 5),(){
      Get.offNamed(HomeScreen.routeName);
    });
  }
}*/
import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../consts/app_constants.dart';

class SplashController extends GetxController {
  GetStorage box = GetStorage();

  startChecking() {
    Timer(Duration(seconds: 2), () {
      if (box.hasData('auth')) {
        Get.offNamed(Appconstants.homeroute);
      } else {
        Get.offNamed(Appconstants.authroute);
      }
    });
  }

  @override
  void onReady() {
    startChecking();
    super.onReady();
  }
}
