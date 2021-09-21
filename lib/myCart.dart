import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Home',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: MyCart(title: 'My First Flutter App with All Platform.'),
    );
  }
}

class MyCart extends StatefulWidget {
  MyCart({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  int _counter = 0;
  bool isLogin = false;

  void _incrementCounter() {
    setState(
      () {
        _counter++;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/ic_green_logo.png',
          fit: BoxFit.contain,
          height: 32,
        ),
      ),
      body: const Center(
        child: Text('My Cart'),
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData? icon, String? text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text!),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            color: Colors.purple,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('path/to/header_background.png'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Flutter Step-by-Step",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  void _showToast(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }
}
