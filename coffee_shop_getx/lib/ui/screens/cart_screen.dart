import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/cart_controller.dart';
class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);
  CartController _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Center(
        child: Text(_cartController.myorder.coffee?.name.toString()??""),
      ),
    );
  }
}
