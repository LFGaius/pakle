
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseLanguagePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 218, 0, 1),
      body: ListView(
        padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.15),
        children: <Widget>[
          SizedBox(
            height:MediaQuery.of(context).size.height*0.1,
          ),
          Text(
            'Choose your basic language',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(27, 34, 50, 1),
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
              shadows: [
                          BoxShadow(
                            blurRadius: 50,
                            spreadRadius:5,
                            color: Colors.black
                          )
                        ]
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.1),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width:MediaQuery.of(context).size.width*0.4,
                  height:MediaQuery.of(context).size.width*0.4,
                  child: RaisedButton(
                    color: Color.fromRGBO(27, 34, 50, 1),

                    elevation: 10,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'ENGLISH',
                      style: TextStyle(
                        color: Color.fromRGBO(250, 218, 0, 1),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          BoxShadow(
                            blurRadius: 12,
                            offset: Offset(0,10)
                          )
                        ]
                      ),
                    ),
                    onPressed: () {chooseOperation(context,'english');},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)
                    ),
                  ),
                ),
                
                SizedBox(height: MediaQuery.of(context).size.height*0.1),
                SizedBox(
                  width:MediaQuery.of(context).size.width*0.4,
                  height:MediaQuery.of(context).size.width*0.4,
                  child: RaisedButton(
                    color: Color.fromRGBO(27, 34, 50, 1),
                    elevation: 10,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'FRENCH',
                      style: TextStyle(
                        color: Color.fromRGBO(250, 218, 0, 1),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          BoxShadow(
                            blurRadius: 12,
                            offset: Offset(0,10)
                          )
                        ]
                      ),
                    ),
                    onPressed: () {chooseOperation(context,'french');},
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

  chooseOperation(BuildContext context,String language) async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString('pakle_language',language);
    //prefs.setString('pakle_language',null);
    Navigator.of(context).pushNamed('/onboarding');
  }
  
}
