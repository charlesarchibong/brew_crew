import 'package:brew_crew/screens/authenticate/register.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final AuthService _authService = AuthService();
  String email;
  String password;
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Register()));
            },
            icon: Icon(
              Icons.person_add,
              color: Colors.white,
            ),
            label: Text(
              'Register',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                onChanged: (value) {
                  email = value;
                },
                validator: (value) => value.isEmpty ? 'Enter an email' : null,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                onChanged: (value) {
                  password = value;
                },
                validator: (value) => value.length < 6
                    ? 'Enter a password of 6 or more characters'
                    : null,
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _authService.signIn(email, password).then((user) {
                      print(user);
                    }).catchError((error) {
                      print(error.toString());
                    });
                  }
                },
                child: Text('Sign in'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
