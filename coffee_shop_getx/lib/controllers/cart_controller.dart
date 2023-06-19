import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

import '../models/drink_model.dart';

class CartController extends GetxController {
  GetStorage box = GetStorage();
  RxList<Drink> cartlist = <Drink>[].obs;

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
}
