import 'package:coffee_shop_get/models/drink_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  RxList<Drink> cart = <Drink>[].obs;
  GetStorage box = GetStorage();
  RxInt grandTotal = 0.obs;
  Map<String, dynamic> userSession = GetStorage().read('auth');

  void removeSelectedItemFromCart(int index) {
    cart.removeAt(index);

    List<Map<String, dynamic>> items_cart =
    cart.map((Drink e) => e.toJson()).toList();

    box.write('items_cart', items_cart);
  }

  void increaseQtyOfSelectedItemInCart(int index) {
    cart[index].qty++;

    List<Map<String, dynamic>> items_cart =
    cart.map((Drink e) => e.toJson()).toList();

    box.write('items_cart', items_cart);
  }

  void decreaseQtyOfSelectedItemInCart(int index, Drink drink) {
    if (drink.qty == 1) {
      cart.removeAt(index);
    } else {
      cart[index].qty--;
    }
    List<Map<String, dynamic>> items_cart =
    cart.map((Drink e) => e.toJson()).toList();

    box.write('items_cart', items_cart);
  }

  void calculateGrandTotal() {
    grandTotal.value = 0;
    for (int i = 0; i < cart.length; i++) {
      grandTotal = grandTotal + (cart[i].qty * cart[i].price).round();
    }
  }

  void updatingSession() {
    box.listenKey('items_cart', (updatedValue) {
      if (updatedValue is List) {
        cart.clear();
        cart.addAll(updatedValue.map((e) => Drink.fromMap(e)).toList());
        calculateGrandTotal();
      }
    });
  }

  void getUpdatedSessionCartData() {
    if (box.hasData('items_cart')) {
      List<dynamic> value = GetStorage().read('items_cart');
      if (value is List) {
        cart.clear();
        cart.addAll(value.map((e) => Drink.fromMap(e)).toList());
        calculateGrandTotal();
      }
    }
    updatingSession();
  }

  @override
  void onReady() {
    getUpdatedSessionCartData();
    super.onReady();
  }

  void transactionCompleted() {
    box.write("items_cart", []).then((value) {
      grandTotal.value = 0;
      cart.clear();
      Get.back();
      Get.snackbar("Message", "Transaction succeed ! ",
          colorText: Colors.white,
          backgroundColor: Color(0xff4D4D4D),
          snackPosition: SnackPosition.BOTTOM);
    });
  }
}
