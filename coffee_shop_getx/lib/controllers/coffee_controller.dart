import 'package:get/get.dart';

import '../consts/app_constants.dart';
import '../models/drink_model.dart';
import '../view/screens/order_screen.dart';

class CoffeeController extends GetxController {
  RxList<Drink> _coffeeList = <Drink>[].obs;

  RxList<Drink> get getCoffeeList => _coffeeList;

  @override
  void onInit() {
    super.onInit();
    List<Drink> list = <Drink>[
      Drink(
        id: 1,
        name: 'Espresso',
        icon: 'images/coffee/esep.jpg',
        price: 15.25,
        qty: 0,
        cupsize: 0,
      ),
      Drink(
        id: 2,
        name: 'Cappuccino',
        icon: 'images/coffee/capu.jpeg',
        price: 18.00,
        qty: 0,
        cupsize: 0,
      ),
      Drink(
        id: 3,
        name: 'Macchiato',
        icon: 'images/coffee/machito.jpg',
        price: 22.20,
        qty: 0,
        cupsize: 0,
      ),
      Drink(
        id: 4,
        name: 'Mocha',
        icon: 'images/coffee/mocha.jpg',
        price: 24.66,
        qty: 0,
        cupsize: 0,
      ),
      Drink(
        id: 5,
        name: 'Latte',
        icon: 'images/coffee/latte.jpg',
        price: 30.55,
        qty: 0,
        cupsize: 0,
      ),
      Drink(
        id: 6,
        name: 'Americano',
        icon: 'images/coffee/americano.jpg',
        price: 45.55,
        qty: 0,
        cupsize: 0,
      ),
      Drink(
        id: 7,
        name: 'Doppio',
        icon: 'images/coffee/doppio.jpg',
        price: 25.99,
        qty: 0,
        cupsize: 0,
      ),
    ];
    _coffeeList.addAll(list);
  }

  navigateToOrderScreen(int index) {
    Get.toNamed(Appconstants.orderroute, arguments: _coffeeList[index]);
  }
}
