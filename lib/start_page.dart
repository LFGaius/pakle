
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pakle/afri_spinner.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  bool actionpending=false;
  String errormessage='';

   @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),() {
      setActionPending(true);
      Socket.connect('10.0.2.2',3000,timeout:Duration(seconds: 10))
      .then((res) {
        setState(() {
          actionpending=false;
          errormessage='';
        });
      })
      .catchError((onError) {
        print(onError);
        setState(() {
          errormessage='Connection problem';
          actionpending=false;
          //close the application
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 218, 0, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/pakle.jpg",
              width: MediaQuery.of(context).size.height*0.45
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.15,
            ),
            actionpending?
              AfriSpinner(
                width: MediaQuery.of(context).size.height*0.2,
              )
            :
              Container(
                height:MediaQuery.of(context).size.height*0.2,
                child: Center(
                  child: Text(
                    errormessage.toUpperCase(),
                    style: TextStyle(
                      color: Colors.red
                    ),
                  ),
                ),
              )
            ,
            Container(
              height:MediaQuery.of(context).size.height*0.1,
              child: Center(
                child: Text('Powered by ENOV')
              ),
            )
          ],
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  setActionPending(value){
    setState(() {
      actionpending=value;
    });
  }
}


