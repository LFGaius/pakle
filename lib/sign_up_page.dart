
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

  Map<String,String> errormsg={'global':'','email':'','username':'','password':''};
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
          Row(
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
              Container(
                width: MediaQuery.of(context).size.width*0.75,
                child: Text(
                  errormsg['global'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    
                  ),
                ),
              )
            ]
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
          
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                  width: MediaQuery.of(context).size.width*0.95,
                  child:Text(
                    errormsg['username'],
                    textAlign: TextAlign.left,
                    style:TextStyle(
                      color:Colors.red,
                      fontSize: 10,
                    )
                  )
                ),
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
                SizedBox(
                  height: 20.0,
                  width: MediaQuery.of(context).size.width*0.95,
                  child:Text(
                    errormsg['email'],
                    textAlign: TextAlign.left,
                    style:TextStyle(
                      color:Colors.red,
                      fontSize: 10,
                    )
                  )
                ),
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
                SizedBox(
                  height: 20.0,
                  width: MediaQuery.of(context).size.width*0.95,
                  child:Text(
                    errormsg['password'],
                    textAlign: TextAlign.left,
                    style:TextStyle(
                      color:Colors.red,
                      fontSize: 10,
                    )
                  )
                ),
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
    print('1before callout');
    String userData=jsonEncode(<String, String>{
        'username':usernamectrl.text,
        'email':emailctrl.text,
        'password':passwordctrl.text,
        'rpassword':rpasswordctrl.text
    });

    print('datas: ${userData}');
    final response = await http.post(
      'http://10.0.2.2:3000/signup',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: userData,
    );
    print('after callout');
    if(response.statusCode!=200){
      print(response.body);
      Map<String,dynamic> parsedbody=json.decode(response.body);
      errormsg['global']=parsedbody['globalError']!=null?parsedbody['globalError']['msg']:'';
      errormsg['email']=parsedbody['email']!=null?parsedbody['email']['msg']:'';
      errormsg['username']=parsedbody['username']!=null?parsedbody['username']['msg']:'';
      errormsg['password']=parsedbody['password']!=null?parsedbody['password']['msg']:'';
    }
    // Navigator.of(context).pushNamed(
    //                     '/verificationcode',
    //                     arguments:'signup'
    //                   );
  }
}




