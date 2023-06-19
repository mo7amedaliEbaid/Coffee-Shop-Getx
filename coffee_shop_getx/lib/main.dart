import 'package:coffee_shop_get/controllers/bindings/coffee_binding.dart';
import 'package:coffee_shop_get/controllers/bindings/order_binding.dart';
import 'package:coffee_shop_get/controllers/bindings/tea_binding.dart';
import 'package:coffee_shop_get/view/screens/auth_screen.dart';
import 'package:coffee_shop_get/view/screens/coffee_screen.dart';
import 'package:coffee_shop_get/view/screens/home_screen.dart';
import 'package:coffee_shop_get/view/screens/juice_screen.dart';
import 'package:coffee_shop_get/view/screens/order_screen.dart';
import 'package:coffee_shop_get/view/screens/splash_screen.dart';
import 'package:coffee_shop_get/view/screens/tea_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'consts/app_constants.dart';
import 'controllers/bindings/auth_binding.dart';
import 'controllers/bindings/juice_binding.dart';
import 'controllers/bindings/splash_binding.dart';
import 'controllers/splash_controller.dart';


void main() {
  runApp(MyApp());
}
/*async {
  await GetStorage.init();
 // Get.put(SplashController());
 // Get.put(CoffeeController());
 *//* Get.put(CartController());
  Get.put(OrderController());*//*
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
   // statusBarColor: Colors.pink.shade50,
  ));
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Shop',
      theme: ThemeData(
        primarySwatch: Colors.pink,
       // accentColor: Colors.amber,
       // canvasColor: Colors.pink.shade50,
        /*textTheme: TextTheme(
          headline6: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            letterSpacing: 2.0,
            fontSize: 16.0,
          ),
          headline5: GoogleFonts.indieFlower(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            letterSpacing: 2.0,
            fontSize: 20.0,
          ),
          headline4: GoogleFonts.montserrat(
            color: Colors.white,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w500,
            fontSize: 24.0,
          ),
        ),*/
      ),
      getPages: [
        GetPage(
          name: Appconstants.homeroute,
          page: () => HomeScreen(),
        //  binding: ProductBinding(),
        ),
        GetPage(
          name: Appconstants.authroute,
          page: () => AuthScreen(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: Appconstants.splashroute,
          page: () => SplashScreen(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: Appconstants.coffeeroute,
          page: () => CoffeeScreen(),
          binding: CoffeeBinding(),
        ),
        GetPage(
          name: Appconstants.orderroute,
          page: () => OrderScreen(),
          binding: OrderBinding(),
        ),
        GetPage(
          name: Appconstants.juiceroute,
          page: () => JuiceScreen(),
          binding: JuiceBinding(),
        ),
        GetPage(
          name: Appconstants.tearoute,
          page: () => TeaScreen(),
          binding: TeaBinding(),
        ),
      ],
      initialRoute: Appconstants.splashroute,
    );
  }
}
