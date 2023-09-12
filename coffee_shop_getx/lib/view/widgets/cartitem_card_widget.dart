import 'package:coffee_shop_get/consts/global_constants.dart';
import 'package:coffee_shop_get/controllers/order_controller.dart';
import 'package:coffee_shop_get/models/drink_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/cart_controller.dart';

class CartItemCard extends StatelessWidget {
  late CartController controller;
  late OrderController _ordercontroller;
  late int index;
  final Drink drink;

  CartItemCard({
    Key? key,
    required this.index,
    required this.drink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller = Get.find<CartController>();
    _ordercontroller = Get.find<OrderController>();
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      height: size.height * .15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 110.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(drink.icon),
              ),
            ),
          ),
          kSizedBox,
          kSizedBox,
          kSizedBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${drink.name}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                kSizedBox,
                Text(
                  "Price: ${NumberFormat.currency(decimalDigits: 0, symbol: '')
                      .format(drink.price)} \$",
                ),
                kSizedBox,
                Text(
                  "Total • ${NumberFormat.currency(decimalDigits: 0, symbol: '')
                      .format(drink.price * drink.qty)} \$",
                ),
                Expanded(child: _buildQty()),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              _ordercontroller.removeSelectedItemFromCart(drink.id);
            },
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.clear,
                size: 20,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQty() {
    return Row(
      children: [
        IconButton(
          onPressed: () =>
              controller.decreaseQtyOfSelectedItemInCart(index, drink),
          icon: Icon(Icons.remove),
        ),
        Text(drink.qty.toString()),
        IconButton(
          onPressed: () => controller.increaseQtyOfSelectedItemInCart(index),
          icon: Icon(Icons.add),
        )
      ],
    );
  }
}
