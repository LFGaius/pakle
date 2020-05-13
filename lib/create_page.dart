
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'afri_spinner.dart';
import 'custom_text_field.dart';
// import 'package:pakle/afri_spinner.dart';

class CreatePage extends StatefulWidget {

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  @override
  void initState(){
    super.initState();
    FlutterSound flutterSound = new FlutterSound();
     flutterSound.startPlayer(null).then((String e)=>{});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 218, 0, 1),
      body: Container(),
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
