import 'package:coffee_shop_get/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/home_screen.dart';

class MainDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Image.asset('images/playstore.png'),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (_, __) => Divider(),
              itemBuilder: (ctx, index) => ListTile(
                title: InkWell(
                  onTap:  (){
                    Get.to(() => HomeScreen());
                  },
                  child: Text(
                   // "",
                    Appconstants.titleslist[index]['title'].toString(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                trailing: Icon(
                 Appconstants.icons[index]['icon'],
                 // Icons.add_alert,
                  color: Colors.brown,
                ),
              ),
              itemCount: Appconstants.titleslist.length,
            ),
          ),
        ],
      ),
    );
  }
}
