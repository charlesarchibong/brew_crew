import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {
  SignIn({this.toggleView});
  final Function toggleView;
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  String email;
  String password;
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String error = '';
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[900],
              elevation: 0.0,
              title: Text('Sign In'),
              actions: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    widget.toggleView();
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
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/table_bg.jpg'),
                    fit: BoxFit.cover),
              ),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: textFieldDecorationE,
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (value) =>
                          value.isEmpty ? 'Enter an email' : null,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: textFieldDecorationP,
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
                    error.isEmpty
                        ? Text(
                            '$error',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          )
                        : Text(''),
                    SizedBox(
                      height: 15,
                    ),
                    RaisedButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      color: Colors.brown[900],
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            loading = true;
                          });
                          _authService.signIn(email, password).then((user) {
                            if (user == null) {
                              setState(() {
                                loading = false;
                                error = 'An error occurred, Please try again';
                              });
                            }
                          }).catchError((error) {
                            print(error.toString());
                          });
                        }
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
