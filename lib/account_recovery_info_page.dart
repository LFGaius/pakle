
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'afri_spinner.dart';
import 'custom_text_field.dart';

class AccountRecoveryInfoPage extends StatefulWidget {

  @override
  _AccountRecoveryInfoPageState createState() => _AccountRecoveryInfoPageState();
}

class _AccountRecoveryInfoPageState extends State<AccountRecoveryInfoPage> {

  TextEditingController infoctrl=new TextEditingController();
  Map<String,String> errormsg={'global':''};
  bool actionpending=false;

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
                  );
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.75,
                child: actionpending ?
                  AfriSpinner(
                    width: MediaQuery.of(context).size.height*0.08,
                  )
                  :
                  Text(
                    errormsg['global'].toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize:12,
                    ),
                  ),
              )
            ]
          ),
          Text(
            'Recovery Informations',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(27, 34, 50, 0.9),
              fontWeight: FontWeight.bold,
              fontSize: 40.0,
            ),
          ),
          SizedBox(height: 3),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                CustomTextField(
                  controller:infoctrl,
                  hintText: 'Enter your email or username',
                  errorMessage: '',
                  obscureText: false,
                  icon:Icon(Icons.person)
                ),
                SizedBox(height: 10.0),
                SizedBox( 
                  width:MediaQuery.of(context).size.width*0.95,
                  child: RaisedButton(
                    color: Color.fromRGBO(27, 34, 50, 1),
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Color.fromRGBO(250, 218, 0, 1),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    onPressed: checkingOperation,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
              ]
            ),
          )
        ],
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  checkingOperation() async{
    try{
      setActionPending(true);
      String userData=jsonEncode(<String, String>{
          'info':infoctrl.text,
      });

      final response = await http.post(
        'http://10.0.2.2:3000/recoveryinfo',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: userData,
      );
      setActionPending(false);
      Map<String,dynamic> parsedbody=json.decode(response.body);//there will be the user id in success ccase
      if(response.statusCode!=200)
        setErrorMessages(parsedbody);
      else
        Navigator.of(context).pushNamed(
                          '/verificationcode',
                          arguments:{
                            'optype':'recoveryinfo',
                            'userData':parsedbody
                          }
                        );
      
    }catch(e){
      setState(() {
        if(e.runtimeType.toString()=='SocketException')
          errormsg['global']='Connection Problem!';
        else 
          errormsg['global']='Problem Encounted!';
        actionpending=false;
      });
    }
  }

  setActionPending(value){
    setState(() {
      actionpending=value;
    });
  }

  setErrorMessages(parsedbody){
    setState(() {
      errormsg['global']=parsedbody['globalError']!=null?parsedbody['globalError']['msg']:'';
    });
  }
}
