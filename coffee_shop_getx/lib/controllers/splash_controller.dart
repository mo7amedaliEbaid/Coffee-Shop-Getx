
import 'dart:async';
import 'package:coffee_shop_get/ui/screens/home_screen.dart';
import 'package:get/get.dart';

import '../ui/screens/coffee_screen.dart';


class SplashController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 5),(){
      Get.offNamed(HomeScreen.routeName);
    });
  }
}