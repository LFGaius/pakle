
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
// import 'package:pakle/afri_spinner.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController usernamectrl=new TextEditingController();
  TextEditingController emailctrl=new TextEditingController();
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
                      arguments:'from sign up'
                    );
                  },
                ),
              ]
            )
          ),
          Text(
            'Sign Up',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(27, 34, 50, 0.9),
              fontWeight: FontWeight.bold,
              fontSize: 40.0,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: usernamectrl,
                  decoration: InputDecoration(

                    prefixIcon: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(10)
                      ),
                      child: Icon(Icons.person)
                    ),
                    hintText: 'Enter your username',
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
                    hintText: 'Repeat your password',
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
                      'Sign Up',
                      style: TextStyle(
                        color: Color.fromRGBO(250, 218, 0, 1),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    onPressed: signupOperation,
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

  signupOperation() async{
    print('before callout');
    final response = await http.post(
      'http://10.0.2.2:3000/signup',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username':usernamectrl.text,
        'email':emailctrl.text,
        'password':passwordctrl.text,
        'rpassword':rpasswordctrl.text
      }),
    );
    print('res: '+json.encode(response));
    Navigator.of(context).pushNamed(
                        '/verificationcode',
                        arguments:'signup'
                      );
  }
}




