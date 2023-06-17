
import 'dart:async';
import 'package:get/get.dart';

import '../ui/screens/dashboard_coffeescreen.dart';


class SplashController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 5),(){
      Get.offNamed(DashboardCoffeeScreen.routeNamed);
    });
  }
}