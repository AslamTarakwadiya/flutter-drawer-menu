import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/Login_Screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<RegisterScreen> {
  late String name, email, phone;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameNameController = TextEditingController();
  TextEditingController emailNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  int? _radioSelected;
  String? _radioVal;

  @override
  void dispose() {
    // TODO: implement dispose
    firstNameController.dispose();
    lastNameNameController.dispose();
    emailNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Account'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
                child: Image.asset(
                  'assets/images/ic_green_logo_.png',
                  fit: BoxFit.contain,
                  height: 60,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TextField(
                  controller: lastNameNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Row(
                  children: <Widget>[
                    Text('Male'),
                    Radio(
                      value: 1,
                      groupValue: _radioSelected,
                      onChanged: (val) {
                        setState(
                          () {
                            _radioSelected = val as int?;
                            _radioVal = 'Male';
                            print(_radioVal);
                          },
                        );
                      },
                    ),
                    Text('Female'),
                    Radio(
                      value: 2,
                      groupValue: _radioSelected,
                      onChanged: (value) {
                        setState(
                          () {
                            _radioSelected = value as int?;
                            _radioVal = 'Female';
                            print(_radioVal);
                          },
                        );
                      },
                    ),
                    Text('Other'),
                    Radio(
                      value: 3,
                      groupValue: _radioSelected,
                      onChanged: (value) {
                        setState(
                          () {
                            _radioSelected = value as int?;
                            _radioVal = 'Other';
                            print(_radioVal);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter password',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TextField(
                  obscureText: true,
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm password',
                  ),
                ),
              ),
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text('Sign Up Now'),
                  onPressed: () {
                    print(firstNameController.text);
                    print(lastNameNameController.text);
                    print(emailNameController.text);
                    print(_radioVal);
                    print(passwordController.text);
                    print(confirmPasswordController.text);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Row(
                  children: <Widget>[
                    Text('Already registered?'),
                    FlatButton(
                      textColor: Colors.green,
                      child: Text(
                        'Sing in',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //Login screen
                        // Navigator.of(context).push(_loginRoute());
                        Navigator.pop(context);
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

Route _loginRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        LoginPage(title: "Create New Account"),
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
