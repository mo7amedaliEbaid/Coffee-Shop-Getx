import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/drink_model.dart';


class OrderController extends GetxController {
  GetStorage box = GetStorage();
  RxList<Drink> cartlist = <Drink>[].obs;

  var _selectedCupSize = 1.obs;

  get getSelectedCupSize => _selectedCupSize.value;

  var _selectedSugarCubes = 1.obs;

  get getSelectedSugarCubes => _selectedSugarCubes.value;
  late Drink _drink;


  Drink get getdrink => _drink;

  setSelectedCupSize(val) {
    _selectedCupSize.value = val;
  }

  setSelectedSugarCube(val) {
    _selectedSugarCubes.value = val;
  }

  void getCoffeeArgs() {
    _drink = Get.arguments;
    print(_drink.name);
  }

  showErrorSnackBar(var title) {
    Get.snackbar(
      'Error',
      title,
      backgroundColor: Colors.black,
      colorText: Colors.white,
    );
  }

  showSuccessSnackBar(var title) {
    Get.snackbar(
      'Success',
      title,
      backgroundColor: Colors.black,
      colorText: Colors.white,
    );
  }

  void addItemToCart(Drink drink) {
    drink.qty = 1;
    cartlist.add(drink);
    showSuccessSnackBar(
      'Order Added To Cart Successfully',
    );
    List<Map<String, dynamic>> items_cart =
        cartlist.map((Drink e) => e.toJson()).toList();

    box.write('items_cart', items_cart);
  }

  void updatingSession() {
    box.listenKey('items_cart', (updatedValue) {
      print(" $updatedValue");
      if (updatedValue is List) {
        cartlist.clear();
        cartlist.addAll(updatedValue.map((e) => Drink.fromMap(e)).toList());
      }
    });
  }

  void decreaseQtyOfItemInCart(Drink drink) {
    if (drink.qty == 1) {
      cartlist.removeWhere((Drink selectedItem) => selectedItem.id == drink.id);
    } else {
      cartlist.removeWhere((Drink selectedItem) => selectedItem.id == drink.id);
      drink.qty--;
      cartlist.add(drink);
    }
    List<Map<String, dynamic>> items_cart =
        cartlist.map((Drink e) => e.toJson()).toList();
    box.write('items_cart', items_cart);
  }

  void increaseQtyOfItemInCart(Drink drink) {
    cartlist.removeWhere((Drink selectedItem) => selectedItem.id == drink.id);
    drink.qty++;
    cartlist.add(drink);

    List<Map<String, dynamic>> items_cart =
        cartlist.map((Drink e) => e.toJson()).toList();
    box.write('items_cart', items_cart);
  }

  void removeSelectedItemFromCart(int id) {
    cartlist.removeWhere((Drink selectedItem) => selectedItem.id == id);
  //  _totalPrice.value == 0;
    List<Map<String, dynamic>> items_cart =
        cartlist.map((Drink e) => e.toJson()).toList();
    showSuccessSnackBar(
      'Order Removed From Cart Successfully',
    );
    box.write('items_cart', items_cart);
  }

  void getUpdatedSessionCartData() {
    if (box.hasData('items_cart')) {
      List<dynamic> value = GetStorage().read('items_cart');
      if (value is List) {
        List<Drink> getModelFromSession =
            value.map((e) => Drink.fromMap(e)).toList();
        cartlist.clear();
        cartlist.addAll(getModelFromSession);
      }
    }
    updatingSession();
  }

  @override
  void onReady() {
    getUpdatedSessionCartData();
    super.onReady();
  }

  void logout() {
    box.erase();
    Get.offAllNamed('/splash');
  }

  @override
  void onInit() {
    super.onInit();
    getCoffeeArgs();
  }
}
