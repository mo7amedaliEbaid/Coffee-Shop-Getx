import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/drink_model.dart';
import '../models/order_model.dart';
import '../view/screens/coffee_screen.dart';

class OrderController extends GetxController {
  GetStorage box = GetStorage();
  RxList<Drink> cartlist = <Drink>[].obs;

  late Order _order;

  var _totalPrice = 0.0.obs;

  var _selectedCupSize = 1.obs;

  get getSelectedCupSize => _selectedCupSize.value;

  var _selectedSugarCubes = 1.obs;

  get getSelectedSugarCubes => _selectedSugarCubes.value;
  late Drink _coffee;

  var _quantity = 1.obs;

  get getQuantity => _quantity.value;

  get getTotalPrice => _totalPrice.value;

  Drink get getCoffee => _coffee;

  setSelectedCupSize(val) {
    _selectedCupSize.value = val;
  }

  setSelectedSugarCube(val) {
    _selectedSugarCubes.value = val;
  }

  void getCoffeeArgs() {
    _coffee = Get.arguments;
    print(_coffee.name);
  }

  addQuantity() {
    if (_quantity.value >= 0) {
      _quantity.value++;
      _totalPrice.value = _coffee.price * _quantity.value.toDouble();
      print(_totalPrice);
    } else {
      showErrorSnackBar('Please select valid quantity');
    }
  }

  lessQuantity() {
    if (_quantity > 0) {
      _quantity.value--;
      _totalPrice.value = _coffee.price * _quantity.value.toDouble();
    } else {
      showErrorSnackBar('Please select valid quantity');
    }
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

    List<Map<String, dynamic>> items_cart =
        cartlist.map((Drink e) => e.toJson()).toList();

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

  addToCart() {
    /*  if (_selectedCupSize.value == 2) {
     // _totalPrice += 5 ;
    }
    if (_selectedCupSize.value == 3) {
     // _totalPrice += 10;
    }*/
    if (_quantity.value > 0 && _totalPrice.value != 0) {
      _order = Order(
        coffee: _coffee,
        orderId:
            '${DateTime.now().year} ${DateTime.now().month} ${DateTime.now().day}',
        quantity: _quantity.value,
        totalPrice: _totalPrice.value,
        cupsize: _selectedCupSize.value == 1
            ? 'Small'
            : _selectedCupSize.value == 2
                ? 'Medium'
                : 'Large',
        sugarcbes: _selectedSugarCubes.value,
      );

      if (_order != null) {
        saveOrderToStorage(Order(
          coffee: _order.coffee,
          orderId: _order.orderId,
          quantity: _order.quantity,
          totalPrice: _order.totalPrice,
          cupsize: _order.cupsize,
          sugarcbes: _order.sugarcbes,
        ));

        showSuccessSnackBar(
          'Order Added Successfully',
        );
        //  Get.offNamed(CoffeeScreen.routeNamed);
      } else {
        showErrorSnackBar('Order not saved, Try again later!');
      }
    } else {
      showErrorSnackBar('Please select quantity');
    }
  }

  saveOrderToStorage(Order order) {
    final _box = GetStorage();
    _box.write('Order', order);
    Order myorder = _box.read('Order');
    print(myorder.coffee?.name.toString());
  }

  @override
  void onInit() {
    super.onInit();
    getCoffeeArgs();
    _totalPrice.value = _coffee.price * _quantity.value.toDouble();
  }
}
