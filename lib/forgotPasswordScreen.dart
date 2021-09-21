import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/RegisterScreen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<ForgotPasswordScreen> {
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
        title: Text('Forgot Password'),
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
                  )),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text('Send Reset Password Link'),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                    Navigator.pop(context);
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
