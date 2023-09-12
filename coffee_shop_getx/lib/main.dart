import 'package:coffee_shop_get/controllers/bindings/cart_binding.dart';
import 'package:coffee_shop_get/controllers/bindings/coffee_binding.dart';
import 'package:coffee_shop_get/controllers/bindings/order_binding.dart';
import 'package:coffee_shop_get/controllers/bindings/search_bending.dart';
import 'package:coffee_shop_get/controllers/bindings/tea_binding.dart';
import 'package:coffee_shop_get/view/screens/auth_screen.dart';
import 'package:coffee_shop_get/view/screens/cart_screen.dart';
import 'package:coffee_shop_get/view/screens/coffee_screen.dart';
import 'package:coffee_shop_get/view/screens/contactus_screen.dart';
import 'package:coffee_shop_get/view/screens/home_screen.dart';
import 'package:coffee_shop_get/view/screens/juice_screen.dart';
import 'package:coffee_shop_get/view/screens/order_screen.dart';
import 'package:coffee_shop_get/view/screens/search_screen.dart';
import 'package:coffee_shop_get/view/screens/splash_screen.dart';
import 'package:coffee_shop_get/view/screens/tea_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'consts/app_constants.dart';
import 'controllers/bindings/auth_binding.dart';
import 'controllers/bindings/juice_binding.dart';
import 'controllers/bindings/splash_binding.dart';


void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Shop',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      getPages: [
        GetPage(
          name: Appconstants.homeroute,
          page: () => HomeScreen(),
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
        GetPage(
          name: Appconstants.cartroute,
          page: () => CartScreen(),
          binding: CartBinding(),
        ),
        GetPage(
          name: Appconstants.searchroute,
          page: () => SearchScreen(),
          binding: SearchBinding(),
        ),
        GetPage(
          name: Appconstants.contactroute,
          page: () => ContactUsScreen(),

        ),
      ],
      initialRoute: Appconstants.splashroute,
    );
  }
}
