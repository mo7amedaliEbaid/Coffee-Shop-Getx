import 'package:coffee_shop_get/dummy_data/dummy_data.dart';
import 'package:get/get.dart';

import '../models/drink_model.dart';

class SearchController extends GetxController {
  RxList<Drink> _alldrinkslist = [...coffeelist, ...juicelist, ...tealist].obs;
  List<Drink> searchedfordrinks = [];
  var _isearching = 0.obs;

  get getSearchingState => _isearching.value;


  setSearchingstate(val) {
    _isearching.value = val;
  }
  List<Drink> getsearchedlist(userInputValue) {
    searchedfordrinks = _alldrinkslist
        .where(
            (e) => e.name.toLowerCase().contains(userInputValue.toLowerCase()))
        .toList();
    print(
        "llllllllllllength==${_alldrinkslist.length.toString()}");
    return searchedfordrinks;
  }

  /*bool issearching(){
    return true;
  }*/
}
