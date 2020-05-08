
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseLanguagePage extends StatefulWidget {

  @override
  _ChooseLanguagePageState createState() => _ChooseLanguagePageState();
}

class _ChooseLanguagePageState extends State<ChooseLanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 218, 0, 1),
      body: ListView(
        padding: EdgeInsets.only(top:0),
        children: <Widget>[
          SizedBox(
            height:MediaQuery.of(context).size.height*0.1,
          ),
          Text(
            'Choose your basic language',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(27, 34, 50, 0.9),
              fontWeight: FontWeight.bold,
              fontSize: 40.0,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.2),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                SizedBox( 
                  width:MediaQuery.of(context).size.width*0.8,
                  child: RaisedButton(
                    color: Colors.green,
                    elevation: 3,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'ENGLISH',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.8),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    onPressed: () {chooseOperation('english');},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)
                    ),
                  ),
                ),
                
                SizedBox(height: MediaQuery.of(context).size.height*0.1),
                SizedBox(
                  width:MediaQuery.of(context).size.width*0.8,
                  child: RaisedButton(
                    color: Colors.deepOrange,
                    elevation: 3,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'FRENCH',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.8),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    onPressed: () {chooseOperation('french');},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)
                    ),
                  ),
                )
                
              ]
            ),
          )
        ],
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  chooseOperation(String language) async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString('pakle_language',language);
    Navigator.of(context).pushNamed('/login');
  }
}
