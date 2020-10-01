import 'package:brew_crew/screens/authenticate/register.dart';
import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool signInView = true;

  void toggleView() {
    setState(() {
      signInView = !signInView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return signInView
        ? SignIn(toggleView: toggleView)
        : Register(toggleView: toggleView);
  }
}
