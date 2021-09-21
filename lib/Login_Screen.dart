import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/forgotPasswordScreen.dart';
import 'package:test_project/main.dart';

import 'RegisterScreen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(10, 5, 10, 50),
                child: Image.asset(
                  'assets/images/ic_green_logo_.png',
                  fit: BoxFit.contain,
                  height: 90,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                  Navigator.of(context).push(_forgotPasswordRoute());
                },
                child: Text('Forgot Password'),
              ),
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text('Login'),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve th1e text the that user has entered by using the
                          // TextEditingController.
                          title: Image.network(
                            'assets/images/ic_green_logo.png',
                            fit: BoxFit.contain,
                            height: 40,
                          ),
                          content: Text(nameController.text),
                          backgroundColor: Colors.green,
                        );
                      },
                    );

                    if (nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter your user name'),
                        ),
                      );
                    } else if (passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter your password'),
                        ),
                      );
                    } else {
                      print(nameController.text);
                      print(passwordController.text);
                      Navigator.pop(context);
                      Navigator.of(context).push(_homePageRoute());
                    }
                  },
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text('Does not have account?'),
                    FlatButton(
                      textColor: Colors.green,
                      child: Text(
                        'Sign up',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup screen
                        Navigator.of(context).push(_registerAccountRoute());
                      },
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Route _forgotPasswordRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        ForgotPasswordScreen(title: "Forgot Password Screen"),
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

Route _homePageRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        MyHomePage(title: "Forgot Password Screen"),
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

Route _registerAccountRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        RegisterScreen(title: "Create New Account"),
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
