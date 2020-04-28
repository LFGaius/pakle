
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:pakle/afri_spinner.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailctrl=new TextEditingController();
  TextEditingController passwordctrl=new TextEditingController();

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
          Text(
            'Login',
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
                  controller: emailctrl,
                  decoration: InputDecoration(

                    prefixIcon: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(10)
                      ),
                      child: Icon(Icons.email)
                    ),
                    hintText: 'Enter your email address',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                    ),

                    filled: true,
                    fillColor: Color.fromRGBO(27, 34, 50, 0.1),
                  ),
                ),
                SizedBox(height: 20.0),
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
                    hintText: 'Enter your password',
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
                      'Login',
                      style: TextStyle(
                        color: Color.fromRGBO(250, 218, 0, 1),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/verificationcode',
                        arguments:{'optype':'login','userData':{'username':''}}
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/signup',
                          // arguments:'from login'
                        );
                      },
                    ),
                    Text(
                      ' | '
                    ),
                    FlatButton(
                      child: Text(
                        'Forgot password',
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/verificationcode',
                          arguments:'forgetlink'
                        );
                    //     Navigator.of(context).pushNamed(
                    //   '/changepass',
                    //   arguments:{
                    //       'optype':'forgottenpass',
                    //       'userData':{
                    //                     'email':widget.useremail,
                    //                     'password':passwordctrl.text,
                    //                     'rpassword':rpasswordctrl.text
                    //                   }
                    //     }
                    // );
                      },
                    )
                  ]
                )
              ]
            ),
          )
        ],
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
