
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'afri_spinner.dart';

class ProfilePage extends StatefulWidget {
  final String from;
  final Map<String,dynamic> userData;
  ProfilePage({this.from,this.userData});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 218, 0, 1),
      body: Center(
        child: Column(
          children: <Widget>[
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            '/home'
          );
        },
        backgroundColor: Color.fromRGBO(27, 34, 50, 1),
        child: Icon(
          Icons.home,
          color:Color.fromRGBO(250, 218, 0, 1)
        ),
      ),
    );

    
  }
  
}
