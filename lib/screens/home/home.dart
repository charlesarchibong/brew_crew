import 'package:brew_crew/screens/home/brews_list.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().brew,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              tooltip: 'Logout',
              icon: Icon(Icons.account_circle),
              onPressed: () async {
                await _authService.signOut();
              },
            ),
            IconButton(
              tooltip: 'Setting',
              icon: Icon(Icons.settings),
              onPressed: () async {
                await _authService.signOut();
              },
            ),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
