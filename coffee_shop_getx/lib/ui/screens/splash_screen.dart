
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  static const routeNamed = '/splashScreen';

  SplashController _splashController = Get.find();

  @override
  Widget build(BuildContext context) {
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
          /*Align(
            alignment: Alignment.center,
            child: Container(
              height: 150,
              width: 120,
              child: Image.asset(
                'images/splash2.jpeg',
                fit: BoxFit.fill,
              ),
            ),
          ),*/
        ],
      ),
    ));
  }
}
