import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
class Appconstants{
  static String homeroute="/home";
  static String coffeeroute="/coffee";
  static String orderroute="/order";
  static String splashroute="/splash";
  static String authroute="/auth";
  static List<String> catsimgs=[
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
 static List<Map<String,IconData >> icons=[
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


/*
void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final box = GetStorage();

  void _incrementCounter() {
    setState(() {
      _counter++;
      box.write('finalCount', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    box.writeIfNull('finalCount', 0);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get storage demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${box.read('finalCount')}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
