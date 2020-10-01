import 'package:flutter/material.dart';

const textFieldDecorationE = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  labelText: 'Email',
  hintText: 'Enter Email',
  labelStyle: TextStyle(fontSize: 15, color: Colors.brown),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.brown, width: 2),
  ),
  border:
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
);

const textFieldDecorationP = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  labelText: 'Password',
  hintText: 'Enter Password',
  labelStyle: TextStyle(fontSize: 15, color: Colors.brown),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.brown, width: 2),
  ),
  border:
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
);
