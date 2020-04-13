import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4', '5'];

  // form values
  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? CircularProgressIndicator(
                  strokeWidth: 2.0,
                )
              : Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Update your brew settings.',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: snapshot.data.name,
                          fillColor: Colors.white,
                          filled: true,
                          border: InputBorder.none,
                        ),
                        initialValue: snapshot.data.name,
                        validator: (val) =>
                            val.isEmpty ? 'Please enter a name' : null,
                        onChanged: (val) => setState(() => _currentName = val),
                      ),
                      SizedBox(height: 10.0),
                      DropdownButtonFormField(
                        value: _currentSugars ?? snapshot.data.sugars,
                        decoration: InputDecoration(
                          hintText: 'Sugar',
                          fillColor: Colors.white,
                          filled: true,
                          border: InputBorder.none,
                        ),
                        items: sugars.map((sugar) {
                          return DropdownMenuItem(
                            value: sugar,
                            child: Text('$sugar sugars'),
                          );
                        }).toList(),
                        onChanged: (val) =>
                            setState(() => _currentSugars = val),
                      ),
                      SizedBox(height: 10.0),
                      Slider(
                        value: (_currentStrength ?? snapshot.data.strength)
                            .toDouble(),
                        activeColor: Colors
                            .brown[_currentStrength ?? snapshot.data.strength],
                        inactiveColor: Colors
                            .brown[_currentStrength ?? snapshot.data.strength],
                        onChanged: (value) {
                          setState(() {
                            _currentStrength = value.round();
                          });
                        },
                        min: 100.0,
                        max: 900.0,
                        divisions: 8,
                      ),
                      SizedBox(height: 10.0),
                      RaisedButton(
                          color: Colors.brown[400],
                          child: Text(
                            'Update',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              await DatabaseService(uid: user.uid)
                                  .updateUserData(
                                      _currentSugars ?? snapshot.data.sugars,
                                      _currentName ?? snapshot.data.name,
                                      _currentStrength ??
                                          snapshot.data.strength);
                              Navigator.of(context).pop();
                            }
                          }),
                    ],
                  ),
                );
        });
  }
}
