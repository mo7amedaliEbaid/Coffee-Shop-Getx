import 'package:coffee_shop_get/controllers/juice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../consts/global_constants.dart';
import '../widgets/greatday_widget.dart';
import '../widgets/drawer_widget.dart';

class JuiceScreen extends StatelessWidget {
  final String title = "Juice";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late JuiceController _juiceController ;

  @override
  Widget build(BuildContext context) {
    _juiceController = Get.find<JuiceController>();
    return Scaffold(
        backgroundColor: Colors.orangeAccent.shade100,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent.shade100,
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
              greatday(context, title, Colors.orange),
              kSizedBox,
              Expanded(
                child: Obx(
                      () => ListView.separated(
                    itemBuilder: (ctx, i) => ListTile(
                      onTap: () {
                        _juiceController.navigateToOrderScreen(i);
                      },
                      title: Text(
                        _juiceController.getjuiceList[i].name,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: 24.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                      subtitle: Text(
                        '\$ ${_juiceController.getjuiceList[i].price.toString()}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Text(
                          '${i + 1}',
                          style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                    separatorBuilder: (_, __) => Divider(),
                    itemCount: _juiceController.getjuiceList.length,
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
