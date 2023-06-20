import 'package:coffee_shop_get/controllers/tea_controller.dart';
import 'package:coffee_shop_get/view/widgets/greatday_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../consts/global_constants.dart';
import '../../controllers/order_controller.dart';
import '../widgets/drawer_widget.dart';

class TeaScreen extends StatelessWidget {
  final String title = "Tea";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late TeaController _teaController;

  @override
  Widget build(BuildContext context) {
    _teaController = Get.find<TeaController>();
    OrderController _ordercontroller=Get.put(OrderController());

    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade100,
        elevation: 0.0,
        bottomOpacity: 0.0,
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: Icon(
            Icons.sort,
            size: 35.0,
            color: Colors.black,
          ),
        ),
        actions: [
          //  AnimatedSearchBar(),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            greatday(context, title, Colors.brown.shade300),
            kSizedBox,
            Expanded(
              child: Obx(
                () => ListView.separated(
                  itemBuilder: (ctx, i) => ListTile(
                    onTap: () {
                      _ordercontroller.getCoffeeArgs(_teaController.getteaList[i]);
                      _teaController.navigateToOrderScreen(i);
                    },
                    title: Text(
                      _teaController.getteaList[i].name,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontSize: 24.0,
                            letterSpacing: 2.0,
                          ),
                    ),
                    subtitle: Text(
                      '\$ ${_teaController.getteaList[i].price.toString()}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Colors.brown.shade200,
                      child: Text(
                        '${i + 1}',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                  separatorBuilder: (_, __) => Divider(),
                  itemCount: _teaController.getteaList.length,
                ),
              ),
            ),
          ],
        ),
      ),
      drawerScrimColor: Colors.black54,
      drawer: MyDrawer(),
    );
  }
}
