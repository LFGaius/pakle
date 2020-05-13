
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pakle/afri_spinner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key, this.title}) : super(key: key);

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
          getUserPreferences().then((SharedPreferences prefs) {
            print(prefs.getString('pakle_language')==null);
            actionpending=false;
            errormessage='';
            if(prefs.getString('pakle_language')==null){//first time connection
              Navigator.of(context).popAndPushNamed(
                '/chooselanguage',
              );
            }else{
              if(prefs.getBool('pakle_is_login')==null || prefs.getBool('pakle_is_login')==false)
                Navigator.of(context).popAndPushNamed(
                  '/login',
                );
              else{
                Navigator.of(context).pushNamed(
                  '/home'
                );
              } 
            }
          });
      })
      .catchError((onError) {
        print(onError);
        setState(() {
          errormessage='Connection problem';
          actionpending=false;
          // exit(0); we will remove comment after
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
                child: Text('Powered by FrikArt')
              ),
            )
          ],
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<SharedPreferences> getUserPreferences() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs;
  }

  setActionPending(value){
    setState(() {
      actionpending=value;
    });
  }
}


