import 'package:coffee_shop_get/ui/widgets/greatday_widget.dart';
import 'package:coffee_shop_get/utils/global_constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final String title = "A Drink";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homescafold_color,
      body: SafeArea(
        child: Column(
          children: [greatday(context, title, hometitle_color)],
        ),
      ),
    );
  }
}
