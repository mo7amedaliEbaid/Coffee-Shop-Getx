import 'package:flutter/material.dart';

class Appconstants {


  static String homeroute = "/home";
  static String coffeeroute = "/coffee";
  static String orderroute = "/order";
  static String splashroute = "/splash";
  static String authroute = "/auth";
  static String juiceroute = "/juice";
  static String tearoute = "/tea";
  static String cartroute = "/cart";


  static List<String> catsimgs = [
    "images/cats/coffee.jpg",
    "images/cats/juice.jpg",
    "images/cats/tea.jpg"
  ];


  static List<Map<String, Object>> titleslist = [
    {
      'title': 'Home',
    },
    {
      'title': 'My Orders',
    },
    {
      'title': 'My Profile',
    },
    {
      'title': 'Settings',
    },
  ];


  static List<Map<String, IconData>> icons = [
    {
      'icon': Icons.home_filled,
    },
    {
      'icon': Icons.bookmark_border,
    },
    {
      'icon': Icons.person_pin,
    },
    {
      'icon': Icons.settings,
    },
  ];
}
