
import 'package:coffee_shop_get/view/widgets/greatday_widget.dart';
import 'package:coffee_shop_get/view/screens/tea_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/app_constants.dart';
import '../../consts/global_constants.dart';
import '../widgets/greatday_widget.dart';
import 'coffee_screen.dart';
import 'juice_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/homescreen';
  final String title = "A Drink";
  final String cat1 = "Coffee";
  final String cat2 = "Juice";
  final String cat3 = "Tea";

  @override
  Widget build(BuildContext context) {
    TextStyle? coffeestyle = Theme.of(context).textTheme.headline5?.copyWith(
          color: Colors.brown,
          letterSpacing: 2.0,
          fontSize: 36.0,
        );
    TextStyle? juicestyle = Theme.of(context).textTheme.headline5?.copyWith(
      color: Colors.red,
      letterSpacing: 2.0,
      fontSize: 36.0,
    );
    TextStyle? teastyle = Theme.of(context).textTheme.headline5?.copyWith(
      color: teacolor,
      letterSpacing: 2.0,
      fontSize: 36.0,
    );
    return Scaffold(
      backgroundColor: homescafold_color,
      body: SafeArea(
        child: Column(
          children: [
            kSizedBox,
            greatday(context, title, hometitle_color),
            SizedBox(height: MediaQuery.of(context).size.height*.08,),
            InkWell(
              onTap: () => Get.toNamed(Appconstants.coffeeroute),
              child: buildcategorytile(context, Appconstants.catsimgs[0], cat1,
                  coffeestyle!, authbackcolor),
            ),
            kSizedBox,
            InkWell(
              onTap: () => Get.toNamed(Appconstants.juiceroute),
              child: buildcategorytile(context, Appconstants.catsimgs[1], cat2,
                  juicestyle!, Colors.orangeAccent.shade100),
            ),
            kSizedBox,
            InkWell(
              onTap: (){
                Get.to(() => TeaScreen());
              },
              child: buildcategorytile(context, Appconstants.catsimgs[2], cat3,
                  teastyle!, Colors.brown.shade200),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildcategorytile(BuildContext context, String assetimage, String cat,
    TextStyle catstyle, Color catcolor) {
  Size size = MediaQuery.of(context).size;
  return Container(
    height: size.height * .18,
    width: size.width,
    padding: EdgeInsets.symmetric(vertical: 28, horizontal: 10),
    decoration:
        BoxDecoration(color: catcolor, borderRadius: BorderRadius.circular(20)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: size.height * .15,
          width: size.width * .3,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(assetimage), fit: BoxFit.fill)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cat,
            style: catstyle,
          ),
        ),
        Icon(Icons.arrow_forward_ios)
      ],
    ),
  );
}
