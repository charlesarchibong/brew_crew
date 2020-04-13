import 'package:brew_crew/models/brew.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({this.brew});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 15.0,
      ),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 3.0, 20.0, 1.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[brew.strength],
            backgroundImage: AssetImage('assets/coffee_icon.png'),
          ),
          trailing: Icon(Icons.more_vert),
          title: Text(brew.name),
          subtitle: Text('Takes ${brew.sugars}  sugar(s)'),
        ),
        elevation: 5.0,
      ),
    );
  }
}
