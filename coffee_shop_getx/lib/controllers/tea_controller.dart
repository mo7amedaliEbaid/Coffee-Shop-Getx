import 'package:coffee_shop_get/consts/app_constants.dart';
import 'package:coffee_shop_get/dummy_data/dummy_data.dart';
import 'package:get/get.dart';
import '../models/drink_model.dart';

class TeaController extends GetxController {
  RxList<Drink> _teaList = <Drink>[].obs;

  RxList<Drink> get getteaList => _teaList;

  @override
  void onInit() {
    super.onInit();
    List<Drink> list = tealist;
    _teaList.addAll(list);
  }

  navigateToOrderScreen(int index) {
    Get.toNamed(Appconstants.orderroute, arguments: _teaList[index]);
  }
}
