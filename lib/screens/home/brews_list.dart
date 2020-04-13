import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context) ?? [];

    return brews.isEmpty
        ? CircularProgressIndicator(
            strokeWidth: 2.0,
          )
        : ListView.builder(
            itemCount: brews.length,
            itemBuilder: (context, int index) {
              return BrewTile(brew: brews[index]);
            },
          );
  }
}
