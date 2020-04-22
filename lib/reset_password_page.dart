
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:pakle/afri_spinner.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {

  TextEditingController passwordctrl=new TextEditingController();
  TextEditingController rpasswordctrl=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 218, 0, 1),
      body: ListView(
        padding: EdgeInsets.only(top:0),
        children: <Widget>[
          Container(
            child: Image.asset(
              "assets/toplogin.png",
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right:MediaQuery.of(context).size.width*0.75),
            child: Row(
              children:<Widget>[
                IconButton(
                  icon:new Icon(
                    Icons.keyboard_arrow_left,
                    color: Color.fromRGBO(27, 34, 50, 1),
                    size: MediaQuery.of(context).size.width*0.1,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      '/login',
                      arguments:'from reset password'
                    );
                  },
                ),
              ]
            )
          ),
          Text(
            'Reset Password',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(27, 34, 50, 0.9),
              fontWeight: FontWeight.bold,
              fontSize: 40.0,
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: passwordctrl,
                  decoration: InputDecoration(

                    prefixIcon: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(10)
                      ),
                      child: Icon(Icons.vpn_key)
                    ),
                    hintText: 'New password',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                    ),

                    filled: true,
                    fillColor: Color.fromRGBO(27, 34, 50, 0.1),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: rpasswordctrl,
                  decoration: InputDecoration(

                    prefixIcon: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(10)
                      ),
                      child: Icon(Icons.vpn_key)
                    ),
                    hintText: 'Repeat password',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                    ),

                    filled: true,
                    fillColor: Color.fromRGBO(27, 34, 50, 0.1),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 10.0),
                SizedBox( 
                  width:MediaQuery.of(context).size.width*0.95,
                  child: RaisedButton(
                    color: Color.fromRGBO(27, 34, 50, 1),
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Color.fromRGBO(250, 218, 0, 1),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    onPressed: () {
                      // Navigator.of(context).pushNamed(
                      //   '/verificationcode',
                      //   arguments:'login'
                      // );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
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
}
