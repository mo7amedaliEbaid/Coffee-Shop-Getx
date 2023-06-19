
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {

  late SplashController controller;


  @override
  Widget build(BuildContext context) {
    controller = Get.find<SplashController>();
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            height: mediaQuery.height,
            child: Image.asset(
              'images/splash.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              color: Colors.white,
            )

          ),
        ],
      ),
    ));
  }
}
