import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/Login_Screen.dart';
import 'package:test_project/commonView/Toast.dart';
import 'package:test_project/myCart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool isLogin = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Home',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.green,
      ),
      home: isLogin
          ? MyHomePage(title: 'My First Flutter App with All Platform.')
          : LoginPage(title: "Login Page"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isLogin = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _openCart() {}

  void _openMyAccount(String msg) {
    // this._showToast(context, msg);
    Navigator.of(context).push(_loginPageRoute());
  }

  String _dropDownValue = "EN";
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
            builder: (context) => IconButton(
                  alignment: Alignment.center,
                  icon: Icon(
                    Icons.sort,
                    color: Colors.white,
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                )),
        actions: <Widget>[
          IconButton(
            alignment: Alignment.center,
            tooltip: isLogin ? 'My Account' : 'Sign In',
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            onPressed: () {
              _openMyAccount('Login');
            },
          ),
          IconButton(
            alignment: Alignment.center,
            tooltip: 'My Cart',
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(_createRoute());
            },
          ),
          IconButton(
              alignment: Alignment.center,
              tooltip: 'Settings',
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                this._showToast(context, 'Clicked on Setting');
              }),
          IconButton(
            alignment: Alignment.center,
            tooltip: 'More',
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {
              ToastMsg.showToast("More");
              // this._showToast(context, 'Clicked on More');
            },
          )
        ],
        title: Image.asset(
          'assets/images/ic_green_logo.png',
          fit: BoxFit.contain,
          height: 32,
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify widgets.
            key: Key(item),
            background: Container(color: Colors.red),
            // Provide a function that tells the app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(() {
                items.removeAt(index);
              });

              // Then show a snackBar.
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$item dismissed'),
                ),
              );
            },
            child: ListTile(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$item '),
                  ),
                );
              },
              title: Text(item),
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // _createHeader(),
            UserAccountsDrawerHeader(
              accountName: Text("Arsh Tarakwadiya"),
              accountEmail: Text("a.tarakwadiya95@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.android
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
            _createDrawerItem(
                icon: Icons.home,
                text: 'Home',
                onTap: () => {Navigator.pop(context)}),
            if (isLogin)
              _createDrawerItem(
                  icon: Icons.person,
                  text: 'My Profile',
                  onTap: () => Navigator.pop(context)),
            if (isLogin)
              _createDrawerItem(
                  icon: Icons.list_alt,
                  text: 'My Orders',
                  onTap: () => Navigator.pop(context)),
            Divider(),
            _createDrawerItem(
                icon: Icons.shopping_cart,
                text: 'My Cart',
                onTap: () => Navigator.of(context).push(_createRoute())),
            _createDrawerItem(
                icon: Icons.face,
                text: 'Authors',
                onTap: () => Navigator.pop(context)),
            _createDrawerItem(
                icon: Icons.account_box,
                text: 'Flutter Documentation',
                onTap: () => Navigator.pop(context)),
            _createDrawerItem(
                icon: Icons.stars,
                text: 'Useful Links',
                onTap: () => Navigator.pop(context)),
            Divider(),
            _createDrawerItem(
                icon: Icons.bug_report,
                text: 'Report an issue',
                onTap: () => Navigator.pop(context)),
            ListTile(
              title: Text('0.0.1'),
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Add New',
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
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
            color: Colors.green,
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

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        MyCart(title: "My Cart"),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _loginPageRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        LoginPage(title: "Login Page"),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
