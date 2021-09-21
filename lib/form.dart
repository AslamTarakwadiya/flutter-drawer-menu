import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RegisterScreen.dart';
import 'forgotPasswordScreen.dart';
import 'main.dart';

class MyCustomForm extends StatefulWidget {
  MyCustomForm({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _globalFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

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
        title: Text('Form Screen'),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/ic_green_logo_.png',
                  fit: BoxFit.contain,
                  height: 60,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text('Login'),
                  onPressed: () {
                    if (nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please enter your user name')),
                      );
                    } else if (passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please enter your password')),
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
