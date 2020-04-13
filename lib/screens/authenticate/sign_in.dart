import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final AuthService _authService = AuthService();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Center(
          child: RaisedButton(
            onPressed: () async {
              dynamic result = await _authService.signInAnon();
              if (result != null) {
              } else {
                print(result);
              }
            },
            child: Text('Sign In Anonymously'),
          ),
        ),
      ),
    );
  }
}
