import 'package:get/get.dart';
import '../models/Coffee.dart';
import '../screens/order_screen.dart';
class CoffeeController extends GetxController {
  var _coffeeList = <Coffee>[].obs;

  List<Coffee> get getCoffeeList => _coffeeList;

  @override
  void onInit() {
    super.onInit();
    var list = [
      Coffee(
        id: '1',
        name: 'Espresso',
        icon: 'images/espresso.png',
        price: 15.25,
      ),
      Coffee(
        id: '2',
        name: 'Cappuccino',
        icon: 'images/Macchiato.png',
        price: 18.00,
      ),
      Coffee(
        id: '3',
        name: 'Macchiato',
        icon: 'images/espresso.png',
        price: 22.20,
      ),
      Coffee(
        id: '4',
        name: 'Mocha',
        icon: 'images/Macchiato.png',
        price: 24.66,
      ),
      Coffee(
        id: '5',
        name: 'Latte',
        icon: 'images/espresso.png',
        price: 30.55,
      ),
      Coffee(
        id: '5',
        name: 'Americano',
        icon: 'images/Macchiato.png',
        price: 45.55,
      ),
      Coffee(
        id: '5',
        name: 'Doppio',
        icon: 'images/espresso.png',
        price: 25.99,
      ),
    ];
    _coffeeList.addAll(list);
  }

  navigateToOrderScreen(int index) {
    Get.toNamed(OrderScreen.routeName, arguments: _coffeeList[index]);
  }
}
